function tests = VariableAcrossYearsTest

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   varName = 'age';
   yearV = 1980 : 1982;
   vS = stats_cps.VariableAcrossYears(varName, yearV);
   tbM = vS.stats;
   vS.write_table;
   
%    tbM = vS.load_table(yearV(1));
%    testCase.verifyTrue(all(tbM.year == yearV(1)));
   
   tbM = vS.make_table;
   testCase.verifyTrue(isequal(unique(tbM.year),  yearV(:)));

   % With recode function
   vS = stats_cps.VariableAcrossYears(varName, yearV,  'recodeFct', @recode_fct);
   tbM = vS.stats
end



function outV = recode_fct(inV, yearV)
   outV = inV;
   outV(inV > 70) = NaN;
end