function import_dataset(csvFn, outFn)
%{
Import all variables in a dataset file
that was created by stat/transfer

Break into one file per year

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


%% Break into years

for year1 = yearValueV(:)'
   fprintf('Saving year %i \n', year1);
   tbM = loadS(loadS.year == year1, :);
   var_save_cps(tbM,  outFn,  year1);
end


end