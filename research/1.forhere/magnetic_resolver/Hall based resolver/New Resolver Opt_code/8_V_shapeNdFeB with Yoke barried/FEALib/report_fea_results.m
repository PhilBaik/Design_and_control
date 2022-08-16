function [all_solve_data] = report_fea_results(all_solve_data, rep, nfeval)


all_solve_data = [all_solve_data rep];
save('all_solve_data')
fprintf('\n Iteration number: %g', nfeval)

end

