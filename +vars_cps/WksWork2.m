classdef WksWork2 < handle
      
properties (Constant)
   % Valid values
   validValueV = [0:6, 9];
   % Corresponding number of weeks
   weekValueV = [NaN, 7, 20, 33, 43.5, 48.5, 51, NaN];
   missValCodeV = [0, 9];
end

methods
   %% Recode into weeks worked (undo intervalling)
   function weeksV = recode_to_weeks(vS, inV)
      weeksV = nan(size(inV));
      for i1 = 1 : length(vS.validValueV)
         weeksV(inV == vS.validValueV(i1)) = vS.weekValueV(i1);
      end
   end
   
   function varS = var_info(vS)
      varS = dataLH.Variable('wkswork2',  'minVal', 0,  'maxVal', 6,  'missValCodeV', vS.missValCodeV);
   end
end
   
end
