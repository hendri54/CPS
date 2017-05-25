function [outV, infoS] = recode_gq_cps(inV, year1)
% -----------------------------------------

cS = const_cps;

% Check input range
minVal = 0;
maxVal = 2;
if any(inV < minVal)  ||  any(inV > maxVal)
   disp('Invalid input');
   fprintf('year: %i    min: %f    max: %f \n',  year1, min(inV), max(inV));
   fprintf('below min: %i   above max: %i \n',  length(find(inV < minVal)),  length(find(inV > maxVal)));
   keyboard;
end

% All values are valid
outV = inV;
outV(inV < 1) = cS.missVal;

infoS = [];

end