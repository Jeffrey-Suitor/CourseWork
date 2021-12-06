function EDF_Schedule_Tests(tasks)
    periods = tasks(:, 2);
    exec_time = tasks(:, 3);
    deadlines = tasks(:, 4);
    n = height(tasks)

    % T1 Test
    T1 = sum(exec_time ./ periods) <= 1

    % T2 (no easy test where deadlines are not greater than or equal to
    % their periods)
    % For a sufficient condition

    vals = [];
    for i = 1:length(periods)
        vals(i) = min(periods(i), deadlines(i));
    end

    % EDF Test 2
    T2 = sum(exec_time ./ min(vals)) <= 1
end