function [outV, infoS] = recode_region_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 11)  ||  any(inV > 97)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 11  |  inV > 42) = cS.missVal;
% Acceptable values
infoS.valueListV = [11 12 21 22 31 32 33 41 42];


end