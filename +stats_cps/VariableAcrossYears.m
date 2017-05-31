% One variable across years
%{
The goal is to produce stats by year
Flow:
1. Gather variable across years into a table
2. Let user recode the variable (e.g. remove missing values)
3. Compute stats by year -> table
%}
classdef VariableAcrossYears < handle
   
properties
   varName  char
   yearV  double
   
   % Data file to load for each year
   dataFn  char  = 'data_main';
   % Recode function
   %  outV = recodeFct(inV, yearV)
   recodeFct = []
end


methods
   %% Constructor
   %{
   IN
      varName  ::  char
         variable name
      yearV  ::  integer
         years to show; may by []
      varargin
         to set other object properties; optional
   %}
   function vS = VariableAcrossYears(varName, yearV,  varargin)
      cS = const_cps;
      
      if ~isempty(varargin)
         functionLH.varargin_parse(vS, varargin);
      end
      
      if isempty(yearV)
         yearV = cS.yearV;
      end
      ny = length(yearV);
      
      vS.varName = varName;
      vS.yearV = yearV(:);
   end
   
   
   %% Write table to a reasonably formatted text file
   function write_table(vS)
      tbM = vS.stats;
      dirS = param_cps.Directories;
      diaryS = filesLH.DiaryFile(fullfile(dirS.varStatsDir, [vS.varName, '.txt']),  'new');
      fprintf('Stats for [%s] \n\n',  vS.varName);
      disp(tbM);
      diaryS.close;
   end
   
   
   %% Make a graph with major summary stats
   function graph_stats(vS)
      tbM = vS.stats;
      dirS = param_cps.Directories;
      
%       isVisible = true;
%       figS = FigureLH('visible', isVisible);
%       figS.fh = figure;
      
      % Mean and median
      fS = FigureLH('visible', false);
      fS.new;
%       fS.fh = subplot(2,2,1);
      hold on;
      fS.plot_line(tbM.year, tbM.mean, 1);
      fS.plot_line(tbM.year, tbM.median, 2);
      hold off;
      xlabel(['Year  -  ',  vS.varName]);
      legend({'Mean', 'Median'}, 'location', 'southoutside', 'orientation', 'horizontal');
      fS.format;
      fS.save(fullfile(dirS.varStatsDir,  [vS.varName, '_mean']), true);

   
      % Std deviation
      fS = FigureLH('visible', false);
      % fS.fh = subplot(2,2,2);
      fS.new;
      hold on;
      fS.plot_line(tbM.year, tbM.std, 1);
      hold off;
      xlabel(['Year  -  ',  vS.varName]);
      fS.format;
      fS.save(fullfile(dirS.varStatsDir,  [vS.varName, '_std']), true);      
      

      % Fraction missing
      fS = FigureLH('visible', false);
      fS.new;
      hold on;
      fS.plot_line(tbM.year, tbM.fracMiss, 1);
      hold off;
      xlabel(['Year  -  ',  vS.varName]);
      fS.format;
      fS.save(fullfile(dirS.varStatsDir,  [vS.varName, '_frac_miss']), true);      
   end
   
   
   
   %% Compute stats by year
   %{
   Output is table with fields such as 'mean', 'std'
   
   IN
   %}
   function tbM = stats(vS)
      statNameV = {'mean', 'median', 'std', 'fracMiss'};
      nStats = length(statNameV);
      ny = length(vS.yearV);
      
      colNameV = [{'year'}, statNameV];
      tbM = array2table(nan(ny, nStats + 1),  'VariableNames', colNameV);
      
      for iy = 1 : ny
         year1 = vS.yearV(iy);
         
         statsS = stats_cps.VarStats(vS.varName, year1,  'recodeFct', vS.recodeFct);
         %if ~isempty(recodeFct)
         %   statsS.dataV = recodeFct(statsS.dataV, repmat(year1, size(statsS.dataV)));
         %end
         wS = statsS.compute_stats;
         
         tbM.year(iy) = year1;
         tbM.mean(iy) = wS.mean;
         tbM.median(iy) = wS.median;
         tbM.std(iy) = sqrt(wS.var);
         tbM.fracMiss(iy) = wS.fracMiss;
      end
   end
   
   
   
   %% Make table with variable across years
   %{
   Not needed to compute stats
   %}
   function tbM = make_table(vS)
      nMax = 2e5 * length(vS.yearV);
      tbM = table(nan(nMax, 1), nan(nMax, 1), nan(nMax, 1),  'VariableNames', {vS.varName, 'wtsupp', 'year'});
      
      % Last filled row
      idx1 = 0;
      
      for year1 = vS.yearV(:)'
         %m = var_load_cps(vS.dataFn, year1);
         m = vars_cps.load_vars(tbM.Properties.VariableNames, year1, vS.dataFn);
         if ~isempty(m)
            n = size(m, 1);
            idxV = idx1 + (1 : n);
            tbM(idxV, :) = m;
            idx1 = idx1 + n;
         end
      end
      
      % Drop unused rows
      if size(tbM, 1) > idx1
         tbM((idx1 + 1) : end, :) = [];
      else
         disp('Table too small');
      end
   end
end
   
   
end