function tests = load_value_list_test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   tbM = vars_cps.load_value_list('higrade');
   
   testCase.verifyEqual(tbM.Properties.VariableNames, {'code', 'value'});
   
   idx90 = find(tbM.code == 90);
   testCase.verifyEqual(length(idx90), 1);
   testCase.verifyEqual(tbM.value{idx90}, '6th grade');
   
end