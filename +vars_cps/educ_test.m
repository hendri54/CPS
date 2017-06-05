function tests = educ_test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   eS = vars_cps.educ;
   vS = eS.var_info;
   testCase.verifyTrue(vS.is_valid([0, 10, 14, 72, 111, 125]));
   
   inV = [11, 121];
   tgV = [1,  17];
   outV = eS.recode_to_yrschool(inV);
   testCase.verifyEqual(outV, tgV);
   
   outV = eS.recode_to_degrees(inV);
   testCase.verifyTrue(outV(1) == 'HSD');
   testCase.verifyTrue(outV(2) == 'CG');
end