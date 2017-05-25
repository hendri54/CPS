function [outV, infoS] = higrade_to_degree_cps(inV, year1, codeHSD, codeHSG, codeCD, codeCG, missVal)
% Recode higrade to highest degree completed

% IN:
%  codes for HSD through CG
% -----------------------------------------

%cS = const_cps;

% Check input range
if any(inV < 0  &  inV ~= missVal)  ||  any(inV > 999)
   disp('Invalid input');
   keyboard;
end
if year1 > 1991
   error('Invalid year');
end


% Recode
outV = -1 .* ones(size(inV));
outV(inV == missVal) = missVal;

outV(inV == 0  |  inV == 999) = missVal;
outV(inV >= 10   &  inV <= 141) = codeHSD;
outV(inV == 150) = codeHSG;
outV(inV >= 151  &  inV <= 181) = codeCD;
outV(inV >= 190  &  inV <= 210) = codeCG;


infoS = [];

if any(outV == -1)
   error('Not all values assigned');
end


end