%-----------------------------------------------------------
% Driver routine for the simulation of diuron uptake in an empore disk
% The equation system is contained in the .m file called naked.m
% B.S. Stephens Feb 2004
%-----------------------------------------------------------

compound = 'diuron'
%Set the initial conditions for the problem y0(1) - tank height (m)
 t0=0; tf=12*24*3600;                       %(s)
 MWi = 30e-6;                               %initial mass in water (ng/L)                                
 Mdw = 30e3;                                %[ng] mass of diuron in tank
 
 MSi = 0;                                   %initial mass on disk (ng/L)
 MMi = 0;
 y0= [MMi, MSi];                                   %initial conditions
 
 VEc = 144e-6;                               %[L] volume of c18 in the empore disk - Green
 
%EQUILLIBRIUM DATA for calculating K if required
MEeqc = 125;                               %ng/disk
MWeqc = Mdw;                               %assume
Vweqc = 700;                               %L
KcED = (MEeqc/VEc)/(MWeqc/Vweqc);           %Eq constant

%SPECIFY kup and Kc
logkm = -1.268; 
logks = -0.268;
km = 10^logkm;             %BF:-1.268 (eq data)
ks = 10^logks;
k = [km,ks];
logKwm = 4.5; 
logKms = 5.5;
Kwm = 10^logKwm;                 
Kms = 10^logKms;
K = [Kwm,Kms];

toler= 0.1;
% call ODE solver within MATLAB 
    opts=odeset('AbsTol',toler,'RelTol',toler);
    [t,y]=ode45('nakedc18',[t0 tf],y0,opts,k,K);
%DATA POINTS 
mc18 = [125;125;84];
td = [3.1;7.2;11]*24*3600;
                               
plot(t/(3600*24),y(:,1),t/(3600*24),y(:,2));

TITLE(compound)
ylabel('ng/disk');
xlabel('days');
legend('mem data','sorb data', strcat('log km = ',sprintf('%0.5g',log10(km)),', log Kwm = ',sprintf('%0.5g',log10(Kwm))),strcat('log ks = ',sprintf('%0.5g',log10(ks)),', log Kms = ',sprintf('%0.5g',log10(Kms))),4);
legend boxoff