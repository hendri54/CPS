function [loadV, success] = var_load_cps(varNameStr, year1)

fn = var_fn_cps(varNameStr, year1);

if exist(fn, 'file')
   % Some variables are output as single by StatTransfer
   loadV = load(fn);
   loadV = loadV.saveS;
else
   loadV = [];
   success = 0;
end


end