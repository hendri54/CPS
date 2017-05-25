function [outV, infoS] = recode_labforce_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 2)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 1  |  inV > 2) = cS.missVal;

infoS = [];

end