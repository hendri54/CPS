function [outV, infoS] = recode_wtsupp_cps(inV, year1)
% Recode WTSUPP
%  no missing values, but has negative values
% -----------------------------------------

%cS = const_cps;

if year1 > 2011
   error('Check for added years');
end


% Recode
outV = inV;
outV(inV < 0) = 0;

infoS = [];

end