function tests = RaceTest

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   rS = vars_cps.Race;
   vS = rS.var_info;
   testCase.verifyEqual(rS.is_white([100, 200]), [true, false]);
end