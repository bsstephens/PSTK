clear

compound = 'Atr-des';
model = 'spmdmodel';

ps = Passive2_set('Etienne','Etienne-mem','Etienne-sor');
as = Grab_set('ETIENNE','Etiennewater',compound)
psd = THREECOMPMODEL(model)

params = ps.calibrate(as,compound,psd,'F')

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
