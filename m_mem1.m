function [f] = m_mem1(t,y,opts,k,K,Cw,twd)
%-----------------------------------------------------------
% function file for empore disk uptake of diuron
% This file is called by Params.m
% states are:    y(1)= mass of herbicide in disk (ng)
% units are:    volume (L)
%               mass (ng)
%               kA is k*A [L/s]
%B. Scott Stephens, 2008
%
%-----------------------------------------------------------
%
%map state variables 

Ms = y(1);

%system parameters and input variables
Vs = 334e-6;                                    %[L] volume of sdb in disc - 3m

%determine which conc to use based on which time is being passed

if t<=max(twd)  
    i=min(find(twd>=t));
end

if t>max(twd)
     i=length(twd);
end
Cwater=Cw(i);

% EVALUATE DIFFERENTIAL EQUATION AND RETURN RHS
f(1) = (k*(Cwater - (Ms/Vs)/K));  	   %f(1) = dmE/dt

f=f';

