function [outV, infoS] = recode_marst_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 1)  ||  any(inV > 9)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 1  |  inV > 6) = cS.missVal;

infoS.marriedV = [1, 2];

end