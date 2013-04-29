classdef Grab_set
%GRAB_SET
%   This class defines a time series of samples. Samples are instantiated from an
%   Excel file with times in the first column and concentration data for compounds
%   in all other columns. The first row of the spreadsheet must contain the
%   unique identifiers of the compounds.

   properties
       id
       concs
       compounds
       t
       path
       file
       %includes times and concentrations   
   end
   methods
     
       function GSET = Grab_set(pathname,filename,cmpd)
           %constructor class
           readpath = strcat('DATAIN/',pathname,'/',filename)
           [numeric, txt, raw] = xlsread(readpath);                              %read excel file
           GSET.t = datenum(datestr(numeric(:,1) + datenum('30-Dec-1899') ,0));  %convert Excel dates into Matlab format
           [m,n]=size(numeric);
           GSET.concs = numeric(1:m,2:n);                                        %remove first two (time) fields for conc matrix
           GSET.compounds = txt(1, 2:length(txt));
           GSET.path = pathname;
           GSET.file = filename;
        end
              
       function compound = data(GSET, cmpd)  
           %returns specified conc vector for a chosen compound from the dataset
            for i = 1:length(GSET.compounds)                                                                  
                if strcmpi(GSET.compounds{i}, cmpd)
                    cmpindex = i;
                end
            end
            Cw=GSET.concs(:,cmpindex);
            compound = [GSET.t Cw];
       end
         
       function medians = medians(GSET, cmpd)
            %returns median conc vector for chosen compound
           data = GSET.data(cmpd);
           conc = data(:,2);
           group = [(GSET.t)];
           [replicates,number,av,stdv,ci,group_median,group_iqr] = grpstats(conc,group,{'gname','numel','mean','std','meanci',@median,@iqr});
             for i = 1:size(replicates)
               reptimes(i) = [str2num(replicates{i,1})];
             end
           medians = [reptimes' group_median]
       end
       
       function dataspline = dataspline(GSET,cmpd)
           %this function plots a cubic spline fit of the grab data
           data = GSET.data(cmpd);
           conc = data(:,2);
           group = [(GSET.t)];
           [replicates,number,av,stdv,ci,group_median,group_iqr] = grpstats(conc,group,{'gname','numel','mean','std','meanci',@median,@iqr});
             for i = 1:size(replicates)
               reptimes(i) = [str2num(replicates{i,1})];
             end
             tT=[min(reptimes):0.25:max(reptimes)]';
             Cw = spline(reptimes,group_median,tT);
             dataspline=[tT Cw];
        end
       
       function mav = mav(GSET,cmpd)
           %this function plots a moving average fit of the grab data
           data = GSET.data(cmpd);
           conc = data(:,2);
           a=1;
           b=[1/2 1/2];
           y = filter(b,a,conc);
           mav = [data(:,1),y];
       end



   end
end 


