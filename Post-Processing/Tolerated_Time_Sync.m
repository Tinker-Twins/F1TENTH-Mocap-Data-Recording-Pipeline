%% Tolerated Time Synchronization of Data

myDir = 'C:\Users\csamak\Downloads\'; % Directory from where to import non-synchronized data
saveDir = 'C:\Users\csamak\Downloads\'; % Directory from where to export time-synchronized data
myFiles = dir(fullfile(myDir,'*.mat'));

for k = 1:length(myFiles)
  baseFileName = myFiles(k).name;
  fullFileName = fullfile(myDir, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  data = load(fullFileName);
  states_tsec = second(datetime(data.states_ts.Time,'ConvertFrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:SSSS'));
  inputs_tsec = second(datetime(data.inputs_ts.Time,'ConvertFrom','posixtime', 'Format', 'yyyy-MM-dd HH:mm:SSSS'));
  [unique_elements_inputs,kept_ind_ip,left_ind_ip]=unique_element_finder(inputs_tsec);
  [unique_elements_states,kept_ind_st,left_ind_st]=unique_element_finder(states_tsec);

   % Find common elements between control input arrays with cerain tolerance
   common_ip_st = ismembertol(unique_elements_inputs,unique_elements_states,1e-4);
   [ind_ip_st,val_ip_st] = find(common_ip_st>0);
   inputs_filtered = data.inputs(ind_ip_st,:);
   inputs_ts_filtered = unique_elements_inputs(ind_ip_st);
   for i=2:length(inputs_ts_filtered)
       if inputs_ts_filtered(i) < inputs_ts_filtered(i-1)
           inputs_ts_filtered(i) = inputs_ts_filtered(i) + 60;
       end
   end

   % Find common elements between system state arrays with cerain tolerance
   common_st_ip = ismembertol(unique_elements_states,unique_elements_inputs,1e-4);
   [ind_st_ip,val_st_ip] = find(common_st_ip>0);
   states_filtered = data.states(ind_st_ip,:);
   states_ts_filtered = unique_elements_states(ind_st_ip);
   for i=2:length(states_ts_filtered)
       if states_ts_filtered(i) < states_ts_filtered(i-1)
           states_ts_filtered(i) = states_ts_filtered(i) + 60;
       end
   end   

   updated_data.inputs = inputs_filtered;
   updated_data.inputs_ts = inputs_ts_filtered;
   updated_data.states = states_filtered;
   updated_data.states_ts = states_ts_filtered;

   if (length(updated_data.inputs_ts) == length(updated_data.states_ts)) == 1
       % Saving data if data samples match
       base_name_ = split(string(baseFileName),'.'); % Extract base file name
       fname_updated = string(base_name_(1) + '_filtered.mat'); % Save file as
       save_file_dir = string(saveDir+fname_updated);
       fprintf(1,'Saving updated file as %s\n',save_file_dir)
       save(save_file_dir,'updated_data')
   else
       % Displaying error if data samples do not match
       disp('Samples not matching!')
       break
   end 
end

%% Helper function

function [unique_samples,kept_ind,left_ind] = unique_element_finder(input_data)
unique_samples = [];
kept_ind = [];
left_ind = [];
for i = 1:length(input_data)
    test = ismembertol(input_data(i),unique_samples,1e-5);
    if test == 0
        unique_samples = [unique_samples;input_data(i)];
        kept_ind = [kept_ind;i];
    else
        left_ind = [left_ind;i];
    end
end
end