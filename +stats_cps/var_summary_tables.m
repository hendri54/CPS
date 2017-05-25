function var_summary_tables(varNameInV)
% Write tables with summary stats for major variables

fprintf('\n\nSummary stats for major variables\n\n');

if nargin < 1
   varNameInV = [];
end

if isempty(varNameInV)
   varNameV = {'age', 'classwkr', 'disabwrk', 'earnwt', 'educ', 'educ99', ...
      'empstat', 'gq', 'hwtsupp', 'higrade', 'hrswork', 'incbus', 'incretir', 'incwage', ...
      'labforce', 'marst', 'metarea', 'pernum', 'race', 'region', 'schlcoll', 'serial', ...
      'sex', 'statefip', 'uhrswork', 'wkswork1', 'wkswork2'};
else
   varNameV = varNameInV;
end

for i1 = 1 : length(varNameV)
   disp(varNameV{i1});
   vS = stats_cps.VariableAcrossYears(varNameV{i1}, []);
   vS.write_table;   
end


end