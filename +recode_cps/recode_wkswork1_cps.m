function [outV, infoS] = recode_wkswork1_cps(inV, year1)
% -----------------------------------------

%cS = const_cps;

infoS.blank = 1;

if year1 > 2011
   error('Check for added years');
end


% Check input range
if any(inV < 0)  ||  any(inV > 52)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;


end