function calculate_frame_size(tasks)
    exec_times = tasks(:, 3);
    periods = tasks(:, 2);
    deadlines = tasks(:, 4);

    % C1 check
    C1 = max(exec_times)
    disp(['mac(exec_times)', num2str(C1)])

    % C2 check
    C2 = [];
    for i = 1:length(periods)
        C2 = cat(2, C2, divisors(periods(i)));
    end
    C2 = unique(C2)
    disp('divisors of periods')
    
    %C3 check
    remaining_f = C2(C2>=C1);
    for i = 1:length(remaining_f)
        for j = 1:length(periods)
            C3(i, j) = 2*remaining_f(i) - gcd(periods(j), remaining_f(i)) <= deadlines(j);
        end
    end
    vector = all(C3 == 1, 2);
    C3 = vector .* transpose(remaining_f)
    disp('2f - gcd(periods, f) <= deadlines')
end