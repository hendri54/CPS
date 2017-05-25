function [outV, infoS] = recode_hrswork_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 0)  ||  any(inV > 99)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
%outV(inV < 1) = cS.missVal;

if year1 == 1962
   infoS.topCode = 98;
else
   infoS.topCode = 99;
end

end