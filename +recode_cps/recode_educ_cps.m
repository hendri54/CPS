function [outV, infoS] = recode_educ_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 999)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 1.5  |  inV > 115.5) = cS.missVal;
infoS = [];


end