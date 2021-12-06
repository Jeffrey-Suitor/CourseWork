classdef helper_functions
    methods(Static)
        
        % Current value, and a 2d array of [min, max, val]
        % Must always be a 2D array
        function heavy_y = custom_heavy(range, array)
            heavy_y = zeros(1, length(range));
            length(range)
            for val=1:length(range)
                for i=1:length(array)
                    if array{i}{1} <= val <= array{i}{2}
                        heavy_y(i) = array{i}{3};
                    end
                end
            end
        end
        
        % Clear previous question
        function reset()
            clear;
            close all;
            clc;
        end
        
    end
end
     
