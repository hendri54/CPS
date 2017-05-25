function [outV, infoS] = recode_educ99_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 18)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 0.5) = cS.missVal;
infoS = [];


end