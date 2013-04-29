classdef THREECOMPMODEL
%   Class definition for three compartment first order passive sampler
%   contains properties volume, area and model data for 
%   all first order PSDs


   properties
    area                            %area of sampler interface with water (cm^2)
    Vs                              %volume of sequestering phase (m^3)
    Vm                              %volume of membrane
    model
   end

   methods
       function S = THREECOMPMODEL(samplerID)
           S.model = samplerID;
           switch lower(S.model)
                case {'empore2com1side'}
                    S.area = 15.9e-4;                                      
                    S.Vs = 344e-6;
                    S.Vm = 80e-6;
                case {'empore2com2side'}
                    S.area = 15.9*2;                                      
                    S.Vs = 344e-3;                                
                    S.Vm = 144e-3;
                case {'spmdmodel'}
                    S.area = 200;                                      
                    S.Vs = .5;
                    S.Vm = 2;
           end   
       end
     
   end 
end

