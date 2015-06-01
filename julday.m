% Determines the Julian Day
%
% RELEASE NOTES
%   V1.1 - Fixed bugs related to array/matrices, (mraleig1@uw.edu), Nov 2010
%   Adapted from julday4.m by Mark Raleigh (mraleig1@uw.edu), May 2009
%   
%
% SYNTAX
% dtg = julday(Y, M, D)
%
% INPUTS
% 	Y = Lxw matrix or array, years
%	M = Lxw matrix or array, months
%	D = Lxw matrix or array, days
%
% OUTPUTS
%	dtg = 1x1 value, julian day


function dtg = julday(Y, M, D)


%% Initial Checks

if numel(Y) ~= numel(M) || numel(Y) ~= numel(D)
    error('year, month, and day inputs must be same size')
end

if size(Y,1) ~= size(M,1) || size(Y,1) ~= size(D,1)
    error('year, month, and day inputs must be same size')
end

if size(Y,2) ~= size(M,2) || size(Y,2) ~= size(D,2)
    error('year, month, and day inputs must be same size')
end

%% 

L = size(Y,1);
w = size(Y,2);

dtg = zeros(L,w)*NaN;

for i=1:L
    for j=1:w
        cumD=[0,31,59,90,120,151,181,212,243,273,304,334];

        yr = Y(i,j);
        mo = M(i,j);
        da = D(i,j);
        
%% Checks
        if mo < 0 || mo > 12
            error('mo must be a valid number for the month')
        end

        if da < 0 || da > 31
            error('da must be a valid number for the day')
        end

        if mo == 4 || mo == 6 || mo == 9 || mo == 11
            if da > 30
                error('Invalid day number in April, June, September, or November')
            end
        end

        if rem(yr,4) == 0
            if mo == 2 && da > 29
                error('Invalid day number in February')
            end        

        else
            if mo == 2 && da > 28
                error('Invalid day number in February')
            end        
        end



        %% Code


        if (rem(yr,4)==0) 
            inc=1;
        else
            inc=0;
        end

        cumD(3:12)=cumD(3:12)+inc;
        
        dtg(i,j) = cumD(mo) + da;

    end
end

