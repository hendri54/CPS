function [outV, infoS] = higrade_to_yrschool_cps(inV, year1, missVal)
% Recode higrade to highest year of schooling completed

% Input may have missVal values
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

oldV = [0        10    31    40    41    50    51    60    61    70    71    80    81    90    91 ...
   100   101   110   111   120   121   130   131   140   141   150   151   160   161   ...
   170   171   180   181   190   191   200   201   210   999];
newV = [missVal   0     0     1     1     2     2     3     3     4     4     5     5     6     6  ...
   7     7     8     8     9     9     10    10    11    11    12    12    13    13    ...
   14    14    15    15    16    16    17    17    18    missVal];

for i1 = 1 : length(oldV)
   outV(inV == oldV(i1)) = newV(i1);
end

infoS = [];

if any(outV == -1)
   error('Not all values assigned');
end

end