function [outV, infoS] = recode_pernum_cps(inV, year1)
% -----------------------------------------

%cS = const_cps;

% Check input range
if any(inV < 1  |  inV > 50)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;

infoS = [];

end