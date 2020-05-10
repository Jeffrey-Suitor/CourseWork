import matplotlib.pyplot as plt
from scipy.signal import savgol_filter
from scipy.stats import tmean
import bluetooth
import csv
import time
from sklearn.metrics import auc
import numpy as np


def bluetooth_connect(target_name):
	while True:
		nearby_devices = bluetooth.discover_devices() # Discover nearby devices
		mac_address = None
		for mac_address in nearby_devices:
			if target_name == bluetooth.lookup_name(mac_address): # If we find desired device name
				print("Device found")

				# Create the client socket
				client_socket = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
				print("Connecting to device")
				client_socket.connect((mac_address, 1))
				print("Connected to device")
				return client_socket


if __name__ == "__main__":
	collection_time = 10 # How many seconds to collect data for
	header = ["time", "toe_fsr", "heel_fsr", "emg"] # Spreadsheet headers
	connection = bluetooth_connect("OOF.png")

	with open("test.csv", "w+", newline="") as f:

		# CSV Creation
		f.truncate(0) # Clear file
		writer = csv.writer(f, delimiter=",")
		writer.writerow(header)

		# Setup
		max_length = 100
		start_time = time.time()
		toe_fsr = np.zeros(max_length)
		heel_fsr = np.zeros(max_length)

		# Plot Setup
		session_time = 0
		heel_touch_time = 0
		timestamps = np.zeros(max_length)
		emg = np.zeros(max_length)
		fig, axs = plt.subplots(2, 1)
		axs[0].set_xlabel('Time (s)')
		axs[0].set_ylabel('Gait Pattern')
		axs[1].set_xlabel('Time (s)')
		axs[1].set_ylabel('Toe Pattern')

		print("Beginning data collection")
		while session_time < collection_time:

			# Get data
			data = connection.recv(15)
			data_array = data.decode().split("|")
			del data_array[-1]

			# Get time
			current_time = time.time()

			# Write CSV
			session_time = current_time - start_time
			data_array.insert(0, session_time)
			writer.writerow(data_array)

			timestamps = np.append(timestamps, [session_time])[-max_length:]
			toe_fsr = np.append(toe_fsr, [int(data_array[1])])[-max_length:]
			heel_fsr = np.append(heel_fsr, [int(data_array[2])])[-max_length:]
			emg = np.append(emg, [int(data_array[3])])[-max_length:]

			# Apply savgol filtering
			toe_fsr = savgol_filter(toe_fsr, 53, 3)
			heel_fsr = savgol_filter(heel_fsr, 53, 3)
			emg = savgol_filter(emg, 61, 3)

			try:
				heel_threshold = tmean(heel_fsr, (1, 4096))
				toe_threshold = tmean(toe_fsr, (1, 4096))
				emg_threshold = tmean(emg, (1, 4096))
			except ValueError: # Error due to insufficient data length
				heel_threshold = tmean(heel_fsr, (0, 4096))
				toe_threshold = tmean(toe_fsr, (0, 4096))
				emg_threshold = tmean(emg, (0, 4096))

			# Threshold
			toe_square_sig = (toe_fsr > toe_threshold)
			heel_square_sig = (heel_fsr > heel_threshold)
			emg_square_sig = (emg > emg_threshold)

			gait_pattern = [sum(x) for x in zip(heel_square_sig, toe_square_sig)]
			toe_pattern = [sum(x) for x in zip(emg_square_sig, toe_square_sig)]

			# Send LED feedback
			if gait_pattern[-1] == 2:
				state = "GREEN\n"
				heel_touch_time = current_time
			elif gait_pattern[-1] == 1:
				if current_time - heel_touch_time > 10:
					if auc(time[-20:], emg_square_sig[-20:]) < auc(time[-100:], emg_square_sig[-100:])/5:
						state = "GREEN\n"
					elif auc(time[-20:], emg_square_sig[-20:]) < auc(time[-100:], emg_square_sig[-100:])/4.5:
						state = "BLUE\n"
					else:
						state = "RED\n"

				elif current_time - heel_touch_time > 2:
					state = "RED\n"
				else:
					state = "BLUE\n"
			else:
				state = "NONE\n"

			connection.send(state)
			print(state)

			# Show the plots
			axs[0].clear()
			axs[1].clear()
			axs[0].plot(timestamps, gait_pattern)
			axs[1].plot(timestamps, toe_pattern)

			plt.draw()
			plt.pause(0.001)

	print("Session complete")
	connection.close()

