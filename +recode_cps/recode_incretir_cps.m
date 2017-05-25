function [outV, infoS] = recode_incretir_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV > 999999)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV == 999999) = cS.missVal;


infoS = [];

end