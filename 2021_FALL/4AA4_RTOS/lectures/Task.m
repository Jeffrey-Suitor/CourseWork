classdef Task < handle

    properties
        start_time {mustBeNumeric}
        period {mustBeNumeric}
        exec_time {mustBeNumeric}
        deadline {mustBeNumeric}
        priority {mustBeNumeric}
        is_active = false
        is_done = false
        current_exec_time = 0
        current_deadline = 0
        current_period = 0
        time = 0
    end

    methods
        function obj = Task(val)
            if nargin == 1
                obj.start_time = val(1);
                obj.period = val(2);
                obj.exec_time = val(3);
                obj.deadline = val(4);
                obj.priority = val(5);
                obj.current_exec_time = obj.exec_time;
                obj.current_deadline = obj.deadline;
                obj.current_period = obj.period;
            end
        end

        function receive_time(obj, time)
            obj.time = time;
        end

        function check_start(obj)
            if obj.time < obj.start_time
                return;
            elseif obj.time == obj.start_time
                obj.is_active = true;
                return;
            elseif obj.current_period == 0
                obj.is_active = true;
                obj.current_period = obj.period;
                return;
            end

            if obj.is_active == false
                obj.current_period = obj.current_period - 1;
            end
        end

        function check_deadline(obj, prio)
            if obj.is_active
                obj.current_deadline = obj.current_deadline - 1;
                if prio == obj.priority
                    obj.current_exec_time = obj.current_exec_time -1;
                end
            end
            
            if obj.current_exec_time == 0
                obj.is_active = false;
                obj.current_exec_time = obj.exec_time;
                obj.current_deadline = obj.deadline;
            end

            if obj.current_deadline == 0
                disp('missed deadline')
            end
        end
    end
end