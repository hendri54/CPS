function tests = var_info_test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   year1 = 1980;
   testCase.verifyTrue(isempty(vars_cps.var_info('nothing', year1)));
   
   testCase.verifyTrue(isa(vars_cps.var_info('age', year1),  'dataLH.Variable'));
end