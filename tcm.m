function [f] = tcm(t,y,opts,k,K,Cw,twd)
%-----------------------------------------------------------
% function file for empore disk uptake of diuron
% This file is called by Params.m
% states are:    y(1)= mass of compound in membrane (ng)
% states are:    y(2)= mass of compound in disk (ng)
% units are:    volume (L)
%               mass (ng)
%               kA is k*A [L/s]
%B. Scott Stephens, 2011
%-----------------------------------------------------------
%%map state variables 
MdM = y(1);
MdS = y(2);

%system parameters and input variables
VE = 334e-6;                                    %[L] volume of disc - 3m
VM = 334e-6;                                    %[L] volume of membrane (**CHECK**)

%determine which conc to use based on which time is being passed
if t<=max(twd)  
    i=min(find(twd>=t));
end
if t>max(twd)
     i=length(twd);
end
Cwater=Cw(i);

% EVALUATE DIFFERENTIAL EQUATION AND RETURN RHS
f(1) = (k*(Cwater - (MdE/VE)/K));  	   %f(1) = dmE/dt
f(2) = (k2*(Cmem - (MdE/VE)/K));

f=f';

