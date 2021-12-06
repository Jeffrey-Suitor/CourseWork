function final = plot_schedule(tasks, type)
    switch type
        case 'RM'
            [~,idx] = sort(tasks(:,2)); % sort just the first column
            for i = 1:height(tasks)
                class_list(i) = Task([tasks(i, :), idx(i)]);
            end

            final = [];
            for i = 0:25
                running_tasks = zeros(1,length(class_list));
                for task = 1:length(class_list)
                    class_list(task).receive_time(i)
                    class_list(task).check_start()
%                     class_list(task).check_deadline(current_priority)

                    running_tasks(task) = class_list(task).is_active * class_list(task).priority;
                    running_tasks(running_tasks == 0) = inf;
                end
                current_priority = min(running_tasks);
                
                if current_priority == inf
                    final(i+1) = 0;
                else
                    final(i+1) = find(current_priority == running_tasks, 1, 'first');
                end

                for task = 1:length(class_list)
                    class_list(task).check_deadline(current_priority)
                end
            end

        case 'EDF'
            disp('not implemented')
        case 'DM'
            disp('not implemented')
        case 'CM'
            disp('not implemented')
    end
end