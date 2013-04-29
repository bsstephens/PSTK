function d = Difference2(x,m,td,fun,Cw,y0,twd)

%--------------------------------------------------------------------------
%Returns the sum of squares of the difference between data points and trial
%solution at time points for which data is available.M minimisation of this 
%difference leads the the optimised solution.
%
%x contains y points from function 'fun'
%m contains measured y data
%td contains x-axis
%
%B. Scott Stephens, 2011
%--------------------------------------------------------------------------

%map parameters
k(1)=x(1);
k(2)=x(2);
K(1)=x(3);
K(2)=x(4);
mm = m(:,1);
ms = m(:,2);

summ=0;

toler= 0.01;
% call ODE solver within MATLAB and time execution

tt=cputime ;
opts=odeset('AbsTol',toler,'RelTol',toler);

%interrogate model for values at specified points 
for i = 1:length(td)

[t,y] = ode45(fun,[0 td(i)],y0,opts,k,K,Cw,twd);

y1m(i) = y(length(y),1);  %takes y value (mass in mem) at td(i)
y2m(i) = y(length(y),2);  %takes y value (mass in sorb) at td(i)

weight = ms(length(ms))/mm(length(mm));  %weighting for optimisation

summ = summ + (weight * (y1m(i)-mm(i)))^2 + (y2m(i)-ms(i))^2; %sum of squares of dif

i=i+1;
end

%return sum of squares (difference) of those values and the data
[k,K,sqrt(summ)]
d = sqrt(summ);





