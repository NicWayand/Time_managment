% Gives a binary indicator whether a year is a leap year or not.
% Returns 1 for leap years and 0 for non-leap years.
% 
% RELEASE NOTES
%   Written by Mark Raleigh (mraleig1@uw.ed), November 2009
% 
% SYNTAX
%   leapbinary = isleap(years)
% 
% INPUTS
%   years = NxN matrix or array of years
% 
% OUTPUTS
%   leapbinary = NxN matrix of binary description of leap years
% 
% NOTES
%   If a fractional year is provided the code will round down:
%   Example:    isleap(1996.512) will return 1
%               isleap(2001.139) will return 0
% 
%   If NaN or INF values are provided, these will be output as NaN values


function leapbinary = isleap(years)


%% Code

%%%Check dimensions of year matrix
L= size(years,1);
w= size(years,2);

%%%Create matrix  for binary leap values
leapbinary = zeros(L,w);

%%%Round any fractional years down
years = floor(years);

%%%Cycle through the rows/columns and test for leap years
for i=1:L
    for j=1:w
        leapbinary(i,j) = isLeapYear(years(i,j));
    end
end

%%% Change years with inf and NaN values to NaN values in the leap matrix output
INFvals = isinf(years)==1;
NANvals = isnan(years)==1;
leapbinary(INFvals) = NaN;
leapbinary(NANvals) = NaN;


end

%% Tests for leap years

% This algorithm is based off of wikipedia's definition of leap year:
%       http://en.wikipedia.org/wiki/Leap_year#Algorithm

function leap= isLeapYear(year)
    if ((rem(year,4)== 0) && (rem(year,100) ~= 0)) || (rem(year,400) == 0)
        leap = 1;
    else 
        leap = 0;
    end
end