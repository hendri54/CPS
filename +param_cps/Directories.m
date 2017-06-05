classdef Directories < handle
   
properties
   baseDir  char
   % Directory with program files
   progDir  char
   % Summary stats for all variables
   varStatsDir  char
   % For test results
   testDir  char
   % For raw data files as downloaded
   asciiDir  char   
   % Variable info is stored here (such as code/value lists)
   varInfoDir  char
end

methods
   %% Constructor
   function dirS = Directories
      docuDir = fullfile('/Users', 'lutz', 'Documents');
      dirS.baseDir = fullfile(docuDir, 'econ', 'data', 'Cps');
      % Directory with program files
      dirS.progDir = fullfile(dirS.baseDir, 'prog');
      % For test results
      dirS.testDir = fullfile(dirS.baseDir, 'test_results');
      dirS.varStatsDir = fullfile(dirS.baseDir, 'var_stats');
      % For raw data files as downloaded
      dirS.asciiDir = fullfile(docuDir, 'data2', 'cps2017');
      dirS.varInfoDir = fullfile(dirS.baseDir, 'var_info');
   end
   
   
   %% Directory for a year
   function yearDir = year_dir(dirS, year1)
      yearDir = fullfile(dirS.asciiDir, sprintf('cps%i', year1));
   end
   
   
   %% Make directories for all years
   function make_year_dirs(dirS, yearV)
      for year1 = yearV(:)'
         yearDir = dirS.year_dir(year1);
         filesLH.mkdir(yearDir);
      end
   end
end
   
end