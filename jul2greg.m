%jul2greg.m

% This code inputs a year and julian date, and outputs the month and day.
% This assumes that the julian day does not have a time (hours, min, sec)
% component.  

% Programmed by Mark Raleigh 2/27/2008


% Example 1 - Non-leap year
% >> [month, day] = jul2greg(2006,241)
% month =
%      8
% day =
%     29

% Example 2 - Leap year
% >> [month, day] = jul2greg(2008,241)
% month =
%      8
% day =
%     28

  

function [gmonth, gday] = jul2greg(yr, jd)

if (rem(yr,4) ==0)          % test for leap year
    jul_index = zeros(366,3);
    
    for i=1:366
        jul_index(i,1) = i;
    end
    
    jul_index(1:31,2) = 1;
    jul_index(32:60,2) = 2;
    jul_index(61:91,2) = 3;
    jul_index(92:121,2) = 4;
    jul_index(122:152,2) = 5;
    jul_index(153:182,2) = 6;
    jul_index(183:213,2) = 7;
    jul_index(214:244,2) = 8;
    jul_index(245:274,2) = 9;
    jul_index(275:305,2) = 10;
    jul_index(306:335,2) = 11;
    jul_index(336:366,2) = 12;
    
    for a=1:31                  % January
        jul_index(a,3) = a;
    end
        
    for b=1:29                  % February
        jul_index(a+b,3) = b;
    end
    
    for c=1:31                  % March
        jul_index(a+b+c,3) = c;
    end
    
    for d=1:30                  % April
        jul_index(a+b+c+d,3) = d;
    end
    
    for e=1:31                  % May
        jul_index(a+b+c+d+e,3) = e;
    end
    
    for f=1:30                  % June
        jul_index(a+b+c+d+e+f,3) = f;
    end
    
    for g=1:31                  % July
        jul_index(a+b+c+d+e+f+g,3) = g;
    end
    
    for h=1:31                  % August
        jul_index(a+b+c+d+e+f+g+h,3) = h;
    end
    
    for i=1:30                  % September
        jul_index(a+b+c+d+e+f+g+h+i,3) = i;
    end
    
    for j=1:31                  % October
        jul_index(a+b+c+d+e+f+g+h+i+j,3) = j;
    end
    
    for k=1:30                  % November
        jul_index(a+b+c+d+e+f+g+h+i+j+k,3) = k;
    end
    
    for l=1:31                  % December
        jul_index(a+b+c+d+e+f+g+h+i+j+k+l,3) = l;
    end
    
else
    jul_index = zeros(365,3);
    
    for i=1:365
        jul_index(i,1) = i;
    end
    
    jul_index(1:31,2) = 1;
    jul_index(32:59,2) = 2;
    jul_index(60:90,2) = 3;
    jul_index(91:120,2) = 4;
    jul_index(121:151,2) = 5;
    jul_index(152:181,2) = 6;
    jul_index(182:212,2) = 7;
    jul_index(213:243,2) = 8;
    jul_index(244:273,2) = 9;
    jul_index(274:304,2) = 10;
    jul_index(305:334,2) = 11;
    jul_index(335:365,2) = 12;
    
    for a=1:31                  % January
        jul_index(a,3) = a;
    end
        
    for b=1:28                  % February
        jul_index(a+b,3) = b;
    end
    
    for c=1:31                  % March
        jul_index(a+b+c,3) = c;
    end
    
    for d=1:30                  % April
        jul_index(a+b+c+d,3) = d;
    end
    
    for e=1:31                  % May
        jul_index(a+b+c+d+e,3) = e;
    end
    
    for f=1:30                  % June
        jul_index(a+b+c+d+e+f,3) = f;
    end
    
    for g=1:31                  % July
        jul_index(a+b+c+d+e+f+g,3) = g;
    end
    
    for h=1:31                  % August
        jul_index(a+b+c+d+e+f+g+h,3) = h;
    end
    
    for i=1:30                  % September
        jul_index(a+b+c+d+e+f+g+h+i,3) = i;
    end
    
    for j=1:31                  % October
        jul_index(a+b+c+d+e+f+g+h+i+j,3) = j;
    end
    
    for k=1:30                  % November
        jul_index(a+b+c+d+e+f+g+h+i+j+k,3) = k;
    end
    
    for l=1:31                  % December
        jul_index(a+b+c+d+e+f+g+h+i+j+k+l,3) = l;
    end
   
end

gmonth = jul_index(jd,2);
gday = jul_index(jd,3);
