classdef Passive2_set
%PASSIVE2_SET 
%   This class defines a set of passive sampling data typically taken at
%   the same site over a period of time. It provides statistical methods for
%   replicates and for passive sampler uptake into both membrane and
%   sorbent, including an nls calibration method for estimating paramters 
%   (kinetic and equilibrium) for each of the the 2 components (memb and
%   sorb)

   properties
        ti
        tf
        Cm
        Cs
        Chemsm
        Chemss
        path
        memfile
        sorbfile        
   end

   methods
       function P2SET = Passive2_set(pathname,memfile,sorbfile)
           %instantiate a Passive_set object based on 
           %membrane file
           readpath = strcat('DATAIN/',pathname,'/',memfile);
           [numeric, txt, raw] = xlsread(readpath);                                   %read excel file
           [m,n]=size(numeric);
           P2SET.ti = datenum(datestr(numeric(:,1) + datenum('30-Dec-1899') ,0));    %convert Excel dates into Matlab format
           P2SET.tf = datenum(datestr(numeric(:,2) + datenum('30-Dec-1899') ,0));    %"
           P2SET.Cm = numeric(1:m,3:n);                                              %remove first two (time) columns for conc matrix
           P2SET.Chemsm = txt(1, 3:length(txt));
           P2SET.path = pathname;
           P2SET.memfile = memfile;
           
           %and sorbfile
           readpath = strcat('DATAIN/',pathname,'/',sorbfile);
           [numeric, txt, raw] = xlsread(readpath);                                   %read excel file
           [m,n]=size(numeric);
           P2SET.Cs = numeric(1:m,3:n);                                               %remove first two (time) columns for conc matrix
           P2SET.Chemss = txt(1, 3:length(txt));
           P2SET.sorbfile = sorbfile;
    
       end
       
       function chemCms = chemCms(P2SET, cmpname)
           %returns an array of concentrations for selected compound in
           %membrane
            for i = 1:length(P2SET.Chemsm)                                        %interrogate mem data for selected compound only                              
              if strcmpi(P2SET.Chemsm{i}, cmpname)
                  cmpindex = i;
              end
           end
            chemCms = P2SET.Cm(:,cmpindex);
       end
   
       function chemCss = chemCss(P2SET, cmpname)
           %returns an array of concentrations for selected compound in
           %sorbent
            for i = 1:length(P2SET.Chemss)                                        %interrogate mem data for selected compound only                              
              if strcmpi(P2SET.Chemss{i}, cmpname)
                  cmpindex = i;
              end
           end
            chemCss = P2SET.Cs(:,cmpindex);
       end
       
       function MEMset = MEMset(P2SET,cmpd)
           %this function returns sorbent compound data as a 2d matrix 
           %(exposure time; conc)
        MEMconc = P2SET.chemCms(cmpd);
        Dtime = [abs(P2SET.tf - P2SET.ti)];
        MEMset = [Dtime,MEMconc];
       end 
  
       function SORBset = SORBset(P2SET,cmpd)
           %this function returns sorbent compound data as a 2d matrix 
           %(exposure time; conc)
        SORBconc = P2SET.chemCss(cmpd);
        Dtime = [abs(P2SET.tf - P2SET.ti)];
        SORBset = [Dtime,SORBconc];
       end
       
       function plotperiods = plotperiods(P2SET)
          %plot PSD exposure durations as horizontal bars.
          group = [(P2SET.ti), (P2SET.tf)];
          timegroup = P2SET.ti(:,1);
          [replicates,number] = grpstats(timegroup,group,{'gname','numel'});
               for i = 1:size(replicates)
               reptimes = [str2num(replicates{i,1}):str2num(replicates{i,2})];
               repgroup = ones(size(reptimes))*i;
               plot(reptimes,repgroup,'LineWidth',3);
               ylim ([0 size(replicates,1)+1]);                                 %format plot bounds
               datetick('x',19);                                                %change to date format
               hold on
               end
           title(P2SET.path)
       end
       
       function compareplot = compareplot(P2SET,cmpd,simresults)
           SORBdata = SORBset(P2SET,cmpd)
           t = SORBdata(:,1);                                 %sampler times 
           ms = SORBdata(:,2);                               %median sampler masses of compound 
           MEMdata = MEMset(P2SET,cmpd);
           mm = MEMdata(:,2);  
           plot(t,mm,'ro',t, ms,'bo',simresults(:,1),simresults(:,2),'r-',simresults(:,1),simresults(:,3),'b-')
           ylabel('ng');
           xlabel('days');
           legend('membrane','sorbent')
       end
        
       function [t,y] = runmodel(P2SET,model,params,bcs,exposure)
       %Set the initial conditions for the problem y0(1) - tank height (m)
        t0= bcs(1);
        tf= bcs(2);
        MMi=bcs(3);
        MSi=bcs(4);
        y0=[MMi, MSi];
        k = [params(1),params(2)]
        K = [params(3),params(4)]
        tw = exposure(:,1);
        Cw = exposure(:,2)
        toler= 0.001;
        % call ODE solver within MATLAB 
        opts=odeset('AbsTol',toler,'RelTol',toler);
       
        [t,y]=ode45(model,[t0 tf],y0,opts,k,K,Cw,tw);
       end
       
       function PSparams = calibrate(P2SET,ASET,cmpd,PSD,FR)
           
           [grabdata] = ASET.mav(cmpd);                      %use cubic spline function of concentration data
           tw = grabdata(:,1) - min(grabdata(:,1));          %convert times to 0 basis (still in days)
           Cw = grabdata(:,2);                                 
           
           SORBdata = SORBset(P2SET,cmpd)
           t = SORBdata(:,1)                                 %sampler times 
           ms = SORBdata(:,2);                               %median sampler masses of compound 
           
           MEMdata = MEMset(P2SET,cmpd)
           mm = MEMdata(:,2);                                %median sampler masses of compound (sorb)
           
           y0 = [0,0];
           
           if FR=='R'                                        %reverses vectors for reverse calibration
            Cw = flipud(Cw);   
            tw = flipud(tw);
            ms = flipud(ms);
            t = flipud(t);
            mm = flipud(mm);
            Tf=tw(1);
            T0=tw(length(tw));
           end
           
           if FR=='F'
               T0=tw(1)
               Tf=tw(length(tw))
           end
           
           m=[mm, ms];
                                             %volume of sorbent (m^3)
           model = PSD.model;
   
            %determine best fit values for k and K for sampler. x us an array
            %structure containing the output paramters. fval2 contains minimization residuals
            %Paramters are kwm, kms, Kwm, Kms
            Paramguess = [0.185277,4.25924e-005,3231.86,1.53018];            %guess paramters to start optimisation
            
            %Paramguess = [1e-6,1e-2,4,2];            %guess paramters to start optimisation
            [params,fval,exitflag]=fminsearch(@Difference2,Paramguess,[],m,t,model,Cw,y0,tw)

            PSparams = params
        end    
       
       
   end
   
end