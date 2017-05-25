function [outV, infoS] = recode_incbus_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV > 999999)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV == 999998  |  inV == 999999  |  inV == 99999  |  inV == 99998) = cS.missVal;


infoS = [];

end