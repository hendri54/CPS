function [outV, infoS] = recode_higrade_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 999)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 1 | inV > 210) = cS.missVal;

infoS = [];

end