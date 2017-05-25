function [outV, infoS] = recode_empstat_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 35)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 10  |  inV > 35) = cS.missVal;

infoS = [];

end