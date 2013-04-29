classdef Passive_set
%PASSIVE_SET 
%   This class defines a set of passive sampling data typically taken at
%   the same site over a period of time. It provides statistical methods for
%   replicates and for passive sampler uptake

   properties
        ti
        tf
        concentrations
        compounds
        path
        file
   end

   methods
       function PSET = Passive_set(pathname,filename)
           %instantiate a Passive_set object based on file
           readpath = strcat('DATAIN/',pathname,'/',filename)
           [numeric, txt, raw] = xlsread(readpath);                              %read excel file
           PSET.ti = datenum(datestr(numeric(:,1) + datenum('30-Dec-1899') ,0)); %convert Excel dates into Matlab format
           PSET.tf = datenum(datestr(numeric(:,2) + datenum('30-Dec-1899') ,0)); %"
           [m,n]=size(numeric);
           PSET.concentrations = numeric(1:m,3:n);                               %remove first two (time) fields for conc matrix
           PSET.compounds = txt(1, 3:length(txt));
           PSET.path = pathname;
           PSET.file = filename;
       end
       
       
       function cmpconcs = cmpconcs(PSET, cmpname)
           %returns an array of concentrations for selected compound
            for i = 1:length(PSET.compounds)                                      %interrogate data for selected compound only                              
              if strcmpi(PSET.compounds{i}, cmpname)
                  cmpindex = i;
              end
           end
            cmpconcs = PSET.concentrations(:,cmpindex);
       end
        
       function plotperiods = plotperiods(PSET)
          %plot PSD exposure durations as horizontal bars.
          group = [(PSET.ti), (PSET.tf)];
          timegroup = PSET.ti(:,1);
          [replicates,number] = grpstats(timegroup,group,{'gname','numel'});
               for i = 1:size(replicates)
               reptimes = [str2num(replicates{i,1}):str2num(replicates{i,2})];
               repgroup = ones(size(reptimes))*i;
               plot(reptimes,repgroup,'LineWidth',3);
               ylim ([0 size(replicates,1)+1]);                                 %format plot bounds
               datetick('x',19);                                                %change to date format
               hold on
               end
           title(PSET.PSD)
       end
       
        function plotuptake = plotuptake(PSET,cmpname)
           %plot boxplots of mass uptake into PSDs. The
           %boxplot shows statistics for replicate samplers deployed over
           %the same period
            conc = PSET.cmpconcs(cmpname);
            group = [(PSET.ti), (PSET.tf)]
            [replicates,number,av,stdv,ci,group_median,group_iqr] = grpstats(conc,group,{'gname','numel','mean','std','meanci',@median,@iqr})
            figure %plot masses in individual passive samples as boxplot
            for i = 1:length(PSET.compounds)                                      %interrogate data for selected compound only                              
              if strcmpi(PSET.compounds{i}, cmpname)
                  cmpindex = i;
              end
           end
            cmpconcs = PSET.concentrations(:,cmpindex);
            
            boxplot (PSET.concentrations(:,cmpindex),group)
           	title(strcat(cmpname,' --  ', PSET.PSD));
       end
       
       function caliset = caliset(PSET,cmpd,FR)
           %this function creates a nx2 matrix (t and conc) for the 
           %calibration method. Samplers that are in the input data
           %file with times that don't start from (or finish at) the
           %base time are dropped from the calibration routine. Base time 
           %is determined from the data as the mode for ti or tf depending 
           %on whether it is a forward or reverse calibration. To inidicate a
           %reverse calibration, 'R' is passed as the second parameter.
          if FR == 'R'
               timefield = 2; %tf is the base time
           else 
               timefield = 1; %ti is the base time
           end
           group = [(PSET.ti), (PSET.tf)];
           conc = PSET.cmpconcs(cmpd);
           [replicates,number,av,stdv,ci,group_median,group_iqr] = grpstats(conc,group,{'gname','numel','mean','std','meanci',@median,@iqr});
               for i = 1:size(replicates)
               calset(i,:) = [str2num(replicates{i,1}),str2num(replicates{i,2})]
               end
               starttime = mode(calset(:,timefield))          %we select the time that is most prevalent to calibrate from
               k=1;
               for j = 1:size(calset,1)                       %create the calibration data for the optimisation method
                   if calset(j,timefield) == starttime
                   calset2(k,1)=[abs(calset(j,1)-calset(j,2))];
                   calset2(k,2) = group_median(j);
                   k=k+1;
                   end
               end
               caliset=calset2;
       end   
       
       function PSset = PSset(PSET,cmpd)
           %this function returns passive data as a 2d matrix 
           %(exposure time; conc)
        conc = PSET.cmpconcs(cmpd);
        Dtime = [abs(PSET.tf - PSET.ti)];
        PSset = [Dtime,conc];
       end   
       
       function outparams = outparams(PSET,ASET,cmpd,PSD, FR)
           
           Paramguess = [10^5,10^-1];                       %guess paramters to start optimisation
           [grabdata] = ASET.dataspline(cmpd);              %use cubic spline function of concentration data
           tw = grabdata(:,1) - min(grabdata(:,1))          %convert times to 0 basis (still in days)
           Cw = grabdata(:,2)                                 
           %PSDdata = caliset(PSET,cmpd,FR)                  %converts times to 0-tf basis, returns median/stdv and cleans up data not suitable for calibration (ie samplers starting at a time different to the base time)
           PSDdata = PSset(PSET,cmpd)
           ts = PSDdata(:,1);                               %sampler times
           ms = PSDdata(:,2);                               %median sampler masses of compound
           
           y0 = 0;
           
           if FR=='R'                                       %reverses vectors for reverse calibration
            Cw = flipud(Cw)   
            tw = flipud(tw)
            ms = flipud(ms)
            ts = flipud(ts)
            Tf=tw(1)
            T0=tw(length(tw))
           end
           if FR=='F'
               T0=tw(1)
               Tf=tw(length(tw))
           end

            area = PSD.area                                %area of disk (cm^2)
            Vs = PSD.Vs;                                    %volume of sorbent (m^3)
            model = PSD.model;
   
            %determine best fit values for k and K for sdb disk. x and x2 are array
            %structurs containing the output paramters. fval2 contains minimization residuals
            [x,fval,exitflag]=fminsearch(@Difference,Paramguess,[],ms,ts,model,Cw,y0,tw)
            
            Ksw = x(1);
            Rs = x(2);
            
            %calculate mass transfer coefficient and half time to equilibrium
            mtc=Rs/area*10/60/60/24
            t50=-1*Vs*10^log10(Ksw)/mtc/(area*(10^-4))*log(0.5)/60/60/24
                        
           outparams = [{cmpd, PSD.model, PSET.file}, log10(Ksw), Rs, mtc, t50, fval, exitflag]
       end
              
        
       function calibrate(PSET,ASET,cmpd,PSD,FR)
           
           Paramguess = [10^5,10^-1];                       %guess paramters to start optimisation
           [grabdata] = ASET.mav(cmpd);              %use cubic spline function of concentration data
           tw = grabdata(:,1) - min(grabdata(:,1))          %convert times to 0 basis (still in days)
           Cw = grabdata(:,2)                                 
           %PSDdata = caliset(PSET,cmpd,FR)                  %converts times to 0-tf basis, returns median/stdv and cleans up data not suitable for calibration (ie samplers starting at a time different to the base time)
           PSDdata = PSset(PSET,cmpd)
           ts = PSDdata(:,1);                               %sampler times
           ms = PSDdata(:,2);                               %median sampler masses of compound
           
           y0 = 0;
           
           if FR=='R'                                       %reverses vectors for reverse calibration
            Cw = flipud(Cw)   
            tw = flipud(tw)
            ms = flipud(ms)
            ts = flipud(ts)
            Tf=tw(1)
            T0=tw(length(tw))
           end
           if FR=='F'
               T0=tw(1)
               Tf=tw(length(tw))
           end
           
            area = PSD.area;                                %area of disk (cm^2)
            Vs = PSD.Vs;                                    %volume of sorbent (m^3)
            model = PSD.model;
   
            %determine best fit values for k and K for sdb disk. x and x2 are array
            %structurs containing the output paramters. fval2 contains minimization residuals
            [x,fval,exitflag]=fminsearch(@Difference,Paramguess,[],ms,ts,model,Cw,y0,tw)
            
            Ks = x(1);
            ks = x(2);
            
            %calculate mass transfer coefficient and half time to equlibrium
            mtc=ks/area*10/60/60/24
            t50=-1*Vs*10^log10(Ks)/mtc/(area*(10^-4))*log(0.5)/60/60/24
            
            %output optimised paramters and residuals to a summary file with name of compound
            outpath = strcat('DATAOUT/',ASET.path,'/',model)
            mkdir (outpath)
            cd (outpath)
            
            fid = fopen(strcat(cmpd,'-params.dat'),'w')
            params = [log10(Ks);ks;mtc;t50;fval;exitflag];
            frmat = strcat(cmpd, '\n log(Ks)\t %3.2f\n Rs[L/d]\t %3.2f\n mtc[m/s] %3.8f\n t50[days] %3.2f\n residuals %3.2f %3.2f %3.2f %3.2f');
            fprintf(fid,frmat,params);
            fclose(fid);
            
            %output full simulation results to file
            cd ../../..
            toler= 0.001;
            opts=odeset('AbsTol',toler,'RelTol',toler);
            [t,y] = ode45(model,[T0 Tf],y0,opts,ks,Ks,Cw,tw);
            
            fid2 = fopen(strcat(cmpd,'-output.dat'),'w');
            fprintf(fid2,'%g\n',[t,y]);
            status = fclose(fid2)

            %plot results
            figure(1);
            maxW = max(Cw);
            maxP= max(y);
            plotresults;

            %save figure as file
            figname = strcat(cmpd,'.jpg');
            print(1, '-djpeg', figname);
            cd ../..
            
            %append results to the output.log file
            params = [log10(Ks);ks;mtc;t50;fval;exitflag];
            fid3 = fopen('run.log','a')
            frmat = strcat('\n',datestr(now,0),'\t', cmpd,'\t ', PSD.model,'\t %3.2f\t %3.2f\t %3.8f\t %3.2f\t %3.2f\t %3.2f');
            fprintf(fid3,frmat,params)
            cd ../    
       
       end
       
   end
end