function tests = WksWork2Test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   vS = vars_cps.WksWork2;
   inV = [0 : 6, 9];
   varS = vS.var_info;
   testCase.verifyTrue(varS.is_valid(inV));
   
   outV = vS.recode_to_weeks(inV);
   testCase.verifyEqual(outV, vS.weekValueV);
   
end