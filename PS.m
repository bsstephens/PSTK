function varargout = PS(varargin)
% PS M-file for PS.fig
%      PS, by itself, creates a new PS or raises the existing
%      singleton*.
%
%      H = PS returns the handle to a new PS or the handle to
%      the existing singleton*.
%
%      PS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PS.M with the given input arguments.
%
%      PS('Property','Value',...) creates a new PS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PS

% Last Modified by GUIDE v2.5 06-Jun-2011 13:19:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PS_OpeningFcn, ...
                   'gui_OutputFcn',  @PS_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before PS is made visible.
function PS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PS (see VARARGIN)

% Choose default command line output for PS
handles.output = hObject;

% Update handles structure
set(hObject,'toolbar','figure');
guidata(hObject, handles);

% UIWAIT makes PS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function kwm_Callback(hObject, eventdata, handles)
% hObject    handle to kwm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kwm as text
%        str2double(get(hObject,'String')) returns contents of kwm as a double


% --- Executes during object creation, after setting all properties.
function kwm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kwm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kms_Callback(hObject, eventdata, handles)
% hObject    handle to kms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kms as text
%        str2double(get(hObject,'String')) returns contents of kms as a double


% --- Executes during object creation, after setting all properties.
function kms_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function K_wm_Callback(hObject, eventdata, handles)
% hObject    handle to K_wm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K_wm as text
%        str2double(get(hObject,'String')) returns contents of K_wm as a double


% --- Executes during object creation, after setting all properties.
function K_wm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K_wm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function K_ms_Callback(hObject, eventdata, handles)
% hObject    handle to K_ms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K_ms as text
%        str2double(get(hObject,'String')) returns contents of K_ms as a double


% --- Executes during object creation, after setting all properties.
function K_ms_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K_ms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FolderName_Callback(hObject, eventdata, handles)
% hObject    handle to FolderName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FolderName as text
%        str2double(get(hObject,'String')) returns contents of FolderName as a double


% --- Executes during object creation, after setting all properties.
function FolderName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FolderName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CwDataName_Callback(hObject, eventdata, handles)
% hObject    handle to CwDataName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CwDataName as text
%        str2double(get(hObject,'String')) returns contents of CwDataName as a double


% --- Executes during object creation, after setting all properties.
function CwDataName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CwDataName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SorbentData_Callback(hObject, eventdata, handles)
% hObject    handle to SorbentData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SorbentData as text
%        str2double(get(hObject,'String')) returns contents of SorbentData as a double


% --- Executes during object creation, after setting all properties.
function SorbentData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SorbentData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MembraneData_Callback(hObject, eventdata, handles)
% hObject    handle to MembraneData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MembraneData as text
%        str2double(get(hObject,'String')) returns contents of MembraneData as a double


% --- Executes during object creation, after setting all properties.
function MembraneData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MembraneData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FindParButton.
function FindParButton_Callback(hObject, ~, handles)
% hObject    handle to FindParButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

folder = get(handles.FolderName,'String');
compound = get(handles.CompoundName,'String');
memdata =  get(handles.MembraneData,'String');
sorbdata = get(handles.SorbentData,'String');
Cwdata = get(handles.CwDataName,'String');

ps = Passive2_set(folder,memdata,sorbdata);
as = Grab_set(folder,Cwdata,compound);

curvalue = get(handles.PSDName,'value')
stringarr = get(handles.PSDName,'String')
model = char(lower(deblank(stringarr(curvalue))))

psd =  THREECOMPMODEL(model)

params = ps.calibrate(as,compound,psd,'F')

set(handles.kwm,'String',params(1));
set(handles.kms,'String',params(2));
set(handles.K_wm,'String',params(3));
set(handles.K_ms,'String',params(4));
guidata(hObject, handles);

tw = as.t-693960
Cw = as.concs
t0 = min(tw)
tf = max(tw)
MMi = 0;
MSi = 0;

function PSDName_Callback(hObject, eventdata, handles)
% hObject    handle to PSDName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PSDName as text
%        str2double(get(hObject,'String')) returns contents of PSDName as a double


switch get(hObject,'Value')   
    case 1
        model = 'SPMDModel'
    case 2
        model = 'empore2com1side'
    otherwise
end
psd = THREECOMPMODEL(model)
set(handles.PSDArea,'String',psd.area);
set(handles.PSDSorVol,'String',psd.Vs);
set(handles.PSDMemVol,'String',psd.Vm);

% --- Executes during object creation, after setting all properties.
function PSDName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PSDName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CompoundName_Callback(hObject, eventdata, handles)
% hObject    handle to CompoundName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CompoundName as text
%        str2double(get(hObject,'String')) returns contents of CompoundName as a double


% --- Executes during object creation, after setting all properties.
function CompoundName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CompoundName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PlotparButton.
function PlotparButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlotparButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

folder = get(handles.FolderName,'String')
compound = get(handles.CompoundName,'String')
watdata = get(handles.CwDataName,'String')
sorbdata = get(handles.SorbentData,'String')
memdata =  get(handles.MembraneData,'String')

curvalue = get(handles.PSDName,'value')
stringarr = get(handles.PSDName,'String')
model = char(lower(deblank(stringarr(curvalue))))
 

