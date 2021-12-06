clear;
close all;
clc;

S = load("MyWorkspace.mat");
time = S.t;
data = S.MyData;
%whos -file MyWorkspace.mat;
plot(time, data);
xlim([0 15]);

title('3A03 Tutorial 1 Challenge');
xlabel('time');
ylabel('values');