%This function converts a 4 digit time to hours and minutes
% 
%RELEASE NOTES
% Programmed by Mark Raleigh (mraleig1@uw.edu)
% Version 1.0 released March 4, 2010
% 
%SYNTAX
% [hr, minu] = hrminu(hhmm)
% 
%INPUTS
% hhmm = Lxw matrix of "hhmm" values
% 
%OUTPUTS
% hr = Lxw matrix, hours (0-23)
% minu = LxW matrix, mintues (0-59)
% 
%EXAMPLES
%
% Example 1
%       [hr, minu] = hrminu(114)
%       hr =    1
%       minu =  14
% 
% Example 2
%       [hr, minu] = hrminu(2355)
%       hr =    23
%       minu =  55

%%
function [hr, minu] = hrminu(hhmm)

if nanmax(nanmax(hhmm)) >= 2360 || nanmin(nanmin(hhmm)) < 0
    error('Invalid hhmm value detected')
end

L = size(hhmm,1);
w = size(hhmm,2);
hr =zeros(L,w)*NaN;
minu = zeros(L,w)*NaN;

for i=1:L
    for j=1:w
        if hhmm(i,j) <60
            hr(i,j) = 0;
            minu(i,j) = hhmm(i,j);
        elseif hhmm(i,j) >=100
            minu(i,j) = rem(hhmm(i,j), 100);
            hr(i,j) = (hhmm(i,j) - minu(i,j))/100;
        end
    end
end

if nanmin(nanmin(hr)) < 0 || nanmax(nanmax(hr)) > 23
    A = find(minu==nanmin(nanmin(hr)));
    B = find(minu==nanmax(nanmax(hr)));
    
    if isempty(A)==0
        disp(['Initial hhmm = ' num2str(hhmm(A))])
        disp(['Final hh, mm = ' num2str(hhmm(A)) ', ' num2str(minu(A))])
        disp('WARNING: Invalid hhmm value.  Returning NaN in its place.')
    end
    
    if isempty(B)==0
        disp(['Initial hhmm = ' num2str(hhmm(B))])
        disp(['Final hh, mm = ' num2str(hhmm(B)) ', ' num2str(minu(B))])
        disp('WARNING: Invalid hhmm value.  Returning NaN in its place.')
    end
end

if nanmin(nanmin(minu)) < 0 || nanmax(nanmax(minu)) >=60
    A = find(minu==nanmin(nanmin(minu)));
    B = find(minu==nanmax(nanmax(minu)));
    
    if isempty(A)==0
        disp(['Initial hhmm = ' num2str(hhmm(A))])
        disp(['Final hh, mm = ' num2str(hhmm(A)) ', ' num2str(minu(A))])
        disp('WARNING: Invalid hhmm value.  Returning NaN in its place.')
    end
    
    if isempty(B)==0
        disp(['Initial hhmm = ' num2str(hhmm(B))])
        disp(['Final hh, mm = ' num2str(hhmm(B)) ', ' num2str(minu(B))])
        disp('WARNING: Invalid hhmm value.  Returning NaN in its place.')
    end
end
