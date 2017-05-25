function [outV, infoS] = recode_incwage_cps(inV, year1)
% Top codes vary by year. Not documented. See cps_notes
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