function [outV, infoS] = recode_metarea_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 80)  ||  any(inV > 9999)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 80  |  inV > 9360) = cS.missVal;

infoS = [];


end