function tbM = load_value_list(varName)
% Load a text file that contains code / value pairs
%{
A way of reading a codebook
Can simply copy the code / values table from an SPSS file into a text file and read it into a table
with this function
%}

dirS = param_cps.Directories;
fName = fullfile(dirS.varInfoDir, [varName, '.txt']);

tbM = readtable(fName);

assert(isequal(size(tbM, 2), 2));
tbM.Properties.VariableNames = {'code', 'value'};

assert(isa(tbM.code, 'numeric'));
assert(isa(tbM.value, 'cell'));


end