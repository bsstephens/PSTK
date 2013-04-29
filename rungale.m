%specify inputs
model = 'spmdmodel';
compound = 'phenanth';
km = 4800;                              %cm^3/day Gale
ks = 12;                                %cm^3/s Gale????
Kwm = 10^4.2;  
Kms = 6.3;
t0=0; tf=30;                       %(s)
MSi = 0;                                   %initial mass on disk (ng/L)
MMi = 0;
Cw=ones(1,30)*100/1000;                               %ng/L / cm^3/L
tw=[1:30];

%group inputs - DO NOT EDIT
params = [km, ks, Kwm, Kms];
bcs = [t0, tf, MMi, MSi];
exposure = [tw, Cw];

%call solver
[t,y] = ps.runmodel(model, params, bcs, compound, exposure)
plot(t,y(:,1),t,y(:,2));
