function [outV, infoS] = educ99_to_yrschool_cps(inV, year1, missVal)
% Recode educ99 to highest year of schooling completed

% Input may have missVal values
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

oldV = [0        1   4 : 18];
newV = [missVal  0   2.5   6.5   9  10 11 12 12  13  14 14 14  16 18 18 18];

for i1 = 1 : length(oldV)
   outV(inV == oldV(i1)) = newV(i1);
end

infoS = [];

if any(outV == -1)
   error('Not all values assigned');
end

end