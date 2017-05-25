function tests = load_vars_test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   year1 = 1980;
   dataFn = 'data_main';
   
   % All variables exist
   varNameV = {'age', 'race'};
   tbM = vars_cps.load_vars(varNameV, year1, dataFn);
   
   % Not all variables exist
   varNameV = {'age', 'nono'};
   tbM = vars_cps.load_vars(varNameV, year1, dataFn);
   testCase.verifyTrue(all(isnan(tbM.nono)));
   
   % No variables exist
   tbM = vars_cps.load_vars('nono', year1, dataFn);
   testCase.verifyTrue(all(isnan(tbM.nono)));
end