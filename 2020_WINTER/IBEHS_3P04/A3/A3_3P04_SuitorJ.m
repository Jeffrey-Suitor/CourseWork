clear; close; clc;

force_plate_data = readmatrix('woman gait analysis data.xlsx','Sheet','force plate data');
time = force_plate_data(:,1);
f1 = force_plate_data(:,2);
f2 = force_plate_data(:,3);

figure(1)
plot(time, f1,".", time, f2, ".")
title('Time vs F1 and F2 Vertical Reaction Force')
xlabel('Time (s)')
ylabel('Vertical Reaction Force (N)')

frequency = 1 / (time(2) - time(1));
fprintf("The frequency is %g Hz\n", frequency);

for i=1:length(time)
    if f1(i) > f2(i)
        fprintf("The woman steps on plate 1 first.\n")
        break
    elseif f1(i) < f2(i)
        fprintf("The woman steps on plate 2 first.\n")
        break
    end
end

f1_max = max(f1);
f2_max = max(f2);
force_diff = f1_max - f2_max;
if force_diff > 0
    fprintf("The right foot force is %gN, max left foot force is %gN, and the right foot exerts %gN more.\n", f1_max, f2_max, abs(force_diff))
else
    fprintf("The right foot force is %gN, max left foot force is %gN, and the left foot exerts %gN more.\n", f1_max, f2_max, abs(force_diff))
end

f1_ratio = f1_max / 62;
f2_ratio = f2_max / 62;
if f1_max > f2_max
    mgf_ratio = f1_max / (62*9.81);
else
    mgf_ratio = f2_max / (62*9.81);
end

fprintf("The right foot ground force as a percentage of bodyweigh is %gN/kg and the left foot ground force is %gN/kg and the max ground force as body weights is %g.\n", f1_ratio, f2_ratio, mgf_ratio)

f1_indexes = find(f1);
f1_duration = time(f1_indexes(end)) - time(f1_indexes(1));

f2_indexes = find(f2);
f2_duration = time(f2_indexes(end)) - time(f2_indexes(1));

fprintf("The right foot stance phase is %gs and the left foot stance duration is %gs.\n",f1_duration,f2_duration)

if abs(f1_duration - f2_duration)/f1_duration > 0.1
    fprintf("The woman has gait asymmetry.\n")
else
    fprintf("The woman displays no signs of gait asymmetry.\n")
end

ds_indexes = intersect(f1_indexes,f2_indexes);
ds_duration = time(ds_indexes(end)) - time(ds_indexes(1));
fprintf("The right foot double stance phase is %gs.\n\n",ds_duration)


position_data = readmatrix('woman gait analysis data.xlsx','Sheet','Sacrum marker data');
time = position_data(:,1);
x = position_data(:,2);
y = position_data(:,3);
z = position_data(:,4);

figure(2)
plot(time, x, ".", time, y, ".", time, z, ".")
xlabel("Time(s)")
ylabel("Position (m)")
legend("x","y","z")
title("TIme position graph for x,y,z")

fprintf("x = forward_progression\ny = medial_lateral\nz = vertical\n")

end_index = find(time<=0.98);
x_displacement = x(end) - x(1);
x_velocity = x_displacement / 0.98;
fprintf("The x displacement from 0 to 0.98 seconds is %gm and an average velocity of %gm/s.\n", x_displacement, x_velocity)

medial_lat_dis = max(y) - min(y);
vertical_dis = max(z) - min(z);
fprintf("The woman's vertical range of motion is %gm and the woman's medical lateral displacement is %gm.\n", vertical_dis, medial_lat_dis)

vel = zeros(1,length(time)-1);
for i=1:length(time)-1
    vel(i) = (x(i+1) - x(i))/(time(i+1) - time(i));
end

figure(3)
plot(time(2:end),vel,"*-")
title("Forward Velocity")
xlabel("Time(s)")
ylabel("Forward Velocity (m/s)")
ylim([1.45,2.1])
s_vel = smoothdata(vel,'movmean', 5);

figure(4)
plot(time(2:end),s_vel, "*-")
title("Smoothed Forward Velocity")
xlabel("Time(s)")
ylabel("Forward Velocity (m/s)")
ylim([1.45,2.1])
fprintf("The filtered max forward velocity is %gm/s and the minimum forward velocity is %gm/s.\n\n", max(s_vel), min(s_vel))

fprintf("You would use the 3 marker triads on the thigh and shank to build their respective technical coordinate systems.\n")
fprintf("Thigh = greater trochanter, the lateral epicondyle, and the medial epicondyle\nshank = lateral malleolus, the medial malleolus, and the fibular head \n")
fprintf("You can use the first few frames to calculate the offset between the shank and the thigh in the technical coordinate system and then in all frames were you lack the thigh you can generate it based off that offset from the shank because both are in the technical coordinate system.\n")