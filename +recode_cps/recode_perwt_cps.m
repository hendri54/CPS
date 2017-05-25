function [outV, infoS] = recode_perwt_cps(inV, year1)
% PERWT
%  no missing values
% -----------------------------------------

%cS = const_cps;

% Check input range
% Until 1975 up to 70 people have negative weights
if year1 > 1975
   minVal = 0;
else
   minVal = -1e7;
end
if any(inV < minVal  |  inV > 1e5)
   disp('Invalid input');
   fprintf('year: %i    min: %f    max: %f \n',  year1, min(inV), max(inV));
   keyboard;
end


% Recode
outV = inV;
outV(inV < 0) = 0;

infoS = [];

end