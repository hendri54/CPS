function [outV, infoS] = recode_disabwrk_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 2)
   disp('Invalid input');
   keyboard;
end


% All values are valid
outV = inV;
outV(inV < 0.5  |  inV > 2.5) = cS.missVal;
infoS = [];


end