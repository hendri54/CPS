function [outV, infoS] = recode_classwkr_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 99)
   disp('Invalid input');
   keyboard;
end


% All values are valid
outV = inV;
outV(inV <= 0  |  inV > 29) = cS.missVal;
infoS = [];


end