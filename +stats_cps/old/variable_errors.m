function variable_errors(varNameV, yearV, diaryFn)
% Report variable errors
%{
Only if variable info is defined in `var_info`

IN
   varNameV  ::   char  or  cell
      []: use `var_list`
   diaryFn  ::  char
      path for diary file
%}

cS = const_cps;

if ~isempty(diaryFn)
   diaryS = filesLH.DiaryFile(diaryFn, 'new');
else
   diaryS = [];
end


if isa(varNameV, 'char')
   varNameV = {varNameV};
elseif isempty(varNameV)
   varNameV = vars_cps.var_list;
else
   assert(isa(varNameV, 'cell'));
end

if isempty(yearV)
   yearV = cS.yearV;
end


fprintf('\nChecking variables for errors\n');

for year1 = yearV(:)'
   m = var_load_cps('data_main', year1);
   for iv = 1 : length(varNameV)
      varName = varNameV{iv};
      vS = vars_cps.var_info(varName, year1);
      if ~isempty(vS)
         [isValid, outMsg] = vS.is_valid(m.(varName));
         if ~isValid
            fprintf('%s, %i:  %s \n',  varName, year1, outMsg);
         end
      end
   end
end

fprintf('Done \n\n');

if ~isempty(diaryS)
   diaryS.close;
end

end