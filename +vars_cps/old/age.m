function vS = age(year1)
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
end