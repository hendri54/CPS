function [outV, infoS] = recode_hhwt_cps(inV, year1)
% HHWT
%  no missing values
% -----------------------------------------

%cS = const_cps;

% Check input range
%  Until 1975 some weights are negative (up to 6 per year)
%  Likely coding errors
if any(inV > 1e5)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 0) = 0;

infoS = [];

end