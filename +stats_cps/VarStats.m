% Compute stats for one variable / year
%{
Flow
1. Load
2. User recodes
3. Return WeightedDataLH object that can compute stats
%}
classdef VarStats < handle
      
properties
   varName  char
   year  double
   
   % Data table with variable and weights
   dataV
   weightV

   % Weight variable to use
   weightVar  char  = 'wtsupp';
   % Data file to load for each year
   dataFn  char  = 'data_main';
   % Recode function. Can be called as
   %  outV = recodeFct(dataV, yearV)
   recodeFct = []
end

methods
   %% Constructor
   %{
   IN
      varargin
         can set any properties
   %}
   function vS = VarStats(varName, year1,  varargin)
      vS.varName = varName;
      vS.year = year1;
      
      if ~isempty(varargin)
         functionLH.varargin_parse(vS, varargin);
      end
      
      tbM = vars_cps.load_vars({varName, vS.weightVar}, vS.year, vS.dataFn);
      vS.dataV = tbM.(varName);
      vS.weightV = tbM.(vS.weightVar);      
      
      if ~isempty(vS.recodeFct)
         vS.dataV = vS.recodeFct(vS.dataV, repmat(vS.year, size(vS.dataV)));
      end
   end
   
   
   %% Compute stats
   %{
   Actually returns a WeightedDataLH object that can compute stats
   %}
   function wS = compute_stats(vS)
      wS = WeightedDataLH(vS.dataV,  vS.weightV);      
   end
   
%    %% Load table for 1 year
%    %{
%    Returns table with variables {varName, wtsupp, year}
%    [] if varName does not exist in that year
%    %}
%    function tbM = load_table(vS)
%       m = var_load_cps(vS.dataFn, vS.year);
%       if ismember(vS.varName, m.Properties.VariableNames)
%          tbM = m(:, {vS.varName, vS.weightVar});
%       else
%          tbM = [];
%       end
%    end
   
end
   
end
