function d = Difference(x,m,td,fun,Cw,y0,twd)

%--------------------------------------------------------------------------
%Returns the sum of squares of the difference between data points and trial
%solution at time points for which data is available.M minimisation of this 
%difference leads the the optimised solution.
%
%x contains y points from function 'fun'
%m contains measured y data
%td contains x-axis
%
%B. Scott Stephens, 2004
%--------------------------------------------------------------------------

%map parameters
Kc=x(1);
kc=x(2);
summ=0;

toler= 0.000001;
% call ODE solver within MATLAB and time execution

tt=cputime ;
opts=odeset('AbsTol',toler,'RelTol',toler);

%interrogate model for values at specified points 
for i = 1:length(td)
[t,y] = ode45(fun,[0 td(i)],y0,opts,kc,Kc,Cw,twd);  
ym(i) = y(length(y));
summ = summ + (ym(i)-m(i))^2;
i=i+1;
end

%return sum of squares (difference) of those values and the data

d = sqrt(summ);





