classdef educ < handle
      
properties (Constant)
   % Valid values
   validValueV = [0	1	2	10	11	     12	13	14	20	21	     22	30	31	32	40	     50	60	70	71	72	...
         73	80	81	90	91	     92	100	110	111	120	     121	122	123	124	125	    999];
   missValCodeV = [0, 1, 999];
end

methods
   %% Var info
   function vS = var_info(eS)
      vS = dataLH.Variable('educ',  'minVal', 2,  'maxVal', 125,  'missValCodeV', eS.missValCodeV);
   end
   
   
   %% Recode to degree attained
   function outV = recode_to_degrees(eS, inV)
      outV = categorical(zeros(size(inV)),  1:4, {'HSD', 'HSG', 'CD', 'CG'});
      
      outV(inV >= 2   &  inV <= 71) = 'HSD';
      outV(inV == 72  |  inV == 73) = 'HSG';
      outV(inV >= 80  &  inV <= 100) = 'CD';
      outV(inV >= 110  &   inV <= 125) = 'CG';
      
   end
   
   
   %% Recode into years of schooling
   function outV = recode_to_yrschool(eS, inV)
      % Recode
      outV = -1 .* ones(size(inV));
      outV(isnan(inV)) = NaN;

%       oldV = [0	1	2	10	11	     12	13	14	20	21	     22	30	31	32	40	     50	60	70	71	72	...
%          73	80	81	90	91	     92	100	110	111	120	     121	122	123	124	125	    999];
      newV = [NaN  NaN 0	2	1	  2	3	4	5.5	5	   6	7.5	7	8	9	   10	11	12	12	12	 ...
         12	13	14	14	14	     14	15	16	16	17                   17	18	18	19	20    NaN];
      assert(isequal(length(eS.validValueV), length(newV)));

      for i1 = 1 : length(eS.validValueV)
         outV(inV == eS.validValueV(i1)) = newV(i1);
      end

      if any(outV == -1)
         error('Not all values assigned');
      end      
   end
end
   
end
