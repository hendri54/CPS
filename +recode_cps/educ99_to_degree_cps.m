function [outV, infoS] = educ99_to_degree_cps(inV, year1, codeHSD, codeHSG, codeCD, codeCG, missVal)
% Recode educ99 to highest degree completed

% IN:
%  codes for HSD through CG
% -----------------------------------------

%cS = const_cps;

% Check input range
if any(inV < 0  &  inV ~= missVal)  ||  any(inV > 18)
   disp('Invalid input');
   keyboard;
end
if year1 < 1992
   error('Invalid year');
end


% Recode
outV = -1 .* ones(size(inV));
outV(inV == missVal) = missVal;

outV(inV == 0) = missVal;
outV(inV >= 1   &  inV <= 9) = codeHSD;
outV(inV == 10) = codeHSG;
outV(inV >= 11  &  inV <= 14) = codeCD;
outV(inV >= 15  &   inV <= 18) = codeCG;


infoS = [];

if any(outV == -1)
   error('Not all values assigned');
end


end