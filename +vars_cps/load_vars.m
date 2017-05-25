% Load a set of variables for 1 year
%{
Missing variables are replaced with all NaN

Order of variables is preserved, even if variables do not exist
%}
function tbM = load_vars(varNameV, year1, dataFn)
   if isa(varNameV, 'char')
      varNameV = {varNameV};
   end
   
   m = var_load_cps(dataFn, year1);
   assert(~isempty(m));
   
   % Which variables exist?
   existV = ismember(varNameV, m.Properties.VariableNames);
   if ~isempty(existV)
      varLoadV = repmat({'age'}, size(varNameV));
      varLoadV(existV) = varNameV(existV);
      tbM = m(:, varLoadV);
   end
   
   % Variables that do not exist
   if any(~existV)
      sizeV = [size(m,1), sum(~existV)];
      tbM(:, ~existV) = array2table(nan(sizeV));
      tbM.Properties.VariableNames(~existV) = varNameV(~existV);
   end
   
   %% Self test
   assert(isequal(tbM.Properties.VariableNames, varNameV));
end
