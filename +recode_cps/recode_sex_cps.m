function [outV, infoS] = recode_sex_cps(inV, year1)
% -----------------------------------------


% Check input range
minVal = 1;
maxVal = 2;
if any(inV < minVal)  ||  any(inV > maxVal)
   disp('Invalid input');
   fprintf('year: %i    min: %f    max: %f \n',  year1, min(inV), max(inV));
   fprintf('below min: %i   above max: %i \n',  length(find(inV < minVal)),  length(find(inV > maxVal)));
   keyboard;
end

% All values are valid
outV = double(inV);

infoS.male = 1;
infoS.female = 2;

end