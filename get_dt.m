function dt = get_dt(TIMEin)

% Input:
    % TIMEin - Matlab format Nx1 serial dates
    % roundto - string to round dt to (i.e. 'minute','second','hour')
% Output:
    % dt - Time step (hours)
    
    
if size(TIMEin,2) > 1 % Its in Nx7 format
    TIMEin = TIMEin(:,7);
end

TIMEin = datenum_round_off(TIMEin,'second');
    
dt = abs(TIMEin(3)-TIMEin(2)) *24*60*60; % Convert from days to seconds

% Round to whole seconds
dt = round(dt);

% Convert back to hours

dt = dt / (60*60); 