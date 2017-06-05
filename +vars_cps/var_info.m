function vS = var_info(varName, year1)
% Return dataLH.Variable object for variable named varName
%{
OUT
   vS  ::  dataLH.Variable
      [] if not defined for this variable
%}

validateattributes(year1, {'numeric'}, {'finite', 'nonnan', 'nonempty', 'integer', 'scalar', '>=', 1962})


switch varName
   case 'age'
      if year1 <= 1987
         topCodeV = 99;
      elseif year1 <= 2001
         topCodeV = 90;
      elseif year1 <= 2003
         topCodeV = 80;
      elseif year1 <= 2017
         topCodeV = 85;
      else
         error('Invalid');
      end
      vS = dataLH.Variable('age',  'minVal', 0,  'maxVal', 99,  'topCodeV', topCodeV);
      
   case 'classwkr'
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 29,  'missValCodeV', [0, 99]);

   case 'educ'
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 125,  'missValCodeV', [0, 1, 999]);

   case 'educ99'
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 18,  'missValCodeV', 0);
      
   case 'empstat'
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 36,  'missValCodeV', 0);

   case 'higrade'
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 210,  'missValCodeV', [0, 999]);

   case 'incwage'
      % Also has top codes
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 9999997,  'missValCodeV',  [9999998, 9999999]);
      
   case 'labforce'
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 2,  'missValCodeV', 0);
      
   case 'race'
      rS = vars_cps.Race;
      vS = rS.var_info;
      
   case 'sex'
      vS = dataLH.Variable(varName, 'minVal', 1, 'maxVal', 2, 'missValCodeV', 9);
      
   case 'uhrsworkly'
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 99,  'missValCodeV', 999,  'topCodeV', 99);

   case 'uhrswork1'
      % Missing value code 997 in some years (not documented)
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 7 * 24,  'missValCodeV', [997, 999]);

   case 'wkswork1'
      vS = dataLH.Variable(varName,  'minVal', 0,  'maxVal', 99,  'missValCodeV', NaN);

   case 'wkswork2'
      varS = vars_cps.WksWork2;
      vS = varS.var_info;

   otherwise
      vS = [];
end

% nameStr = ['vars_cps.', varName];
% 
% if isempty(which(nameStr))
%    vS = [];
% else
%    vS = eval([nameStr, sprintf('(%i)', year1)]);
% end

end