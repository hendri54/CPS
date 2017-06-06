function run_all_cps
% Run everything in sequence 

cS = const_cps;




%% Import the dataset
% Create an extract.
% Use stat/transfer to make a matlab dataset. Contains all years and variables
if true
   % Create required directories
   dirS = param_cps.Directories;
   dirS.make_year_dirs(cS.yearV);
   filesLH.mkdir(dirS.testDir);

   % File name reflects that last downloaded version of the data
   inFn = fullfile(dirS.asciiDir, 'downloads', 'd2017_05_25', 'cps_00014.mat');
   import_cps.import_dataset(inFn, 'data_main');
end

if true
   % Check variables and replace missing value codes
   for year1 = cS.yearV(:)'
      import_cps.process_year(year1);
   end
end

if true
   % Write tables with summary stats for original variables of interest
   stats_cps.var_summary_tables([]);
   
   % Report variable errors (for variables with defined info)
   % stats_cps.variable_errors([], []);  
end


end
