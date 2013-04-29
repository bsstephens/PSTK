classdef FOPSD
%   Class definition for first order passive sampler
%   contains properties volume, area and model data for 
%   all first order PSDs


   properties
    area                            %area of sampler interface with water (cm^2)
    Vs                              %volume of sequestering phase (m^3)
    model
   end

   methods
       function S = FOPSD(samplerID)
           S.model = samplerID;
           switch lower(samplerID)
                case {'m_nak1'}
                    S.area = 15.9;                                      
                    S.Vs = 3.44e-7;                                
                case {'m_mem1'}
                    S.area = 15.9;                                      
                    S.Vs = 3.44e-7;                                
                case {'m_nak2'}
                    S.area = 15.9*2;                                      
                    S.Vs = 3.44e-7;                                
                case {'m_mem2'}
                    S.area = 15.9*2;                                      
                    S.Vs = 3.44e-7;                                
                case {'m_pocis'}
                    S.area = 17.1;
                    S.Vs = 3.44e-7;
                case {'m_spatts'}
                    S.area = 72;
                    S.Vs = 1.8e-5;
                case {'m_pdms330'}
                    S.area = 1;
                    S.Vs = 1;
                case {'m_pdms550'}
                    S.area = 1;
                    S.Vs = 1;
                end   
       end
     
   end 
end

