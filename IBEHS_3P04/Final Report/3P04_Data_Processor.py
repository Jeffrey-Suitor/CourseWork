import csv
import matplotlib.pyplot as plt
from scipy.signal import savgol_filter
from scipy.stats import tmean
from sklearn.metrics import auc


def get_data(name, trim_time=3):  # Get the data from the spreadsheet
    with open(name, "r", newline="") as f:
        reader = csv.reader(f, delimiter=",")
        time = []
        emg = []
        toe_fsr = []
        heel_fsr = []
        next(reader)

        for row in reader:
            cur_time = float(row[0])
            if cur_time >= trim_time:  # How many seconds to trim from start of data
                time.append(cur_time)
                toe_fsr.append(int(row[1]))
                heel_fsr.append(int(row[2]))
                emg.append(int(row[3]))

        return time, toe_fsr, heel_fsr, emg


def area_under_curve(time_stamps, gait, emg, interval):
    start_index = 0
    auc_list = []
    for i in range(len(time_stamps)):

        if gait[i] == 1 and gait[i-1] != 1:  # If the gait is 1 and previously it was not
            start_index = i # Start recording

        elif gait[i] == 0 and gait[i - 1] == 1: # When the gait is 0 after previously being 1
            # Check to see if the duration when it was just 1 is longer than the interval time
            if time_stamps[i] - time_stamps[start_index] > interval:

                # Slice lists based on the start index and ending index
                time_per_step = time_stamps[start_index:i]
                emg_per_step = emg[start_index:i]
                auc_val = auc(time_per_step, emg_per_step)
                auc_list.append([auc_val, time_per_step, emg_per_step])



    return auc_list


if __name__ == "__main__":
    time, toe_fsr, heel_fsr, emg = get_data("kierra_equinas_severe_1_data.csv")

    # Apply Savgol filters
    toe_fsr = savgol_filter(toe_fsr, 53, 3)
    heel_fsr = savgol_filter(heel_fsr, 53, 3)
    emg = savgol_filter(emg, 61, 3)

    # Create threshold value
    heel_threshold = tmean(heel_fsr, (1, 4096))
    toe_threshold = tmean(toe_fsr, (1, 4096))

    # Threshold the data
    toe_square_sig = (toe_fsr > toe_threshold)
    heel_square_sig = (heel_fsr > heel_threshold)

    # Create the gait and emg
    gait_pattern = [sum(x) for x in zip(heel_square_sig, toe_square_sig)]
    emg = [x - min(emg) for x in emg]
    emg = [x / max(emg) * 2 for x in emg]

    # Plot Setup
    fig, axs = plt.subplots(2, 1)
    axs[0].plot(time, gait_pattern)
    axs[0].set_xlabel('time')
    axs[0].set_ylabel('Gait Pattern')
    axs[0].grid(True)

    auc_list = area_under_curve(time, gait_pattern, emg, 0.5)
    auc_vals = []
    auc_time = []
    auc_emg = []

    for item in auc_list:
        auc_vals.append(item[0])
        auc_time.append(item[1])
        auc_emg.append(item[2])

    axs[1].plot(time, gait_pattern)
    for i in range(len(auc_time)):
        # For each value where we needed to use the EMG plot the curve
        if auc_vals[i] != max(auc_vals): # Plot a green cruve if not the max auc
            axs[1].plot(auc_time[i], auc_emg[i], color="green")
            print("GREEN")
        else: # Plot a red curve for highest auc
            axs[1].plot(auc_time[i], auc_emg[i], color="red")
            print("RED")

    axs[1].set_xlabel('time')
    axs[1].set_ylabel('EMG Step Overlay')

    plt.show()
