function tests = variable_errors_test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   varNameV = {'age', 'notnot'};
   yearV = [1968, 1970];
   stats_cps.variable_errors(varNameV, yearV, []);
   
   stats_cps.variable_errors('age', [], []);
end