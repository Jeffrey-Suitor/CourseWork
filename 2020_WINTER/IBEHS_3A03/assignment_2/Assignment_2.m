tester = assignment_2_tester;
helper = helper_functions;
sys_vector = { @ltisystemA, @ltisystemB, @ltisystemC};
display_graphs = true;

for system=1:length(sys_vector) %  Iterate through the systems
    unit_step_output = tester.calc_unit_step_output(sys_vector{system}, system, display_graphs);
    %impulse_output = tester.calc_impulse_output(sys_vector{system}, system, display_graphs);
end
