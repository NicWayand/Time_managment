function [QC_Data_out, TIME_out] = Import_intermittent_time_data_to_continuous(TIME_in,QC_data,dt_out)

% This function takes in a matrix of time series data, that has intermitent
% date (non-continuous time steps), and outputs a new data matrix and time
% variaable that is continuous in the sense that it has consistent time
% steps
%%
% RELEASE NOTES
%   Coded into Matlab by Nic Wayand (nicway@gmail.com) June 20015
% 
% SYNTAX
%   [add]
% 
% INPUTS
% TIME_in       - Nx1 Matlab format time
% QC_data       - NxM Matrix of any type of data
% dt_out        - Desired output time step (hours)
%
% OUTPUTS
% TIME_out       - Nx1 Matlab format time (now continuous)
% QC_Data_out    - NxM Matrix of any type of data
%
% SCRIPTS REQUIRED
%  time_builder - https://github.com/NicWayand/Time_managment
%
%% Code %%

%% Initialize output variables
TIME_out    = time_builder(TIME_in(1),TIME_in(end),dt_out);
QC_Data_out = nan(size(TIME_out,1),size(QC_data,2));

%% Add rows of old matrix to new matrix

% Find common times
[C, B, D] =  intersect(TIME_in,TIME_out(:,7));
% NOTE: "If there are repeated common values in
%   A or B then the index of the first occurrence of each repeated value is
%   returned."

if numel(C) < size(TIME_out,1)
    disp('Warning not all original time steps were found. Might be OK if smaller time steps exist with TIME_in')
end

% Add old data to new matrix in new TIME_out rows
QC_Data_out(D,:) = QC_data(B,:);

