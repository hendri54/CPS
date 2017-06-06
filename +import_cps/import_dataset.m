function import_dataset(csvFn, outFn)
%{
Import all variables in a dataset file
that was created by stat/transfer

Break into one file per year
Replace missing value codes

IN
   csvFn
      full path of file to be imported
   outFn
      file name to be created in each year directory
%}

fprintf('\n\nImporting dataset\n\n');


%% Input check

assert(isa(outFn, 'char'));


%% Load dataset

loadS = load(csvFn);
loadS = dataset2table(loadS.st_dataset);
fprintf('Size of imported table: %i / %i \n',  size(loadS));

yearValueV = unique(loadS.year);
fprintf('Year range: %i to %i \n',  yearValueV(1), yearValueV(end));

% Identifiers must exist
assert(ismember('serial',  loadS.Properties.VariableNames));
assert(ismember('pernum',  loadS.Properties.VariableNames));

% Get directory
% [fDir, fName, fExt] = fileparts(csvFn);


%% Treat variable errors

if ismember('wtsupp',  loadS.Properties.VariableNames)
   % There are "valid negative values" according to IPUMS
   loadS.wtsupp = max(0, loadS.wtsupp);
end


%% Break into years

for year1 = yearValueV(:)'
   fprintf('Saving year %i \n', year1);
   tbM = loadS(loadS.year == year1, :);

   % Loop over variables in this year
   varNameV = tbM.Properties.VariableNames;
   for iv = 1 : length(varNameV)
      varName = varNameV{iv};
      vS = vars_cps.var_info(varName, year1);
      % Do we have variable info?
      if ~isempty(vS)
         xV = tbM.(varName);
         [isValid, outMsg] = vS.is_valid(xV);
         if isValid
            % Replace missing value codes
            tbM.(varName) = vS.process(xV);
         else
            % Report errors
            fprintf('%s, %i:  %s \n',  varName, year1, outMsg);
         end
      end
   end
   
   % For unknown reasons, this one variable is sometimes (!) 'single'
   assert(isa(tbM.ahrsworkt, 'double'));
   
   var_save_cps(tbM,  outFn,  year1);
end


end