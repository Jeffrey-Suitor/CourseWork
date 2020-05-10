classdef assignment_1_tester
    methods(Static)  
        
        % Test linearity
        function linearity_result = linearity_test(function_call, n, x_1, scale, sys_number, display_graphs)
            non_scaled_result = function_call(n,x_1); % Get the non scaled result
            x_scaled = x_1 * scale; % Scale the x array
            scaled_result = function_call(n,x_scaled); % Get the scaled result
            result = non_scaled_result * scale; % Scale the result
            if display_graphs
                figure;
                subplot(2,2,1);
                stem(n,result);
                subplot(2,2,2);
                stem(n,scaled_result)
                string = ["Linearity : System" num2str(sys_number-1)];
                sgtitle(string);
            end
            if not(abs(result - scaled_result) < 0.000001)
                %disp("Non-linear")
                linearity_result = 0;
            else % Is homogenous
                %disp("homogenous")
                x_2 = ones(1,length(x_1)); % Create an x array of ones
                result_1 = function_call(n, x_1); % Get the result for the original x array
                result_2 = function_call(n, x_2); % Get the result for the new x array
                x_combined = x_1 + x_2; % Add the two x arrays
                result_combined = function_call(n, x_combined); % Result of combined x array
                result_added = result_1 + result_2; % Added the result of the original x array and the x array of ones
                if display_graphs
                    subplot(2,2,3);
                    stem(n,result_combined);
                    subplot(2,2,4);
                    stem(n,result_added)
                end
                if abs(result_combined - result_added) < 0.000001
                    %disp("Linear");
                    linearity_result = 1;
                else
                    %disp("Non-Linear");
                    linearity_result = 0;
                end
            end
            if display_graphs
                waitforbuttonpress;
            end
        end
        
        
        % Test time variance
        function time_variance_result = time_variance_test(function_call, n, x, shift, sys_number, display_graphs)
            unshifted_result = function_call(n,x); % Get unshifted result
            shifted_n = n+shift; % Shift the vector by the value of shift
            shifted_result = function_call(shifted_n, x); % Get shifted result
            if display_graphs
                figure
                subplot(1,2,1);
                stem(n,unshifted_result);
                subplot(1,2,2);
                stem(n,shifted_result)
                string = ["Time Variance : System" num2str(sys_number-1)];
                sgtitle(string);
            end
            for i=1:length(shifted_n)
                if abs(unshifted_result(i) - shifted_result(i)) > 0.000001
                    %disp("Time-Variant");
                    time_variance_result = 1;
                    return;
                end
            end
            %disp("Time-Invariant");
            time_variance_result = 0;
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