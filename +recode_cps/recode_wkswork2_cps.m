function [outV, infoS] = recode_wkswork2_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 9)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
% Treat 0 (NIU) as 0 weeks - given the universe, that must be the case
outV(inV < 0  |  inV > 9) = cS.missVal;

infoS = [];

end