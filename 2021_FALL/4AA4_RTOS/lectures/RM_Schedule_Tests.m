function RM_Schedule_Tests(tasks)
    periods = tasks(:, 2);
    exec_times = tasks(:, 3);
    deadlines = tasks(:, 4);
    n = height(tasks)

    T1 = [];
    % T1 (Necessary and sufficient special case)
    T1(1) = sum(deadlines >= periods) == n; % All 1 if deadlines shoter than periods
    T1(2) = sum(mod(periods, min(periods)) == 0) == 0; % All 1 if it is a multiple
    u = sum(exec_times ./ periods);
    T1(3) = u <= 1;
    if sum(T1) == 3
        disp('Necessary and sufficient special case')
    else
        disp('Special case does not work')
    end

    %T2 (Sufficient but not necessary)
    T2 = u < n*(2^(1/n)-1);

    if T2 == 1
        disp('Sufficient but not necessary')
    else
        disp('Not sufficient or necessary')
    end

    %T3 (Sufficient and necessary)
    t = [];
    for i = 1:n
        for j = 1:i
            kj = 1:floor(periods(i)/periods(j));
            t = cat(2, t, kj * periods(j));
        end
    end
    t = unique(t);

    for task = 1:n
        disp(['Task: ' num2str(task)])
        task_vales = [];
        for i = 1:length(t)
            if t(i) > periods(task)
                break
            end
            disp(['Time: ', num2str(t(i))])
            task_values(i, 2) = t(i);
            for j = 1:task
                temp(j) = ceil(t(i)/periods(j))* exec_times(j);
            end
            task_values(i, 1) = sum(temp);
        end
        task_values(:,1) <= task_values(:, 2)
    end
end