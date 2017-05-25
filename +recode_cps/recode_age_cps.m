function [outV, infoS] = recode_age_cps(inV, year1)
% -----------------------------------------

% All values are valid
%  For some reason age is single in some years
outV = double(inV);

% Return top code
if year1 <= 1987
   infoS.topCode = 99;
elseif year1 <= 2001
   infoS.topCode = 90;
elseif year1 <= 2003
   infoS.topCode = 80;
elseif year1 <= 2011
   infoS.topCode = 85;
else
   error('Invalid year');
end

% Check input range
if any(inV < 0)  ||  any(inV > infoS.topCode)
   disp('Invalid age input');
   keyboard;
end



end