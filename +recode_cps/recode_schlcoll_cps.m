function [outV, infoS] = recode_schlcoll_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 5)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 1  |  inV > 5) = cS.missVal;

infoS = [];

end