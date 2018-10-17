% --------------------------------------------------------------------
% Script to calculate the WB model of CORDEX data (historical and RCPs)
% --------------------------------------------------------------------

% define the starting lakelevel
define_L0; 

% define minimum and maximum lake level
Lbounds = define_minmax(flag_outscen); 

% determine Pel
determ_Pel; 

if flag_run == 1 
    L0 = lakelevel(1);
    
    [L_obs,Qout_ac] = solveWB(P_wb_obs, E_wb_obs, Qin_wb_obs, Qout, A_lake, L0, ndays,flag_run,flag_outscen,Pel,k,Lbounds);   

elseif flag_run == 2 
     L0 = lakelevel(1);
     
    for i = 1:nRCMs
        
       [L_ev(i,:),~] = solveWB(P_wb_ev(i,:),E_wb_ev(i,:),Qin_wb_ev(i,:),Qout, A_lake, L0, ndays,flag_run,flag_outscen,Pel,k,Lbounds);
  
    end

elseif flag_run == 3 % historical
    L0 = lakelevel_all(1097); 
     for i = 1:nm
         fprintf('Calculating WB for model %d of %d  \n',i,nm);
         [L_hist(i,:),Qout_hist(i,:)] = solveWB(P_wb_hist(i,:),E_wb_hist(i,:),Qin_wb_hist(i,:),Qout, A_lake, L0, ndays,flag_run,flag_outscen,Pel,k,Lbounds);
     end
     

elseif flag_run == 4  % RCP 2.6
     L0 = L0_rcp26;
     
     for i = 1:nm
         
         fprintf('Calculating WB for model %d of %d  \n',i,nm);
         
         [L_rcp26(i,:), Qout_rcp26(i,:)] = solveWB(P_wb_rcp26(i,:),E_wb_rcp26(i,:),Qin_wb_rcp26(i,:),Qout, A_lake, L0(1,i), ndays,flag_run,flag_outscen,Pel,k,Lbounds);
     end
     
elseif flag_run == 5  % RCP 4.5
     L0 = L0_rcp45;
     
      for i = 1:nm
          
        fprintf('Calculating WB for model %d of %d  \n',i,nm);
        
        [L_rcp45(i,:), Qout_rcp45(i,:)] = solveWB(P_wb_rcp45(i,:),E_wb_rcp45(i,:),Qin_wb_rcp45(i,:),Qout, A_lake, L0(1,i), ndays,flag_run,flag_outscen,Pel,k,Lbounds);
      end 

    
 
elseif flag_run == 6  % RCP 8.5
    L0 = L0_rcp85;

     for i = 1:nm
    
     fprintf('Calculating WB for model %d of %d  \n',i,nm);
     
     [L_rcp85(i,:), Qout_rcp85(i,:)] = solveWB(P_wb_rcp85(i,:),E_wb_rcp85(i,:),Qin_wb_rcp85(i,:),Qout, A_lake, L0(1,i), ndays,flag_run,flag_outscen,Pel,k,Lbounds);
   
     
     end

end

