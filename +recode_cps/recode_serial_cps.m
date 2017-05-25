function [outV, infoS] = recode_serial_cps(inV, year1)
% -----------------------------------------

%cS = const_cps;

% Check input range
if any(inV < 1)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;

infoS = [];

end