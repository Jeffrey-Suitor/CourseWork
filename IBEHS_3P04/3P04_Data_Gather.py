# This code is designed to gather data from the esp32 and save the data as a txt file

import bluetooth
import csv
import time

def get_address(target_name): # Find bluetooth device from a name
	while True:
		nearby_devices = bluetooth.discover_devices()
		for bdaddr in nearby_devices:
			if target_name == bluetooth.lookup_name(bdaddr):
				print("Device found")
				return bdaddr

if __name__ == "__main__":
	collection_time = 10
	header = ["time", "toe_fsr", "heel_fsr", "emg"]
	mac_address = get_address("OOF.png")
	# Create the client socket
	client_socket = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
	print("Connecting to device")
	client_socket.connect((mac_address, 1))
	print("Connected to device")

with open("kierra_equinas_severe_3_data.csv", "w+", newline="") as f: # CSV to write to
	f.truncate(0) # Clear file
	writer = csv.writer(f, delimiter=",")
	writer.writerow(header)
	start_time = time.time()
	session_time = 0
	print("Beginning data collection")

	while session_time < collection_time:
		data = client_socket.recv(15) # Length of incoming bytes is 15
		data_array = data.decode().split("|") # Split along pipe chars
		del data_array[-1] # Delete the last element which is just a variable length of 0's
		session_time = time.time() - start_time # Update session time
		data_array.insert(0, session_time) # insert the current time
		writer.writerow(data_array) # Write the row of data

print("Session complete")
client_socket.close()
