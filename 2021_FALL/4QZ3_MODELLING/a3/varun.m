%% Question 2
load Q2.mat;

% Seperate the different goats within the dataset
goat1 = goat(:,1);
goat2 = goat(:,2);
goat3 = goat(:,3);
goat4 = goat(:,4);
goat5 = goat(:,5);
goat6 = goat(:,6);

% Assumptions: Cosinor analysis uses the least squares method to fit a sine
% wave to a time series. Cosinor analysis is often used in the analysis of
% biologic time series that demonstrate predictible rhythms. This method
% can be used with an unequally spaced time series.

% Convert into degrees
% Starts at 8am, 15 deg/hour (360 degrees per 24 hours), 8*15

count = 120;

for i=1:1:80
    Timedata(i,1)=count;
    count = count + 45; %3 hours between measurements
    i=i+1;
end

Timedata=Timedata/360; %Normalizes times, converts the time to fractions of a day

%plot(Timedata,goat1);

cosinor(Timedata,goat1,2*pi,0.05) %Explain text output for each animal

% Mesor same as average of cycle averages (total average)
mean(goat1(1:8)); %3 hour time interval
mean(goat1); %Same as mesor

% Amplitude of the resulting wave not the data
max(goat1)
min(goat1)

% Amplitude is hypoteneuse of x and y coordinates in Acrophase plot, show
% this calculation

% Acrophase
disp("hello")
acro = -6.09421;
acro = radtodeg(-6.09421) /360 * -1
xline(acro) %Plot on cosinor and data figure, answers time of day with peak, direction of the acrophase plot
xline(1) 

% Convert acrophase to a time of day
acrotime = (acro*24) % Direction of the arm in the cosinor graph

% P value is how good the cosinor model is compared to the dataset, small
% means data is very close and well-fitted to the model. Also look at size
% of the circle in the cosinor graph. If circle surrounds acrophase and
% amplitude line then p-value is too large.

% RSS and CI
yline(mean(goat1),'k', {'Mean Mesor'})
yline(mean(goat1 + 0.37))% Amplitude
yline(mean(goat1 - 0.37))% Amplitude
yline(mean(goat1 + 0.52),'--r', {'Upper CI'})
yline(mean(goat1 - 0.52),'--r', {'Upper CI'})
yline(mean(goat1 + 0.21),'--b', {'Lower CI'})
yline(mean(goat1 - 0.21),'--b', {'Lower CI'})

repeat for other 5 goats ^
