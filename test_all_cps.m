function test_all_cps

import matlab.unittest.TestSuite

progDir = fileparts(mfilename('fullpath'));

displayV = [TestSuite.fromFolder(progDir),  TestSuite.fromPackage('import_cps'),  ...
   TestSuite.fromPackage('param_cps'),  TestSuite.fromPackage('stats_cps'),  TestSuite.fromPackage('vars_cps')];

run(displayV);


end