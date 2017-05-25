classdef Race < handle
      
properties (Constant)
   codeWhite = 100
   minVal = 100
   maxVal = 830
   missValCodeV = 999
end

methods
   %% Constructor (nothing)
   
   
   %% Return Variable object
   function vS = var_info(rS)
      vS = dataLH.Variable('race', 'minVal', rS.minVal,  'maxVal', rS.maxVal,  'missValCodeV', rS.missValCodeV);
   end
   
   %% Is white
   %{
   Because output is logical, it cannot mark missing values directly!
   %}
   function [outV, missingV] = is_white(rS, inV)
      outV = (inV == 100);
      missingV = outV(inV < rS.minVal  |  inV > rS.maxVal);
   end
end
   
end
