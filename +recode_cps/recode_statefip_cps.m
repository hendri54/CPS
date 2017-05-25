function [outV, infoS] = recode_statefip_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 1)  ||  any(inV > 99)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 1  |  inV > 90) = cS.missVal;

infoS = [];


end