function [outV, infoS] = recode_race_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
if any(inV < 100)  ||  any(inV > 830)
   disp('Invalid input');
   keyboard;
end


% Recode
outV = inV;
outV(inV < 100  |  inV > 830) = cS.missVal;

infoS.raceWhite = 100;
infoS.raceBlack = 200;



end