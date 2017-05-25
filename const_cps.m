classdef const_cps < handle
% Returns values of constants

properties
   dbg = 1;
   missVal = -9191;

   % Available years
   yearV = 1962 : 2016;



% % *************  Figures
% 
% cS.figOptS = struct('preview', 'tiff', 'height', 3, 'width', 4, 'color', 'rgb', 'Format', 'eps');
% cS.figOpt2S = cS.figOptS;
% cS.figOpt2S.height = 6;
% cS.figOpt4S = cS.figOpt2S;
% cS.figOpt4S.width = 6;
% cS.figOpt6S = cS.figOpt4S;
% 
% cS.figExt = '.eps';
% 

% ***********  Variables

% List of valid variable names
% No all exist in each year
% varNameV = {'age', 'classwkr', 'disabwrk', 'earnwt', 'educ', 'educ99', ...
%    'empstat', 'gq', 'hwtsupp', 'higrade', 'hrswork', 'incbus', 'incretir', 'incwage', ...
%    'labforce', 'marst', 'metarea', 'pernum', 'race', 'region', 'schlcoll', 'serial', ...
%    'sex', 'statefip', 'uhrswork', 'wkswork1', 'wkswork2', 'wtsupp'};


end 


methods
   %% Constructor
   function cS = const_cps
      
   end
   
end

end
