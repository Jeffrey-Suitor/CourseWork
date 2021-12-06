classdef assignment_2_tester
    methods(Static)  
        
        % Get impulse response output
        function impulse_output = calc_impulse_output(function_call, sys_number, display_graphs)
            impulse_output = impulse(function_call);
            if display_graphs
                figure;
                stem(n,impulse_output);
                string = ["Impulse output : System" num2str(sys_number-1)];
                sgtitle(string);
            end
            if display_graphs
                waitforbuttonpress;
            end
        end
        
        
        % Get impulse response output
        function unit_step_output = calc_unit_step_output(function_call, sys_number, display_graphs)
            x = -5:10;
            n = -5:10;
            unit_step_output = function_call(unitstep(x), n);
            if display_graphs
                figure;
                stem(n,unit_step_output);
                string = ["Impulse output : System" num2str(sys_number-1)];
                sgtitle(string);
            end
            if display_graphs
                waitforbuttonpress;
            end
        end

        
        
        % Test Causality
        function causality_result = causality_test(function_call, n, sys_number, display_graphs)
            input_0 = zeros(1, length(n)); % Create an array of 0s of n length
            input_0(1) = 1; % Change the first element to 1
            input_1 = ones(1, length(n)); % Create an array of n length of 1s
            result_0 = function_call(n, input_0); % Get the result of the 0s array
            result_1 = function_call(n, input_1); % Get the result of the 1s array 
            if display_graphs
                figure
                subplot(1,2,1);
                stem(n,result_0);
                subplot(1,2,2);
                stem(n,result_1)
                string = ["Causality : System" num2str(sys_number-1)];
                sgtitle(string);
            end
            if abs(result_0(1) - result_1(1)) > 0.000001
                %disp("Non-Causal");
                causality_result = 0;
            else
                %disp("Causal");
                causality_result = 1;
            end
            if display_graphs
                waitforbuttonpress;
            end
        end

        
        % Test Memory
        function memory_result = memory_test(function_call, n, sys_number, display_graphs, change_value)
            input_0 = zeros(1, length(n)); % Create an array of 0s of n length
            input_0(change_value) = 1; % Change the last element of the array to 1
            input_1 = zeros(1, length(n)); % Create an array of 1s of n length
            input_1(change_value) = 2;
            result_0 = function_call(n, input_0); % Get the result of the 0s array
            result_1 = function_call(n, input_1); % Get the result of the 1s array
            if display_graphs
                figure
                subplot(1,2,1);
                stem(n,result_0);
                subplot(1,2,2);
                stem(n,result_1)
                string = ["Memory : System" num2str(sys_number-1)];
                sgtitle(string);
            end
            for i=1:length(result_0) 
                if abs(i - change_value) < 0.00001
                    continue
                end
                if abs(result_0(i) - result_1(i)) > 0.000001
                    %disp("Memory")
                    memory_result = 1;
                    return;
                end
            end
            %disp("Memoryless");
            memory_result = 0;
            if display_graphs
                waitforbuttonpress;
            end
        end
        
        
        % Display the results
        function calculate_results(systems_vector, result, zero_response, one_response, display_graphs)
            for system=1:length(systems_vector)
                zeros = sum(result(system, :) == 0); % Sum all 0 results
                if zeros > int16(length(result(system, :)) / 100) %If it exceeds 1% of the total number of results
                    fprintf("System%d is %s\n", system-1, zero_response); % Display the 0 result response
                else
                    fprintf("System%d is %s\n", system-1, one_response); % Display the 1 result response
                end
            end
            fprintf("\n"); % Take on a newline character after all systems have been displayed
            if display_graphs
                w = waitforbuttonpress;
            end
        end

    end
end