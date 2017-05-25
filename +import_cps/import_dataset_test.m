function tests = import_dataset_test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   outFn = 'data_main';
   dirS = param_cps.Directories;

   inFn = fullfile(dirS.asciiDir, 'downloads', 'd2017_05_25', 'cps_00014.mat');
   % Skip this. It takes time and is done in main routines. Would overwrite main data files
   % import_cps.import_dataset(inFn, 'data_main');
   
   
   % Check that target files exist
   yearV = 1980 : 1989;
   
   varListV = [];
   
   for year1 = yearV
      m = var_load_cps(outFn, year1);
      testCase.verifyTrue(all(m.year == year1));
      if isempty(varListV)
         varListV = m.Properties.VariableNames;
      else
         testCase.verifyEqual(varListV, m.Properties.VariableNames);
      end
   end
end