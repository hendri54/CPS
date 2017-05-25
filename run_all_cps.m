function run_all_cps
% Run everything in sequence 

cS = const_cps;




%% Import the dataset
% Create an extract.
% Use stat/transfer to make a matlab dataset. Contains all years and variables
if false
   % Create required directories
   dirS = param_cps.Directories;
   dirS.make_year_dirs(cS.yearV);
   filesLH.mkdir(dirS.testDir);

   inFn = fullfile(dirS.asciiDir, 'downloads', 'd2017_05_25', 'cps_00014.mat');
   import_cps.import_dataset(inFn, 'data_main');
   
   % Write tables with summary stats for original variables of interest
   stats_cps.var_summary_tables([]);
end


end
