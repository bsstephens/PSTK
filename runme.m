clear
%as = Grab_set('ETIENNE','Etiennewater')
%psd = THREECOMPMODEL('empore2com1side')
%ps.plotperiods
%ps.calibrate(as,'atr-Des',psd,'F')


ps = Passive2_set('Gale','Gale-mem','Gale-sor');
as = Grab_set('GALE','Galewater','phenanth');
psd = THREECOMPMODEL('spmdmodel');

%ps.plotperiods
%ps.outplot('phenanth',)

%ps.calibrate(as,'phenanth',psd,'F')


%specify inputs
model = 'spmdmodel';
compound = 'phenanth';
km = 4800;                              %cm^3/day Gale
ks = 12;                                %cm^3/s Gale????
Kwm = 10^4.2;  
Kms = 6.3;

MSi = 0;                                   %initial mass on disk (ng/L)
MMi = 0;

tw = as.t-693960
Cw = as.concs
t0 = min(tw)
tf = max(tw)


%group inputs - DO NOT EDIT
params = [km, ks, Kwm, Kms];
bcs = [t0, tf, MMi, MSi];
exposure = [tw, Cw];

%call solver
[t,y] = ps.runmodel(model, params, bcs, exposure);
%plot(t,y(:,1),t,y(:,2));
ps.compareplot(compound,[t,y]);
            