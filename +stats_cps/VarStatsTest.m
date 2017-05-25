%classdef VarStatsTest < matlab.unittest.TestCase
function tests = VarStatsTest

tests = functiontests(localfunctions);

end
    
    
function oneTest(testCase)
   varName = 'age';
   year1 = 1980;
   vS = stats_cps.VarStats(varName, year1);
   % Recode here
   vS.dataV(vS.dataV > 100) = NaN;
   wS = vS.compute_stats;
   xMean = wS.mean;
   testCase.verifyTrue(xMean > 20  &&  xMean < 60);

   % Test recode function
   vS = stats_cps.VarStats(varName, year1,  'recodeFct', @recodeFct);
   wS = vS.compute_stats;
   xMean2 = wS.mean;
   checkLH.approx_equal(xMean, xMean2, 1e-5, []);

end

function outV = recodeFct(inV, yearV)
   outV = inV;
   outV(inV > 100) = NaN;
end

