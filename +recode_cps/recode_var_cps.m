function [outV, infoS] = recode_var_cps(inV, varNameStr, year1)
% Dispatch for recode functions
% Every variable must have a recode function
% ------------------------------------------------------------


% Is there a variable specific recode function?
recodeFctStr = ['recode_', varNameStr, '_cps'];
if exist(recodeFctStr, 'file')
   [outV, infoS] = eval([recodeFctStr, '(inV, year1);']);
   
   validateattributes(outV, {'double'}, {'finite', 'nonnan', 'nonempty', 'real'})
   
else
   % No specific recode function 
   error(['No recode function for variable ',  varNameStr]);
   %outV = inV;
   %infoS = [];   
end



end