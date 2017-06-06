function var_save_cps(saveS, varNameStr, year1)
% Save a MAT variable
%{
Make directory if needed
%}

[fn, fDir] = var_fn_cps(varNameStr, year1);

if ~exist(fDir, 'dir')
   filesLH.mkdir(fDir);
end

save(fn, 'saveS');
fprintf('Saved file [%s] [%i] \n',  varNameStr, year1);

end