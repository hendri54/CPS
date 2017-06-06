function process_year(year1)
% Replace missing values in a year. Check variables and report errors

tbM = var_load_cps('data_main',  year1);

% For unknown reasons, this one variable is sometimes (!) 'single'
assert(isa(tbM.ahrsworkt, 'double'));

dirS = param_cps.Directories;
diaryS = filesLH.DiaryFile(fullfile(dirS.testDir, sprintf('var_report%i.txt', year1)),  'new');

% Loop over variables in this year
varNameV = tbM.Properties.VariableNames;

hasInfoV = false(size(varNameV));

for iv = 1 : length(varNameV)
   varName = varNameV{iv};
   vS = vars_cps.var_info(varName, year1);

   % Do we have variable info?
   if ~isempty(vS)
      hasInfoV(iv) = true;
      %fprintf('\n%s\n',  varName);
      xV = tbM.(varName);
      [isValid, outMsg] = vS.is_valid(xV);
      if isValid
         % Replace missing value codes
         tbM.(varName) = vS.process(xV);
      else
         % Report errors
         fprintf('%s:  %s \n',  varName, outMsg);
      end
   end
end

% List variables without info
fprintf('\nVariables without info: \n');
displayLH.show_string_array(varNameV(~hasInfoV), 80);
fprintf('\n');

diaryS.close;

% For unknown reasons, this one variable is sometimes (!) 'single'
assert(isa(tbM.ahrsworkt, 'double'));


% Save 
var_save_cps(tbM, 'data_main', year1);

end