ps = Passive2_set(folder,memdata,sorbdata);
as = Grab_set(folder,watdata,compound);

tw = as.t-693960
Cw = as.concs
t0 = min(tw)
tf = max(tw)
MMi = 0;
MSi = 0;
bcs = [t0, tf, MMi, MSi];
exposure = [tw, Cw];

get(handles.kwm,'String')
params(1) = str2double(get(handles.kwm,'String'))
params(2) = str2double(get(handles.kms,'String'))
params(3) = str2double(get(handles.K_wm,'String'))
params(4) = str2double(get(handles.K_ms,'String'))

[t,y] = ps.runmodel(model, params, bcs, exposure);

axes(handles.axes3);
hold on
plot(t,y(:,2),'k-');

axes(handles.axes4);
hold on
plot(t,y(:,1),'k-')

% --- Executes on button press in PlotCwButton.
function PlotCwButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlotCwButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset')
axes(handles.axes1)
hold on
folder = get(handles.FolderName,'String');
compound = get(handles.CompoundName,'String');
Cwdata = get(handles.CwDataName,'String');
as = Grab_set(folder,Cwdata,compound);
plot(as.t-693960,as.concs','bo');
ylabel('Cw');


% --- Executes on button press in PlotSorButton.
function PlotSorButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlotSorButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes3,'reset')
axes(handles.axes3)
folder = get(handles.FolderName,'String');
compound = get(handles.CompoundName,'String');
sorbdata = get(handles.SorbentData,'String');
memdata =  get(handles.MembraneData,'String');
ps = Passive2_set(folder,memdata,sorbdata);
sorbset = ps.SORBset(compound);
t= sorbset(:,1); ms=sorbset(:,2);
plot(t,ms,'rp')
ylabel('Msorb')

% --- Executes on button press in PlotMemButton.
function PlotMemButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlotMemButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes4,'reset');
axes(handles.axes4);
folder = get(handles.FolderName,'String');
compound = get(handles.CompoundName,'String');
sorbdata = get(handles.SorbentData,'String');
memdata =  get(handles.MembraneData,'String');
ps = Passive2_set(folder,memdata,sorbdata);
memset = ps.MEMset(compound);
t= memset(:,1); mm=memset(:,2);
plot(t,mm,'bh');
ylabel('Mmem');



% --- Executes on selection change in DirSelector.
function DirSelector_Callback(hObject, eventdata, handles)
% hObject    handle to DirSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DirSelector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DirSelector

switch get(hObject,'Value')   
    case 1
        set(handles.FolderName,'String','Gale');
        set(handles.CwDataName,'String','Galewater');
        set(handles.SorbentData,'String','Gale-sor');
        set(handles.MembraneData,'String','Gale-mem');
        set(handles.CompoundName,'String','phenanth');
        set(handles.PSDName,'Value',1);
    case 2
        set(handles.FolderName,'String','ETIENNE');
        set(handles.CwDataName,'String','Etiennewater');
        set(handles.SorbentData,'String','Etienne-sor');
        set(handles.MembraneData,'String','Etienne-mem');
        set(handles.CompoundName,'String','Atr-des');
        set(handles.PSDName,'Value',2);
    otherwise

end
 
% --- Executes during object creation, after setting all properties.
function DirSelector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DirSelector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loadButton.
function loadButton_Callback(hObject, eventdata, handles)
% loads model parameters from csv file

filename = uigetfile({'*.csv'});
params = importdata(filename);

set(handles.kwm,'String',params(1));
set(handles.kms,'String',params(2));
set(handles.K_wm,'String',params(3));
set(handles.K_ms,'String',params(4));


% --- Executes on button press in saveButton.
function saveButton_Callback(hObject, eventdata, handles)
%Saves model parameters in a csv file
filename = uiputfile({'*.csv'});
params(1,1) = str2double(get(handles.kwm,'String'));
params(1,2) = str2double(get(handles.kms,'String'));
params(1,3) = str2double(get(handles.K_wm,'String'));
params(1,4) = str2double(get(handles.K_ms,'String'));
csvwrite(filename, params)

function PSDArea_Callback(hObject, eventdata, handles)
% hObject    handle to PSDArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PSDArea as text
%        str2double(get(hObject,'String')) returns contents of PSDArea as a double


% --- Executes during object creation, after setting all properties.
function PSDArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PSDArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PSDSorVol_Callback(hObject, eventdata, handles)
% hObject    handle to PSDSorVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PSDSorVol as text
%        str2double(get(hObject,'String')) returns contents of PSDSorVol as a double


% --- Executes during object creation, after setting all properties.
function PSDSorVol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PSDSorVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PSDMemVol_Callback(hObject, eventdata, handles)
% hObject    handle to PSDMemVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PSDMemVol as text
%        str2double(get(hObject,'String')) returns contents of PSDMemVol as a double


% --- Executes during object creation, after setting all properties.
function PSDMemVol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PSDMemVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PlotAllButt.
function PlotAllButt_Callback(hObject, eventdata, handles)
% hObject    handle to PlotAllButt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PlotCwButton_Callback(hObject, eventdata, handles)
PlotSorButton_Callback(hObject, eventdata, handles)
PlotMemButton_Callback(hObject, eventdata, handles)
