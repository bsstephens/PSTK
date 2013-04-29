function [f] = empore2com1side(t,y,opts,k,K,Cw,twd)
%-----------------------------------------------------------
% function file for c18 disk uptake of diuron in tank exp3
% states are:    y(1)= mass of a in membrane(ng) 
%                y(2)= mass of a in sorbent(ng)
% units are:    volume in L
%               mass in ng
%               k [s^-1]
%-----------------------------------------------------------
%map state variables 

MaM = y(1,1);
MaS = y(2,1);
Kwm = K(1);
Ksm = K(2);
km = k(1);
ks = k(2);

%system parameters and input variables
VM = 80e-6;                                     %[m^3] volume of membrane
VS = 344e-6;                                    %[m^3] volume of SDB in the empore disk - Green

%determine which conc to use based on which time is being passed

if t<=max(twd)  
    i=min(find(twd>=t));
end

if t>max(twd)
     i=length(twd);
end
Cwater=Cw(i);

% EVALUATE DIFFERENTIAL EQUATION AND RETURN RHS
f(1) = (km*(Cwater - (MaM/VM)/Kwm)) - (ks*(MaM/VM - (MaS/VS)/Ksm));  	   %f(1) = dmM/dt
f(2) = (ks*(MaM/VM - (MaS/VS)/Ksm));                                      %f(1) = dmS/dt


f=f';

