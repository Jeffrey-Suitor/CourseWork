% Setup
h = helper_functions; % Create a helper_functions object
test = assignment_1_tester; % Create an assignment_1_tester object
h.reset(); % Reset the workspace
number_of_cases = 1000; % Assign the number of test cases
sys_vector = {@system0, @system1, @system2, @system3, @system4, @system5}; % Create a vector of function calls
display_graphs = false;
format long

if display_graphs
    number_of_cases=1;
end

% Generate the response matrices (Systems x number_of_cases)
lin_rslt = zeros(length(sys_vector), number_of_cases);
tim_rslt = lin_rslt;
caus_rslt = lin_rslt;
mem_rslt = lin_rslt;

% Run test cases
for test_case=1:number_of_cases
    n_start = randi([-1000 0]); %Generate a random start number
    n_end = randi([0 1000]); % Generate a random end number
    n = n_start:1:n_end; % Create an n-vector that spans the start and end numbers
    x = randi([-10000 10000],1,length(n)); % Create an x vector that is the same size as n but with ints from -10000 to 10000
    
    % If we are displaying the graphs
    if display_graphs
        n_start = randi([-20 0]); %Generate a random start number
        n_end = randi([0 20]); % Generate a random end number
        n = n_start:1:n_end; % Create an n-vector that spans the start and end numbers
        x = randi([-1000 1000],1,length(n)); % Create an x vector that is the same size as n but with ints from -100 to 100
    end
    
    for system=1:length(sys_vector) %  Iterate through the systems
        lin_rslt(system, test_case) = test.linearity_test(sys_vector{system},n,x,-2, system, display_graphs); % Test linearity
        %h.reset()
        tim_rslt(system, test_case) = test.time_variance_test(sys_vector{system},n,x,3, system, display_graphs); % Test time-invariance
        %h.reset()
        caus_rslt(system, test_case) = test.causality_test(sys_vector{system},n, system, display_graphs); % Test causality
        %h.reset()
        mem_rslt(system, test_case) = test.memory_test(sys_vector{system},n, system, display_graphs, 6); % Test memory
        %h.reset()
    end
end

fprintf("Linearity :\n");
test.calculate_results(sys_vector, lin_rslt, "Non-Linear", "Linear", display_graphs) %Display linearity results
fprintf("Time Variance :\n");
test.calculate_results(sys_vector, tim_rslt,  "Time-Invariant", "Time-Variant", display_graphs) % Display time invariance results
fprintf("Causality :\n");
test.calculate_results(sys_vector, caus_rslt, "Non-Causal", "Causal", display_graphs) % Display causality results
fprintf("Memory :\n");
test.calculate_results(sys_vector, mem_rslt,  "Memoryless", "Memory", display_graphs) % Display memory results
