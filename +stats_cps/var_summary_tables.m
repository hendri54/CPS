function var_summary_tables(varNameInV)
% Write tables with summary stats for major variables

fprintf('\n\nSummary stats for major variables\n\n');

if nargin < 1
   varNameInV = [];
end

if isempty(varNameInV)
   varNameV = vars_cps.var_list;
else
   varNameV = varNameInV;
end

for i1 = 1 : length(varNameV)
   disp(varNameV{i1});
   vS = stats_cps.VariableAcrossYears(varNameV{i1}, []);
   vS.write_table;   
   vS.graph_stats;
end


end