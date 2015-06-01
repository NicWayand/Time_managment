function [mm dd] = DOY_2_mm_dd(DOY,YYYY)

% Input

% Output

% Testing
DOY = 32;
YYYY = 2001; 


%% CODE


mm = datestr(datenum(YYYY,1,DOY),'mm'); 