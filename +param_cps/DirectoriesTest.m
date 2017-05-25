function tests = DirectoriesTest

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   dirS = param_cps.Directories;
   testCase.verifyTrue(exist(dirS.progDir, 'dir') > 0);
   testCase.verifyTrue(exist(dirS.year_dir(1980), 'dir') > 0);
end