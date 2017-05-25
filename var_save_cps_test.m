function tests = var_save_cps_test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   xV = 1 : 10;
   varName = 'test1';
   year1 = 1980;
   var_save_cps(xV, varName, year1);
   loadV = var_load_cps(varName, year1);
   testCase.verifyEqual(loadV, xV);
end