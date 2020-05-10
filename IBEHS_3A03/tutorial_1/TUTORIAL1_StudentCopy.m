%{
IBEHS 3A03 - Biomedical Signals and Systems
Tutorial 1
Introduction to MATLAB

The following MATLAB code is provided to you as examples.
%}

%%
%{
Getting started
- Clearing workspace
- Clearing command window
%}

clear;
close all;
clc;
%%
clear;
close all;
clc;

%{
This section is used to demonstrate writing scripts. 

Specifically:
- Making a script
- Running script
- Comments
- Semi-colons
- Running Sections
%}

x = 4;
x = x + 3;

y = magic(1000);

%%
clear;
close all;
clc;

%{
This section is used to demonstrate vectors.

Specifically:
- Transposing
- Accessing specific rows/columns
%}

sig0 = 7;
sig1 = [1,2,3,4,5];
sig2 = sig1'; 
sig2 = transpose(sig1);

sig3 = magic(3);
sig3(:,1);
sig3(:,1:2);
sig3(1,:);
sig3(1:2,:);

%sig4 = sig1(0) %What happens here?
%%
clear;
close all;
clc;

%{
This section is used to demonstrate the dot operator.

Specifically:
- Vector Operations vs Discrete Operations
%}

vector1 = [3,4];
vector2 = [2,5];
%vector3 = vector1*vector2; 
vector3 = vector1.*vector2;

%%
clear;
close all;
clc;

%{
This section is used to demonstrate basic loops.

Specifically:
- For-Loops
%}

x = 0;
for i=1:100
    x = x + 1;
end

%%
clear;
close all;
clc;

%{
This section is used to demonstrate basic conditionals.

Specifically:
- if
- if-else
- if-elseif
%}

signal = [1,2,3,4,5];
if signal(1)==0
    disp('First element is 0.')
elseif sum(signal)>15
    disp('Sum is greater than 15')
else
    disp('No issues.')
end

%%
clear;
close all;
clc;

%{
This section is used to demonstrate combining loops and conditions

Specifically:
- Using loops to check for specific values
%}

signal = [1,7,4,0,3]; 
threshold = 3;

for i=1:length(signal)
    if signal(i)>threshold
        disp(['Threshold has been passed at index ',num2str(i)])
        break
    end
end

%%

clear;
close all;
clc;

%{
This section is used to demonstrate calling functions

Specifically:
- Calling a pre-written function
- Built-in help
%}

signal = [1,7,4,0,3];
[max,index] = find_max(signal);

%help stem;
%%

clear;
close all;
clc;

%{
This section is used to demonstrate Discrete-Time Plots

Specifically:
- DT Plots using stem
%}

x = linspace(-pi,pi,50);
y = sin(x);

stem(y)

title('Discrete sin(x)')
xlabel('x-values')
ylabel('y-values')


%%
clear;
close all;
clc;

%{
This section is used to demonstrate Continuous-Time Plots

Specifically:
 CT Plots using fplot
%}

y = @(x) sin(x);
fplot(y)

title('Continuous sin(x)')
xlabel('x-values')
ylabel('y-values')

%xlim([-pi,pi])
%ylim([-1,1])

%%
clear;
close all;
clc;

%{
This section is used to demonstrate the Workspace

Specifically:
- Saving Workspace variables
- Loading Workspace variables
%}

x = 9;
y = 12;

save('SAVED_VARIABLES')

clear;

%load SAVED_VARIABLES.mat
