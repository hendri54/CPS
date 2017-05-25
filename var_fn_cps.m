function [fPath, fDir] = var_fn_cps(varNameStr, year1)
% File name for a variable file

dirS = param_cps.Directories;
fDir = dirS.year_dir(year1);
fPath = fullfile(fDir, [varNameStr, '.mat']);

end