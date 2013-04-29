function [f] = nakedc18(t,y,opts,k,K)
%-----------------------------------------------------------
% function file for c18 disk uptake of diuron in tank exp3
% states are:    y(1)= mass of diuron in empore (ng) 
%		
% units are:    volume in L
%               mass in ng
%               k [s^-1]
%-----------------------------------------------------------
%map state variables 

MaM = y(1);
MaS = y(2);
Kws = K(1);
Ksm = K(2);
km = k(1);
ks = k(2);

%system parameters and input variables
VM = 344e-6;                                    %[L] volume of c18 in the empore disk - Green
VS = 344e-6;                                    %[L] volume of c18 in the empore disk - Green

Mdw = 30e3;                                     %[ng] mass of diuron in tank

if t < 3.1*24*3600 
     Vw = 350;                                 %[L] volume of water in tank
 elseif t > 3.1*24*3600 && t < 7.2*24*3600
     Vw = 700;
 else t > 7.2*24*3600;
     Vw = 1400;
end

% EVALUATE DIFFERENTIAL EQUATION AND RETURN RHS
f(1) = VM*(km*(Mdw/Vw - (MaM/VM)/Kws));  	   %f(1) = dmM/dt
f(2) = VS*(ks*(f(1)/VM - (MaS/VS)/Ksm));  	   %f(1) = dmS/dt


f=f';

