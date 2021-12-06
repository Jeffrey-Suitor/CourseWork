function hyper_period = calculate_hyper_period(tasks)
    periods = tasks(:, 2);
    hyper_period = lcm(sym(periods));
    disp("lcm(periods)")
end