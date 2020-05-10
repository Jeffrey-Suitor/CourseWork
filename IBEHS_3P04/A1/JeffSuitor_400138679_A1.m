clc; clear; close; % Clear everything

data_table = readtable('3P04 Winter 2020 Assignment 1 Data.xls');  % Open table
col_names = table2array(data_table(4,:));
data_array = table2array(data_table(5:104,2:13));  % Convert to cell array
data_array = str2double(data_array);  % Cell array to double array
cols = 12;

% Get the points form excel
points = get_avg_points(cols, 4, 3, data_array);

fprintf("The mean values for triad 1 are x:%e, y:%e, z:%e" + newline, points(1,:));
fprintf("The mean values for triad 2 are x:%e, y:%e, z:%e" + newline, points(2,:));
fprintf("The mean values for triad 3 are x:%e, y:%e, z:%e" + newline, points(3,:));
fprintf("The mean values for the virtual porint are x:%e, y:%e, z:%e" + newline, points(4,:));


% Get the coordinates
origin = points(3,:);
y = points(1,:) - origin;
v2 = points(2,:)- origin;
x = cross(y, v2);
z = cross(x,y);
global_coords = diag([1,1,1]);

% Create the system and make sure its orthonormal
coor_sys = [norm_vect(x); norm_vect(y); norm_vect(z);];
fprintf( newline + "LCS with Triad 3 at center is" + ...
         newline + "[ %e, %e, %e]i" + ...
         newline + "[ %e, %e, %e]j" + ...
         newline + "[ %e, %e, %e]l" + newline, coor_sys);
     
disp(newline + "Coordinate system has been normalized")
ortho_result = test_ortho(coor_sys(1,:), coor_sys(2,:), coor_sys(3,:));

pose = make_pose_matrix(global_coords, coor_sys, origin);
disp("Pose Matrix with translation and rotation:")
disp(pose)
disp("Q1 Complete")

% Question 2
free_point_global = ones(4,1);
free_point_global(1:3) = points(4,:) % Get the free point
global_to_local_pose = inv(pose);
free_point_local = global_to_local_pose * free_point_global
fprintf("Coordinates of free marker in local coordinat e system x:%f, y:%f, z:%f" + newline, free_point_local(1:3));

% Question 3
data_table = readtable('3P04_Moving_Data.xlsx');  % Open table
col_names = table2array(data_table(4,:));
data_array = table2array(data_table(5:304,2:10));  % Convert to cell array
data_array = str2double(data_array);  % Cell array to double array
cols = 9;

% Get the points form excel
start_point = get_points(cols, 1, 3,3, data_array);
end_point = get_points(cols, 300, 3,3, data_array);

% Get the coordinates for start
origin = start_point(2,:);
y = start_point(1,:) - origin;
v2 = start_point(3,:)- origin;
x = cross(y, v2);
z = cross(x,y);
global_coords = diag([1,1,1]);
% Create the system and make sure its orthonormal
coor_sys = [norm_vect(x); norm_vect(y); norm_vect(z);];
ortho_result = test_ortho(coor_sys(1,:), coor_sys(2,:), coor_sys(3,:));
start_pose = make_pose_matrix(global_coords, coor_sys, origin);

% Get the coordinates
origin = end_point(2,:);
y = end_point(1,:) - origin;
v2 = end_point(3,:)- origin;
x = cross(y, v2);
z = cross(x,y);
global_coords = diag([1,1,1]);

% Create the system and make sure its orthonormal
coor_sys = [norm_vect(x); norm_vect(y); norm_vect(z);];
ortho_result = test_ortho(coor_sys(1,:), coor_sys(2,:), coor_sys(3,:));
end_pose = make_pose_matrix(global_coords, coor_sys, origin);


% Create the global frames for the end pose
local_to_global_pose = start_pose;
free_point_global_start = local_to_global_pose * free_point_local;

local_to_global_pose = end_pose;
free_point_global_end = local_to_global_pose * free_point_local;
total =  free_point_global_end - free_point_global_start;

disp("There is a weird bug with printing sorry can't fix.")

fprintf("The total amount of movement in the axis is (%e, %e, %e)", total);
fprintf(newline + "The total non-directional movement of the free point is %e", norm(total));



function points = get_points(col_num, row_num, out_rows, out_cols, data_array)
    
    points = zeros(out_rows,out_cols);  % We are only working with 4 points so lets group
    col = 1; row = 1;
    for excel_col=1:col_num
        points(row,col) = data_array(row_num, excel_col);
        if mod(excel_col,3) == 0
           row = row + 1;
           col = 1;
        else
            col = col + 1;
        end
    end
    disp("Points created" + newline)
end

function pose_matrix = make_pose_matrix(glob_coords, norm_coords, local_cords)

    pose_matrix = zeros(4,4);
    for i=1:3
        pose_matrix(i,4) = local_cords(i);
        for j=1:3
            pose_matrix(i,j) = dot(glob_coords(i,:), norm_coords(j,:));
        end
    end
    pose_matrix(4,4) = 1;
end

function points = get_avg_points(col_num, out_rows, out_cols, data_array)
    
    points = zeros(out_rows,out_cols);  % We are only working with 4 points so lets group
    col = 1; row = 1;
    for excel_col=1:col_num
        points(row,col) = mean(data_array(:,excel_col));
        if mod(excel_col,3) == 0
           row = row + 1;
           col = 1;
        else
            col = col + 1;
        end
    end
    disp("Average points created" + newline)
end

function out = norm_vect(vector)
    out = vector / norm(vector);
end

function result = test_ortho(v1, v2, v3)

    disp("Testing if dot products are 0")
    t1 = dot(v1,v2) < 10^-16;
    t2 = dot(v1,v3) < 10^-16;
    t3 = dot(v2,v3) < 10^-16;
    
    if t1 == 0 || t2 == 0 || t3 ==0
        result = 0;
        disp("SYSTEM IS NOT ORTHONORMAL" + newline)
    else
        result = 1;
        disp("SYSTEM IS ORTHONORMAL" + newline)
    end
end