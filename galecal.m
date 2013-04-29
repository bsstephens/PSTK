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

params = ps.calibrate(as,'phenanth',psd,'F')

model = 'spmdmodel';
compound = 'phenanth';

tw = as.t-693960
Cw = as.concs
t0 = min(tw)
tf = max(tw)
MMi = 0;
MSi = 0;


%group inputs - DO NOT EDIT
bcs = [t0, tf, MMi, MSi];
exposure = [tw, Cw];

%call solver
[t,y] = ps.runmodel(model, params, bcs, exposure);
%plot(t,y(:,1),t,y(:,2));
ps.compareplot(compound,[t,y]);
