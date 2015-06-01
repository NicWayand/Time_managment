% Uniformly shifts a time matrix (time_builder.m) by a defined hour
% 
% RELEASE NOTES
%   Written by Mark Raleigh (mraleig1@uw.edu), Jan 2010
% 
% SYNTAX
%   time_out = time_shift(time_in, hr_shift)
% 
% EXAMPLE
%   If you have a time matrix in UTC and want to shift to PST (8 hours behind UTC), do the following:
%   time_out = time_shift(time_in, -8);
%   NOTE: Leave the data as they are.  Shift the time only.
% 
% INPUTS
%   time_in = Lx7 time_builder.m formatted time matrix
%   hr_shift = 1x1 value, time shift (hours) from input to output
% 
% OUTPUTS
%   time_out = Lx7 time matrix, shifted by defined hour difference
% 
% SCRIPTS REQUIRED
%   time_builder.m

function time_out = time_shift(time_in, hr_shift)

%% Checks

if size(time_in,2) ~=7
    error('time_in must be a Lx7 time_builder.m matrix')
end

if numel(hr_shift) ~=1
    error('hr_shift must be a 1x1 value, in hours')
end

%% Code
sdates = time_in(:,7) + (hr_shift/24);
time_out = time_builder(sdates);


