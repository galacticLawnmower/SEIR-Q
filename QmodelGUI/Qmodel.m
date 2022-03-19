function varargout = Qmodel(varargin)
% QMODEL MATLAB code for Qmodel.fig
%      QMODEL, by itself, creates a new QMODEL or raises the existing
%      singleton*.
%
%      H = QMODEL returns the handle to a new QMODEL or the handle to
%      the existing singleton*.
%
%      QMODEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QMODEL.M with the given input arguments.
%
%      QMODEL('Property','Value',...) creates a new QMODEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Qmodel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Qmodel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Qmodel

% Last Modified by GUIDE v2.5 02-Jan-2022 19:52:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Qmodel_OpeningFcn, ...
                   'gui_OutputFcn',  @Qmodel_OutputFcn, ...
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


% --- Executes just before Qmodel is made visible.
function Qmodel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Qmodel (see VARARGIN)

% Choose default command line output for Qmodel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.k, 'String', .066);
set(handles.p, 'String', .6);
set(handles.i, 'String', .196);
set(handles.X, 'String', .2);
set(handles.Y, 'String', .6);
set(handles.rAQ, 'String', .1);
set(handles.rQ, 'String', .076);
set(handles.rSQ, 'String', .076);
set(handles.rA, 'String', .1);
set(handles.rS, 'String', .076);

set(handles.mask, 'String', .10);
data = get(handles.mask, 'String');
set(handles.m, 'Value', str2double(data));

set(handles.qd, 'String', .85);
data = get(handles.qd, 'String');
set(handles.c, 'Value', str2double(data));

set(handles.rt, 'String', .05);
data = get(handles.rt, 'String');
set(handles.t_s, 'Value', str2double(data));

set(handles.vd, 'String', .5);
data = get(handles.vd, 'String');
set(handles.g, 'Value', str2double(data));
set(handles.saqs, 'String', .3);
data = get(handles.saqs, 'String');
set(handles.wa, 'Value', str2double(data));

set(handles.ssqs, 'String', .8);
data = get(handles.ssqs, 'String');
set(handles.ws, 'Value', str2double(data));

axes(handles.pix)
imshow('flowchart.png');

%axes(handles.formula)
%imshow('equ.png');
set(handles.S, 'value', 1);
set(handles.E, 'value', 1);
set(handles.I, 'value', 1);
set(handles.A, 'value', 1);
set(handles.Q, 'value', 1);
set(handles.IQ, 'value', 1);
set(handles.AQ, 'value', 1);
set(handles.R, 'value', 1);
set(handles.load1, 'visible', 'off');
set(handles.load2, 'visible', 'off');
set(handles.load3, 'visible', 'off');
global fish cake defaultTime defaultPop
defaultTime = zeros(10,1);
defaultPop = zeros(10,1);
fish = [1,1,1,1,1,1,1,1];
cake = ["S","E","I","A","Q","IQ","AQ","R"];
axes(handles.dog)

plot(defaultTime, defaultPop)
title('Dynamics of the Quarantine model')
xlabel('Time')
ylabel('Population')

set(handles.text2, 'String', 'α');
set(handles.text39, 'String', 'γ');
set(handles.text40, 'String', 'χ');
set(handles.text41, 'String', 'η');
set(handles.text42, 'String', 'δ_aq');
set(handles.text43, 'String', 'δ_q');
set(handles.text44, 'String', 'δ_iq');
set(handles.text45, 'String', 'δ_a');
set(handles.text46, 'String', 'δ_i');
set(handles.text48, 'String', 'μ');
set(handles.RN, 'String', 'R_0');






% UIWAIT makes Qmodel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Qmodel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function qd_Callback(hObject, eventdata, handles)
% hObject    handle to qd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.qd, 'String');
temp = str2double(data);
if temp > 1 || temp < 0
    set(handles.qd, 'String', 'not valid' );
else
    set(handles.c, 'Value', temp);
end
% Hints: get(hObject,'String') returns contents of qd as text
%        str2double(get(hObject,'String')) returns contents of qd as a double


% --- Executes during object creation, after setting all properties.
function qd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.m, 'Value');
set(handles.mask, 'String', num2str(data));

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.c, 'Value');
set(handles.qd, 'String', num2str(data));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function rt_Callback(hObject, eventdata, handles)
% hObject    handle to rt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.rt, 'String');
temp = str2double(data);
if temp > 1 || temp < 0
    set(handles.rt, 'String', 'not valid' );
else
    set(handles.t_s, 'Value', temp);
end

% Hints: get(hObject,'String') returns contents of rt as text
%        str2double(get(hObject,'String')) returns contents of rt as a double


% --- Executes during object creation, after setting all properties.
function rt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function t_s_Callback(hObject, eventdata, handles)
% hObject    handle to t_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.t_s, 'Value');
set(handles.rt, 'String', num2str(data));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function t_s_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_s (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function vd_Callback(hObject, eventdata, handles)
% hObject    handle to vd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.vd, 'String');
temp = str2double(data);
if temp > 1 || temp < 0
    set(handles.vd, 'String', 'not valid' );
else
    set(handles.g, 'Value', temp);
end
% Hints: get(hObject,'String') returns contents of vd as text
%        str2double(get(hObject,'String')) returns contents of vd as a double


% --- Executes during object creation, after setting all properties.
function vd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function saqs_Callback(hObject, eventdata, handles)
% hObject    handle to saqs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.saqs, 'String');
temp = str2double(data);
if temp > 1 || temp < 0
    set(handles.saqs, 'String', 'not valid' );
else
    set(handles.wa, 'Value', temp);
end
% Hints: get(hObject,'String') returns contents of saqs as text
%        str2double(get(hObject,'String')) returns contents of saqs as a double


% --- Executes during object creation, after setting all properties.
function saqs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saqs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function g_Callback(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.g, 'Value');
set(handles.vd, 'String', num2str(data));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function wa_Callback(hObject, eventdata, handles)
% hObject    handle to wa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.wa, 'Value');
set(handles.saqs, 'String', num2str(data));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function wa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function mask_Callback(hObject, eventdata, handles)
% hObject    handle to mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.mask, 'String');
temp = str2double(data);
if temp > 1 || temp < 0
    set(handles.mask, 'String', 'not valid' );
else
    set(handles.m, 'Value', temp);
end

%set(handles.mask, 'String', num2str(data));

% Hints: get(hObject,'String') returns contents of mask as text
%        str2double(get(hObject,'String')) returns contents of mask as a double


% --- Executes during object creation, after setting all properties.
function mask_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ssqs_Callback(hObject, eventdata, handles)
% hObject    handle to ssqs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.ssqs, 'String');
temp = str2double(data);
if temp > 1 || temp < 0
    set(handles.ssqs, 'String', 'not valid' );
else
    set(handles.ws, 'Value', temp);
end

% Hints: get(hObject,'String') returns contents of ssqs as text
%        str2double(get(hObject,'String')) returns contents of ssqs as a double


% --- Executes during object creation, after setting all properties.
function ssqs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ssqs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function ws_Callback(hObject, eventdata, handles)
% hObject    handle to ws (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.ws, 'Value');
set(handles.ssqs, 'String', num2str(data));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function ws_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ws (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i_Callback(hObject, eventdata, handles)
% hObject    handle to i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i as text
%        str2double(get(hObject,'String')) returns contents of i as a double


% --- Executes during object creation, after setting all properties.
function i_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rQ_Callback(hObject, eventdata, handles)
% hObject    handle to rQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rQ as text
%        str2double(get(hObject,'String')) returns contents of rQ as a double


% --- Executes during object creation, after setting all properties.
function rQ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rS_Callback(hObject, eventdata, handles)
% hObject    handle to rS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rS as text
%        str2double(get(hObject,'String')) returns contents of rS as a double


% --- Executes during object creation, after setting all properties.
function rS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_Callback(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p as text
%        str2double(get(hObject,'String')) returns contents of p as a double


% --- Executes during object creation, after setting all properties.
function p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rA_Callback(hObject, eventdata, handles)
% hObject    handle to rA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rA as text
%        str2double(get(hObject,'String')) returns contents of rA as a double


% --- Executes during object creation, after setting all properties.
function rA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rAQ_Callback(hObject, eventdata, handles)
% hObject    handle to rAQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rAQ as text
%        str2double(get(hObject,'String')) returns contents of rAQ as a double


% --- Executes during object creation, after setting all properties.
function rAQ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rAQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rSQ_Callback(hObject, eventdata, handles)
% hObject    handle to rSQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rSQ as text
%        str2double(get(hObject,'String')) returns contents of rSQ as a double


% --- Executes during object creation, after setting all properties.
function rSQ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rSQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tempload1 = get(handles.load1, 'visible');
if tempload1 == true
    set(handles.load1, 'value', 0)
end
tempload1 = get(handles.load2, 'visible');
if tempload1 == true
    set(handles.load2, 'value', 0)
end
tempload1 = get(handles.load3, 'visible');
if tempload1 == true
    set(handles.load3, 'value', 0)
end


timeSpan = [0 90];
S0 = str2double(get(handles.S0, 'string'));  
E0 = str2double(get(handles.E0, 'string'));
A0 = str2double(get(handles.A0, 'string'));
I0 = str2double(get(handles.I0, 'string'));
Q0 = str2double(get(handles.Q0, 'string'));
SQ0 = str2double(get(handles.SQ0, 'string'));  
AQ0 = str2double(get(handles.AQ0, 'string'));  
R0 = str2double(get(handles.R0, 'string'));    
k = str2double(get(handles.k, 'string'));
p = str2double(get(handles.p, 'string'));
i = str2double(get(handles.i, 'string'));
X = str2double(get(handles.X, 'string'));
Y = str2double(get(handles.Y, 'string'));
rAQ = str2double(get(handles.rAQ, 'string'));
rQ = str2double(get(handles.rQ, 'string'));
rSQ = str2double(get(handles.rSQ, 'string'));
rA = str2double(get(handles.rA, 'string'));
rS = str2double(get(handles.rS, 'string'));
u = str2double(get(handles.bd, 'string'));
mask = str2double(get(handles.mask, 'string'));
qd = str2double(get(handles.qd, 'string'));
rt = str2double(get(handles.rt, 'string'));
vd = str2double(get(handles.vd, 'string'));
saqs = str2double(get(handles.saqs, 'string'));
ssqs = str2double(get(handles.ssqs, 'string'));
N = str2double(get(handles.S0, 'string')) + str2double(get(handles.E0, 'string')) +str2double(get(handles.I0, 'string')) +str2double(get(handles.A0, 'string')) + str2double(get(handles.Q0, 'string')) + str2double(get(handles.AQ0, 'string')) + str2double(get(handles.SQ0, 'string')) + str2double(get(handles.R0, 'string'));
S0 = str2double(get(handles.S0, 'string'));
birth = str2double(get(handles.edit30, 'string'));
var = [k,rt,i,mask,X,Y,p,vd,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N,S0,birth];

[t,y] = ode45(@(t,y)fsir(t,y,var), timeSpan,[S0,E0,I0,A0,Q0,SQ0,AQ0,R0]); 
axes(handles.dog)

temp1 = get(handles.S, 'value');
temp2 = get(handles.E, 'value');
temp3 = get(handles.I, 'value');
temp4 = get(handles.A, 'value');
temp5 = get(handles.Q, 'value');
temp6 = get(handles.IQ, 'value');
temp7 = get(handles.AQ, 'value');
temp8 = get(handles.R, 'value');
tempp = [temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8];

global fish cake

fish = tempp;
%cat = strings[0;0];

temp = 1;
[rownum,colnum]=size(y);
finalSIR = zeros(rownum, sum(fish(:) == 1));
dog = 1;
for temp = 1:8
    if tempp(1,temp) == 1
        finalSIR(:,dog)  = y(:,temp);
        cat(1,dog) = cake(1,temp);
        dog = dog +1;
        
    end
end
axes(handles.dog)
plot(t,finalSIR)
legend(cat)
xlabel('Time')
ylabel('Population')
tempRN = rsir(var);
set(handles.Rnot, 'string', tempRN);



function RnotD = rsir(param)
alpha = param(1); %d; 4; transfer rate from infected person to suspectible person; k
tau = param(2);    %e;5; percentage of times that random testing finds positive test; rtest
gamma = param(3); %f; 6; 1/(average incubation time); incuR
beta = param(4); %g; 7; percentage of population using mask; mU
chi = param(5);
eta = param(6);
p = param(7); %h; 8; percentage of population that has symptomatic infection; p
lambda = param(8); %i; 9; vigilance in others and individuals in spotting sympotoms; vSymp
delta_a = param(9); %j; 10; removal by recovery; recov
delta_i = param(10);
delta_q = param(11);
delta_aq = param(12);
delta_iq = param(13);
nu_a = param(14); % k; 11; percent going into strict Q; w
nu_i = param(15);
c = param(16);
mu = param(17);
N = param(18);
S = param(19);
birth = param(20);
%param

RnotD = (S*alpha*gamma*(beta - 1)*(p - 1))/(N*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*gamma*p*(beta - 1))/(N*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau)) + (S*alpha*eta*gamma*tau*(beta - 1)*(c - 1)*(nu_a - 1)*(p - 1))/(N*(delta_aq + mu)*(gamma + mu)*(delta_a + mu + tau - c*tau)) - (S*alpha*chi*gamma*p*(lambda + tau)*(beta - 1)*(c - 1)*(nu_i - 1))/(N*(delta_iq + mu)*(gamma + mu)*(delta_i + lambda + mu + tau - c*lambda - c*tau));
 
%RnotD = (in*k*(m - 1)*(p - 1))/((in + u)*(ra + ti + u - c*ti)) - (in*k*p*(m - 1))/((in + u)*(g + rs + ti + u - c*g - c*ti)) - (X*in*k*p*(g + ti)*(c - 1)*(m - 1)*(ws - 1))/((in + u)*(rqs + u)*(g + rs + ti + u - c*g - c*ti)) + (Y*in*k*ti*(c - 1)*(m - 1)*(p - 1)*(wa - 1))/((in + u)*(rqa + u)*(ra + ti + u - c*ti));
    

function resultSIR = fsir(t,y,param)
k = param(1); %d; 4; transfer rate from infected person to suspectible person; k
ti = param(2);    %e;5; percentage of times that random testing finds positive test; rtest
i = param(3); %f; 6; 1/(average incubation time); incuR
m = param(4); %g; 7; percentage of population using mask; mU
X = param(5);
Y = param(6);
p = param(7); %h; 8; percentage of population that has symptomatic infection; p
g = param(8); %i; 9; vigilance in others and individuals in spotting sympotoms; vSymp
ra = param(9); %j; 10; removal by recovery; recov
rs = param(10);
rq = param(11);
rqa = param(12);
rqs = param(13);
wa = param(14); % k; 11; percent going into strict Q; w
ws = param(15);
c = param(16);
u = param(17);
N = param(18);
S0 = param(19);
birth = param(20);
resultSIR =[0;0]; 
% S
resultSIR(1) =  birth - k*(1-m)*y(1)*(S0/N)*(y(3) + y(4) + X*y(6) + Y*y(7)) - u*y(1);
% E = a(1-m)S(I+A+XQ) - BE
resultSIR(2) = k*(1-m)*y(1)*(S0/N)*(y(3) + y(4) + X*y(6) + Y*y(7)) - i*y(2) - u*y(2);
% I = pBE - I(r+g)(1-c) - OI
resultSIR(3) = (p)*i*y(2) - y(3)*(ti + g)*(1-c) - rs * y(3) - u*y(3);
% A = (1-p)BE - A(r)(1-c) - OA
resultSIR(4) = (1-p)*i*y(2) - (ti)*y(4)*(1-c) - ra * y(4) - u*y(4);
% Q = w(1-c)(I(r+g)+Ar)- OQ
resultSIR(5) =  wa*(ti*y(4)*(1-c)) + (ws*y(3)*(ti + g)*(1-c)) - rq*y(5) - u*y(5);
% SQA = (1-wA)(1-c)*A*r - O_A*SQA
resultSIR(6) = (1-wa)*(ti)*y(4)*(1-c) - rqa * y(6) - u*y(6);
% SQI = (1-w)(1-c)(I(g+r))- O_I*SQI
resultSIR(7) = (1-ws)*y(3)*(ti + g)*(1-c) - rqs * y(7) - u*y(7);
% R = O_I*I + O_A*A + (O_A+O_I)*Q + O_A*SQA + O_I*SQI
resultSIR(8) = rs*y(3)+ ra*y(4) + rq*y(5) + rqa*y(6) + rqs*y(7) - u*y(8);




function X_Callback(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X as text
%        str2double(get(hObject,'String')) returns contents of X as a double


% --- Executes during object creation, after setting all properties.
function X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Callback(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y as text
%        str2double(get(hObject,'String')) returns contents of Y as a double


% --- Executes during object creation, after setting all properties.
function Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function S0_Callback(hObject, eventdata, handles)
% hObject    handle to S0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of S0 as text
%        str2double(get(hObject,'String')) returns contents of S0 as a double


% --- Executes during object creation, after setting all properties.
function S0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function E0_Callback(hObject, eventdata, handles)
% hObject    handle to E0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of E0 as text
%        str2double(get(hObject,'String')) returns contents of E0 as a double


% --- Executes during object creation, after setting all properties.
function E0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function I0_Callback(hObject, eventdata, handles)
% hObject    handle to I0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of I0 as text
%        str2double(get(hObject,'String')) returns contents of I0 as a double


% --- Executes during object creation, after setting all properties.
function I0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to I0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function A0_Callback(hObject, eventdata, handles)
% hObject    handle to A0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A0 as text
%        str2double(get(hObject,'String')) returns contents of A0 as a double


% --- Executes during object creation, after setting all properties.
function A0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Q0_Callback(hObject, eventdata, handles)
% hObject    handle to Q0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Q0 as text
%        str2double(get(hObject,'String')) returns contents of Q0 as a double


% --- Executes during object creation, after setting all properties.
function Q0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SQ0_Callback(hObject, eventdata, handles)
% hObject    handle to SQ0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SQ0 as text
%        str2double(get(hObject,'String')) returns contents of SQ0 as a double


% --- Executes during object creation, after setting all properties.
function SQ0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SQ0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AQ0_Callback(hObject, eventdata, handles)
% hObject    handle to AQ0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AQ0 as text
%        str2double(get(hObject,'String')) returns contents of AQ0 as a double


% --- Executes during object creation, after setting all properties.
function AQ0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AQ0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function R0_Callback(hObject, eventdata, handles)
% hObject    handle to R0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R0 as text
%        str2double(get(hObject,'String')) returns contents of R0 as a double


% --- Executes during object creation, after setting all properties.
function R0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in S.
function S_Callback(hObject, eventdata, handles)
% hObject    handle to S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of S


% --- Executes on button press in E.
function E_Callback(hObject, eventdata, handles)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of E


% --- Executes on button press in I.
function I_Callback(hObject, eventdata, handles)
% hObject    handle to I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of I


% --- Executes on button press in A.
function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of A


% --- Executes on button press in Q.
function Q_Callback(hObject, eventdata, handles)
% hObject    handle to Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Q


% --- Executes on button press in IQ.
function IQ_Callback(hObject, eventdata, handles)
% hObject    handle to IQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of IQ


% --- Executes on button press in AQ.
function AQ_Callback(hObject, eventdata, handles)
% hObject    handle to AQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AQ


% --- Executes on button press in R.
function R_Callback(hObject, eventdata, handles)
% hObject    handle to R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of R


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.load1, 'value', 0);
set(handles.load2, 'value', 0);
set(handles.load3, 'value', 0);
set(handles.load1, 'visible', 'off');
set(handles.load2, 'visible', 'off');
set(handles.load3, 'visible', 'off');
set(handles.save1, 'String', 'save 1');
set(handles.save2, 'String', 'save 2');
set(handles.save3, 'String', 'save 3');
global defaultTime defaultPop
axes(handles.dog)
plot(defaultTime,defaultPop)
xlabel('Time')
ylabel('Population')


% --- Executes on button press in save1.
function save1_Callback(hObject, eventdata, handles)
% hObject    handle to save1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S0 = str2double(get(handles.S0, 'string'));  
E0 = str2double(get(handles.E0, 'string'));
A0 = str2double(get(handles.A0, 'string'));
I0 = str2double(get(handles.I0, 'string'));
Q0 = str2double(get(handles.Q0, 'string'));
SQ0 = str2double(get(handles.SQ0, 'string'));  
AQ0 = str2double(get(handles.AQ0, 'string'));  
R0 = str2double(get(handles.R0, 'string'));    
k = str2double(get(handles.k, 'string'));
p = str2double(get(handles.p, 'string'));
i = str2double(get(handles.i, 'string'));
X = str2double(get(handles.X, 'string'));
Y = str2double(get(handles.Y, 'string'));
rAQ = str2double(get(handles.rAQ, 'string'));
rQ = str2double(get(handles.rQ, 'string'));
rSQ = str2double(get(handles.rSQ, 'string'));
rA = str2double(get(handles.rA, 'string'));
rS = str2double(get(handles.rS, 'string'));
u = str2double(get(handles.bd, 'string'));
mask = str2double(get(handles.mask, 'string'));
qd = str2double(get(handles.qd, 'string'));
rt = str2double(get(handles.rt, 'string'));
vd = str2double(get(handles.vd, 'string'));
saqs = str2double(get(handles.saqs, 'string'));
ssqs = str2double(get(handles.ssqs, 'string'));
N = str2double(get(handles.S0, 'string')) + str2double(get(handles.E0, 'string')) +str2double(get(handles.I0, 'string')) +str2double(get(handles.A0, 'string')) + str2double(get(handles.Q0, 'string')) + str2double(get(handles.AQ0, 'string')) + str2double(get(handles.SQ0, 'string')) + str2double(get(handles.R0, 'string'));
S0 = str2double(get(handles.S0, 'string'));
birth = str2double(get(handles.edit30, 'string'));
var = [k,rt,i,mask,X,Y,p,vd,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N,S0,birth];
timeSpan = [0 90];
[t,y] = ode45(@(t,y)fsir(t,y,var), timeSpan,[S0,E0,I0,A0,Q0,SQ0,AQ0,R0]); 
if strcmp(get(handles.save1, 'String'),'save 1')
    
    set(handles.save1, 'String', 'load 1');
    global load1 time leg
    timeSpan = [0 90];
    set(handles.load1, 'visible', 'on');

[t,y] = ode45(@(t,y)fsir(t,y,var), timeSpan,[S0,E0,I0,A0,Q0,SQ0,AQ0,R0]); 


temp1 = get(handles.S, 'value');
temp2 = get(handles.E, 'value');
temp3 = get(handles.I, 'value');
temp4 = get(handles.A, 'value');
temp5 = get(handles.Q, 'value');
temp6 = get(handles.IQ, 'value');
temp7 = get(handles.AQ, 'value');
temp8 = get(handles.R, 'value');
tempp = [temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8];

global fish cake

fish = tempp;
%cat = strings[0;0];

temp = 1;
[rownum,colnum]=size(y);
finalSIR = zeros(rownum, sum(fish(:) == 1));
dog = 1;
for temp = 1:8
    if tempp(1,temp) == 1
        finalSIR(:,dog)  = y(:,temp);
        cat(1,dog) = strcat( cake(1,temp), ' (save 1)');
        dog = dog +1;
        
    end
end
axes(handles.dog)
plot(t,finalSIR)
legend(cat)
xlabel('Time')
ylabel('Population')
load1 = finalSIR;
time = t;
leg = cat;
set(handles.load1, 'value',1);
set(handles.load2, 'value',0);
set(handles.load3, 'value',0);

tempRN = rsir(var);
set(handles.Rnot, 'string', tempRN);
global S01 E01 A01 I01 Q01 SQ01 AQ01 R01 k1 p1 i1 X1 Y1 rAQ1 rQ1 rSQ1 rS1 rA1 mask1 qd1 rt1 vd1 saqs1 ssqs1 u1 N1 S01 b1
S01 = S0;
E01 = E0;
A01 = A0;
I01 = I0;
Q01 = Q0;
SQ01 = SQ0;
AQ01 = AQ0;
R01 = R0;
k1 = k;
p1 =p;
i1 =i;
X1 =X;
Y1 =Y;
rAQ1 = rAQ;
rQ1 = rQ;
rSQ1 = rSQ;
rS1 = rS;
rA1 = rA;
mask1 = mask;
qd1 = qd;
rt1 = rt;
vd1 = vd;
saqs1 = saqs;
ssqs1 = ssqs;
u1 = u;
N1 = N;
S01 = S0;
b1 = birth;
else
    global S01 E01 A01 I01 Q01 SQ01 AQ01 R01 k1 p1 i1 X1 Y1 rAQ1 rQ1 rSQ1 rS1 rA1 mask1 qd1 rt1 vd1 saqs1 ssqs1 u1 N1 S01 b1
    global load1 time leg 
    axes(handles.dog)
    L1 = plot(time,load1)
    leg
    lgd = legend( L1, leg, 'Location', 'northeast');
    lgd.Title.String = 'load 1';
    xlabel('Time')
    ylabel('Population')
    set(handles.load1, 'value',1);
    set(handles.load2, 'value',0);
    set(handles.load3, 'value',0);
    var = [k1,rt1,i1,mask1,X1,Y1,p1,vd1,rA1,rS1,rQ1,rAQ1,rSQ1,saqs1,ssqs1,qd1,u1,N1, S01, b1];
    tempRN = rsir(var);
    set(handles.Rnot, 'string', tempRN);
    set(handles.S0, 'String', S01);
    set(handles.E0, 'String', E01);
    set(handles.A0, 'String', A01);
    set(handles.I0, 'String', I01);
    set(handles.Q0, 'String', Q01);
    set(handles.SQ0, 'String', SQ01);
    set(handles.AQ0, 'String', AQ01);
    set(handles.R0, 'String', R01);
set(handles.k, 'String', k1);
set(handles.p, 'String', p1);
set(handles.i, 'String', i1);
set(handles.X, 'String', X1);
set(handles.Y, 'String', Y1);
set(handles.rAQ, 'String', rAQ1);
set(handles.rQ, 'String', rQ1);
set(handles.rSQ, 'String', rSQ1);
set(handles.rA, 'String', rA1);
set(handles.rS, 'String', rS1);
set(handles.edit30, 'String', b1);
'cat'
set(handles.mask, 'String', mask1);
data = get(handles.mask, 'String');
set(handles.m, 'Value', str2double(data));

set(handles.qd, 'String', qd1);
data = get(handles.qd, 'String');
set(handles.c, 'Value', str2double(data));

set(handles.rt, 'String', rt1);
data = get(handles.rt, 'String');
set(handles.t_s, 'Value', str2double(data));

set(handles.vd, 'String', vd1);
data = get(handles.vd, 'String');
set(handles.g, 'Value', str2double(data));
set(handles.saqs, 'String', saqs1);
data = get(handles.saqs, 'String');
set(handles.wa, 'Value', str2double(data));

set(handles.ssqs, 'String', ssqs1);
data = get(handles.ssqs, 'String');
set(handles.ws, 'Value', str2double(data));

    
end


% --- Executes on button press in save2.
function save2_Callback(hObject, eventdata, handles)
% hObject    handle to save2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
timeSpan = [0 90];
S0 = str2double(get(handles.S0, 'string'));  
E0 = str2double(get(handles.E0, 'string'));
A0 = str2double(get(handles.A0, 'string'));
I0 = str2double(get(handles.I0, 'string'));
Q0 = str2double(get(handles.Q0, 'string'));
SQ0 = str2double(get(handles.SQ0, 'string'));  
AQ0 = str2double(get(handles.AQ0, 'string'));  
R0 = str2double(get(handles.R0, 'string'));    
k = str2double(get(handles.k, 'string'));
p = str2double(get(handles.p, 'string'));
i = str2double(get(handles.i, 'string'));
X = str2double(get(handles.X, 'string'));
Y = str2double(get(handles.Y, 'string'));
rAQ = str2double(get(handles.rAQ, 'string'));
rQ = str2double(get(handles.rQ, 'string'));
rSQ = str2double(get(handles.rSQ, 'string'));
rA = str2double(get(handles.rA, 'string'));
rS = str2double(get(handles.rS, 'string'));
u = str2double(get(handles.bd, 'string'));
mask = str2double(get(handles.mask, 'string'));
qd = str2double(get(handles.qd, 'string'));
rt = str2double(get(handles.rt, 'string'));
vd = str2double(get(handles.vd, 'string'));
saqs = str2double(get(handles.saqs, 'string'));
ssqs = str2double(get(handles.ssqs, 'string'));
N = str2double(get(handles.S0, 'string')) + str2double(get(handles.E0, 'string')) +str2double(get(handles.I0, 'string')) +str2double(get(handles.A0, 'string')) + str2double(get(handles.Q0, 'string')) + str2double(get(handles.AQ0, 'string')) + str2double(get(handles.SQ0, 'string')) + str2double(get(handles.R0, 'string'));
S0 = str2double(get(handles.S0, 'string'));
birth = str2double(get(handles.edit30, 'string'));
var = [k,rt,i,mask,X,Y,p,vd,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N,S0,birth];

[t,y] = ode45(@(t,y)fsir(t,y,var), timeSpan,[S0,E0,I0,A0,Q0,SQ0,AQ0,R0]); 
if strcmp(get(handles.save2, 'String'),'save 2')
    set(handles.save2, 'String', 'load 2');
    global load2 time2 leg2
    timeSpan = [0 90];
    set(handles.load2, 'visible', 'on');

[t,y] = ode45(@(t,y)fsir(t,y,var), timeSpan,[S0,E0,I0,A0,Q0,SQ0,AQ0,R0]); 


temp1 = get(handles.S, 'value');
temp2 = get(handles.E, 'value');
temp3 = get(handles.I, 'value');
temp4 = get(handles.A, 'value');
temp5 = get(handles.Q, 'value');
temp6 = get(handles.IQ, 'value');
temp7 = get(handles.AQ, 'value');
temp8 = get(handles.R, 'value');
tempp = [temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8];

global fish cake

fish = tempp;
%cat = strings[0;0];

temp = 1;
[rownum,colnum]=size(y);
finalSIR = zeros(rownum, sum(fish(:) == 1));
dog = 1;
for temp = 1:8
    if tempp(1,temp) == 1
        finalSIR(:,dog)  = y(:,temp);
        cat(1,dog) = strcat( cake(1,temp), ' (save 2)');
        dog = dog +1;
        
    end
end
axes(handles.dog)
plot(t,finalSIR)
legend(cat)
xlabel('Time')
    ylabel('Population')
    load2 = finalSIR;
    time2 = t;
    leg2 = cat;
    set(handles.load1, 'value',0);
    set(handles.load2, 'value',1);
    set(handles.load3, 'value',0);
    tempRN = rsir(var);
    set(handles.Rnot, 'string', tempRN);
    global S02 E02 A02 I02 Q02 SQ02 AQ02 R02 k2 p2 i2 X2 Y2 rAQ2 rQ2 rSQ2 rS2 rA2 mask2 qd2 rt2 vd2 saqs2 ssqs2 u2 N2 b2
S02 = S0;
E02 = E0;
A02 = A0;
I02 = I0;
Q02 = Q0;
SQ02 = SQ0;
AQ02 = AQ0;
R02 = R0;
k2 = k;
p2 =p;
i2 =i;
X2 =X;
Y2 =Y;
rAQ2 = rAQ;
rQ2 = rQ;
rSQ2 = rSQ;
rS2 = rS;
rA2 = rA;
mask2 = mask;
qd2 = qd;
rt2 = rt;
vd2 = vd;
saqs2 = saqs;
ssqs2 = ssqs;
u2 = u;
N2 = N;
S02 = S0;
b2 = birth;
else
    global S02 E02 A02 I02 Q02 SQ02 AQ02 R02 k2 p2 i2 X2 Y2 rAQ2 rQ2 rSQ2 rS2 rA2 mask2 qd2 rt2 vd2 saqs2 ssqs2 u2 N2 S02 b2
    global load2 time2 leg2 
    axes(handles.dog)
    plot(time2,load2)
    lgd = legend(leg2);
    lgd.Title.String = 'load 2';
    xlabel('Time')
    ylabel('Population')
    set(handles.load1, 'value',0);
    set(handles.load2, 'value',1);
    set(handles.load3, 'value',0);
    var = [k2,rt2,i2,mask2,X2,Y2,p2,vd2,rA2,rS2,rQ2,rAQ2,rSQ2,saqs2,ssqs2,qd2,u2,N2,S02,b2];
    tempRN = rsir(var);
    set(handles.Rnot, 'string', tempRN);
    set(handles.S0, 'String', S02);
    set(handles.E0, 'String', E02);
    set(handles.A0, 'String', A02);
    set(handles.I0, 'String', I02);
    set(handles.Q0, 'String', Q02);
    set(handles.SQ0, 'String', SQ02);
    set(handles.AQ0, 'String', AQ02);
    set(handles.R0, 'String', R02);
    set(handles.k, 'String', k2);
    set(handles.edit30, 'String', b2);
set(handles.p, 'String', p2);
set(handles.i, 'String', i2);
set(handles.X, 'String', X2);
set(handles.Y, 'String', Y2);
set(handles.rAQ, 'String', rAQ2);
set(handles.rQ, 'String', rQ2);
set(handles.rSQ, 'String', rSQ2);
set(handles.rA, 'String', rA2);
set(handles.rS, 'String', rS2);
set(handles.mask, 'String', mask2);
data = get(handles.mask, 'String');
set(handles.m, 'Value', str2double(data));

set(handles.qd, 'String', qd2);
data = get(handles.qd, 'String');
set(handles.c, 'Value', str2double(data));

set(handles.rt, 'String', rt2);
data = get(handles.rt, 'String');
set(handles.t_s, 'Value', str2double(data));

set(handles.vd, 'String', vd2);
data = get(handles.vd, 'String');
set(handles.g, 'Value', str2double(data));
set(handles.saqs, 'String', saqs2);
data = get(handles.saqs, 'String');
set(handles.wa, 'Value', str2double(data));

set(handles.ssqs, 'String', ssqs2);
data = get(handles.ssqs, 'String');
set(handles.ws, 'Value', str2double(data));

    
end


% --- Executes on button press in save3.
function save3_Callback(hObject, eventdata, handles)
% hObject    handle to save3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S0 = str2double(get(handles.S0, 'string'));  
E0 = str2double(get(handles.E0, 'string'));
A0 = str2double(get(handles.A0, 'string'));
I0 = str2double(get(handles.I0, 'string'));
Q0 = str2double(get(handles.Q0, 'string'));
SQ0 = str2double(get(handles.SQ0, 'string'));  
AQ0 = str2double(get(handles.AQ0, 'string'));  
R0 = str2double(get(handles.R0, 'string'));    
k = str2double(get(handles.k, 'string'));
p = str2double(get(handles.p, 'string'));
i = str2double(get(handles.i, 'string'));
X = str2double(get(handles.X, 'string'));
Y = str2double(get(handles.Y, 'string'));
rAQ = str2double(get(handles.rAQ, 'string'));
rQ = str2double(get(handles.rQ, 'string'));
rSQ = str2double(get(handles.rSQ, 'string'));
rA = str2double(get(handles.rA, 'string'));
rS = str2double(get(handles.rS, 'string'));
u = str2double(get(handles.bd, 'string'));
mask = str2double(get(handles.mask, 'string'));
qd = str2double(get(handles.qd, 'string'));
rt = str2double(get(handles.rt, 'string'));
vd = str2double(get(handles.vd, 'string'));
saqs = str2double(get(handles.saqs, 'string'));
ssqs = str2double(get(handles.ssqs, 'string'));
N = str2double(get(handles.S0, 'string')) + str2double(get(handles.E0, 'string')) +str2double(get(handles.I0, 'string')) +str2double(get(handles.A0, 'string')) + str2double(get(handles.Q0, 'string')) + str2double(get(handles.AQ0, 'string')) + str2double(get(handles.SQ0, 'string')) + str2double(get(handles.R0, 'string'));
S0 = str2double(get(handles.S0, 'string'));
birth = str2double(get(handles.edit30, 'string'));
var = [k,rt,i,mask,X,Y,p,vd,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N,S0,birth];
timeSpan = [0 90];
[t,y] = ode45(@(t,y)fsir(t,y,var), timeSpan,[S0,E0,I0,A0,Q0,SQ0,AQ0,R0]); 

var = [k,rt,i,mask,X,Y,p,vd,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N];
if strcmp(get(handles.save3, 'String'),'save 3')
    set(handles.save3, 'String', 'load 3');
    global load3 time3 leg3
    timeSpan = [0 90];
    set(handles.load3, 'visible', 'on');
    var = [k,rt,i,mask,X,Y,p,vd,rA,rS,rQ,rAQ,rSQ,saqs,ssqs,qd,u,N,S0,birth];
   [t,y] = ode45(@(t,y)fsir(t,y,var), timeSpan,[S0,E0,I0,A0,Q0,SQ0,AQ0,R0]); 


temp1 = get(handles.S, 'value');
temp2 = get(handles.E, 'value');
temp3 = get(handles.I, 'value');
temp4 = get(handles.A, 'value');
temp5 = get(handles.Q, 'value');
temp6 = get(handles.IQ, 'value');
temp7 = get(handles.AQ, 'value');
temp8 = get(handles.R, 'value');
tempp = [temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8];

global fish cake

fish = tempp;
%cat = strings[0;0];

temp = 1;
[rownum,colnum]=size(y);
finalSIR = zeros(rownum, sum(fish(:) == 1));
dog = 1;
for temp = 1:8
    if tempp(1,temp) == 1
        finalSIR(:,dog)  = y(:,temp);
        cat(1,dog) = strcat( cake(1,temp), ' (save 3)');
        dog = dog +1;
        
    end
end
axes(handles.dog)
plot(t,finalSIR)
legend(cat)
xlabel('Time')
ylabel('Population')
load3 = finalSIR;
time3 = t;
leg3 = cat;
set(handles.load1, 'value',0);
set(handles.load2, 'value',0);
set(handles.load3, 'value',1);
tempRN = rsir(var);
    set(handles.Rnot, 'string', tempRN);
    global S03 E03 A03 I03 Q03 SQ03 AQ03 R03 k3 p3 i3 X3 Y3 rAQ3 rQ3 rSQ3 rS3 rA3 mask3 qd3 rt3 vd3 saqs3 ssqs3 u3 N3 S03 b3
S03 = S0;
E03 = E0;
A03 = A0;
I03 = I0;
Q03 = Q0;
SQ03 = SQ0;
AQ03 = AQ0;
R03 = R0;
k3 = k;
p3 =p;
i3 =i;
X3 =X;
Y3 =Y;
rAQ3 = rAQ;
rQ3 = rQ;
rSQ3 = rSQ;
rS3 = rS;
rA3 = rA;
mask3 = mask;
qd3 = qd;
rt3 = rt;
vd3 = vd;
saqs3 = saqs;
ssqs3 = ssqs;
u3 = u;
N3 = N;
S03 = S0;
b3 = birth;
else
    global S03 E03 A03 I03 Q03 SQ03 AQ03 R03 k3 p3 i3 X3 Y3 rAQ3 rQ3 rSQ3 rS3 rA3 mask3 qd3 rt3 vd3 saqs3 ssqs3 u3 N3 S03 b3
    global load3 time3 leg3 
    axes(handles.dog)
    plot(time3,load3)
    lgd = legend(leg3);
    lgd.Title.String = 'load 3';
    xlabel('Time')
    ylabel('Population')
    set(handles.load1, 'value',0);
    set(handles.load2, 'value',0);
    set(handles.load3, 'value',1);
    var = [k3,rt3,i3,mask3,X3,Y3,p3,vd3,rA3,rS3,rQ3,rAQ3,rSQ3,saqs3,ssqs3,qd3,u3,N3,S03,b3];
    var
   % var = [k3,rt3,i3,mask3,X3,Y3,p3,vd3,rA3,rS3,rQ3,rAQ3,rSQ3,saqs3,ssqs3,qd3,u3,N3,S03,b3];
    'cat'
    tempRN = rsir(var);
    set(handles.Rnot, 'string', tempRN);
    set(handles.S0, 'String', S03);
    set(handles.E0, 'String', E03);
    set(handles.A0, 'String', A03);
    set(handles.I0, 'String', I03);
    set(handles.Q0, 'String', Q03);
    set(handles.SQ0, 'String', SQ03);
    set(handles.AQ0, 'String', AQ03);
    set(handles.R0, 'String', R03);
    set(handles.k, 'String', k3);
set(handles.p, 'String', p3);
set(handles.edit30, 'String', b3);
set(handles.i, 'String', i3);
set(handles.X, 'String', X3);
set(handles.Y, 'String', Y3);
set(handles.rAQ, 'String', rAQ3);
set(handles.rQ, 'String', rQ3);
set(handles.rSQ, 'String', rSQ3);
set(handles.rA, 'String', rA3);
set(handles.rS, 'String', rS3);
set(handles.mask, 'String', mask3);
data = get(handles.mask, 'String');
set(handles.m, 'Value', str2double(data));

set(handles.qd, 'String', qd3);
data = get(handles.qd, 'String');
set(handles.c, 'Value', str2double(data));

set(handles.rt, 'String', rt3);
data = get(handles.rt, 'String');
set(handles.t_s, 'Value', str2double(data));

set(handles.vd, 'String', vd3);
data = get(handles.vd, 'String');
set(handles.g, 'Value', str2double(data));
set(handles.saqs, 'String', saqs3);
data = get(handles.saqs, 'String');
set(handles.wa, 'Value', str2double(data));

set(handles.ssqs, 'String', ssqs3);
data = get(handles.ssqs, 'String');
set(handles.ws, 'Value', str2double(data));
    
    
end


% --- Executes on button press in load1.
function load1_Callback(hObject, eventdata, handles)
% hObject    handle to load1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global load1 load2 load3 time time2 time3 leg leg2 leg3 defaultTime defaultPop 
set(handles.load1, 'visible', 'on');
if get(handles.load1, 'value') == 1
    axes(handles.dog)
    l1 = plot(time,load1)
    %lgd = legend(l1, leg, 'Location', 'northeast');
    %lgd.Title.String = 'load 1';
    xlabel('Time')
    ylabel('Population')
    hold on
    horline = '____load 1_____';
    templgd = leg;
    
    if get(handles.load2, 'value') == 1
        global load2 time2 leg2 
        axes(handles.dog)
        l2 = plot(time2,load2)
        %lgd2 = legend(l2, leg2, 'Location', 'southeast');
        %lgd2.Title.String = 'load 2';
        
        
        xlabel('Time')
        ylabel('Population')
        hold on
        
        horline = '____load 2_____';
        templgd = horzcat(templgd, leg2);
        
    end
    if get(handles.load3, 'value') == 1
        global load3 time3 leg3 
        axes(handles.dog)
        l3 = plot(time3,load3)
        %lgd = legend(l3, leg3, 'Location', 'northwest');
        %lgd.Title.String = 'load 3';
        
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 3_____';
        templgd = horzcat(templgd, leg3);
    end
    hold off
    lgd = legend(templgd);
elseif get(handles.load2, 'value') == 1
    
    axes(handles.dog)
    plot(time2,load2)
    horline = '____load 2_____';
    templgd = leg2;
    xlabel('Time')
    ylabel('Population')
    hold on
    if get(handles.load1, 'value') == 1
        global load1 time leg 
        axes(handles.dog)
        plot(time,load1)
      
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 1_____';
        templgd = horzcat(templgd, leg);
    end
    if get(handles.load3, 'value') == 1
        global load3 time3 leg3 
        axes(handles.dog)
        plot(time3,load3)
        
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 3_____';
        templgd = horzcat(templgd, leg3)
    end
    lgd = legend(templgd);
    hold off
elseif get(handles.load3, 'value') == 1
    horline = '____load 3_____';
    templgd = leg3;
    axes(handles.dog)
    plot(time3,load3)
    
    xlabel('Time')
    ylabel('Population')
    hold on
    if get(handles.load1, 'value') == 1
        global load1 time leg 
        axes(handles.dog)
        plot(time,load1)
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 1_____';
        templgd = horzcat(templgd, leg);
    end
    if get(handles.load2, 'value') == 1
        global load2 time2 leg2 
        axes(handles.dog)
        plot(time2,load2)
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 2_____';
    templgd = horzcat(templgd, leg2);
    end
    hold off
    lgd = legend(templgd);
else
    axes(handles.dog)
    plot(defaultTime,defaultPop)
end

% Hint: get(hObject,'Value') returns toggle state of load1


% --- Executes on button press in load2.
function load2_Callback(hObject, eventdata, handles)
% hObject    handle to load2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global load1 load2 load3 time time2 time3 leg leg2 leg3 defaultTime defaultPop
set(handles.load2, 'visible', 'on');
if get(handles.load1, 'value') == 1
    axes(handles.dog)
    l1 = plot(time,load1)
    %lgd = legend(l1, leg, 'Location', 'northeast');
    %lgd.Title.String = 'load 1';
    xlabel('Time')
    ylabel('Population')
    hold on
    horline = '____load 1_____';
    templgd = leg;
    
    if get(handles.load2, 'value') == 1
        global load2 time2 leg2 
        axes(handles.dog)
        l2 = plot(time2,load2)
        %lgd2 = legend(l2, leg2, 'Location', 'southeast');
        %lgd2.Title.String = 'load 2';
        
        
        xlabel('Time')
        ylabel('Population')
        hold on
        
        horline = '____load 2_____';
        templgd = horzcat(templgd, leg2);
        
    end
    if get(handles.load3, 'value') == 1
        global load3 time3 leg3 
        axes(handles.dog)
        l3 = plot(time3,load3)
        %lgd = legend(l3, leg3, 'Location', 'northwest');
        %lgd.Title.String = 'load 3';
        
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 3_____';
        templgd = horzcat(templgd, leg3);
    end
    hold off
    lgd = legend(templgd);
elseif get(handles.load2, 'value') == 1
    
    axes(handles.dog)
    plot(time2,load2)
    horline = '____load 2_____';
    templgd = leg2;
    xlabel('Time')
    ylabel('Population')
    hold on
    if get(handles.load1, 'value') == 1
        global load1 time leg 
        axes(handles.dog)
        plot(time,load1)
      
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 1_____';
        templgd = horzcat(templgd, leg);
    end
    if get(handles.load3, 'value') == 1
        global load3 time3 leg3 
        axes(handles.dog)
        plot(time3,load3)
        
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 3_____';
        templgd = horzcat(templgd, leg3)
    end
    lgd = legend(templgd);
    hold off
elseif get(handles.load3, 'value') == 1
    horline = '____load 3_____';
    templgd = leg3;
    axes(handles.dog)
    plot(time3,load3)
    
    xlabel('Time')
    ylabel('Population')
    hold on
    if get(handles.load1, 'value') == 1
        global load1 time leg 
        axes(handles.dog)
        plot(time,load1)
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 1_____';
        templgd = horzcat(templgd, leg);
    end
    if get(handles.load2, 'value') == 1
        global load2 time2 leg2 
        axes(handles.dog)
        plot(time2,load2)
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 2_____';
    templgd = horzcat(templgd, leg2);
    end
    hold off
    lgd = legend(templgd);
else
    axes(handles.dog)
    plot(defaultTime,defaultPop)
end

% Hint: get(hObject,'Value') returns toggle state of load2


% --- Executes on button press in load3.
function load3_Callback(hObject, eventdata, handles)
% hObject    handle to load3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global load1 load2 load3 time time2 time3 leg leg2 leg3 defaultTime defaultPop
set(handles.load3, 'visible', 'on');
if get(handles.load1, 'value') == 1
    axes(handles.dog)
    l1 = plot(time,load1)
    %lgd = legend(l1, leg, 'Location', 'northeast');
    %lgd.Title.String = 'load 1';
    xlabel('Time')
    ylabel('Population')
    hold on
    horline = '____load 1_____';
    templgd = leg;
    
    if get(handles.load2, 'value') == 1
        global load2 time2 leg2 
        axes(handles.dog)
        l2 = plot(time2,load2)
        %lgd2 = legend(l2, leg2, 'Location', 'southeast');
        %lgd2.Title.String = 'load 2';
        
        
        xlabel('Time')
        ylabel('Population')
        hold on
        
        horline = '____load 2_____';
        templgd = horzcat(templgd, leg2);
        
    end
    if get(handles.load3, 'value') == 1
        global load3 time3 leg3 
        axes(handles.dog)
        l3 = plot(time3,load3)
        %lgd = legend(l3, leg3, 'Location', 'northwest');
        %lgd.Title.String = 'load 3';
        
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 3_____';
        templgd = horzcat(templgd, leg3);
    end
    hold off
    lgd = legend(templgd);
elseif get(handles.load2, 'value') == 1
    
    axes(handles.dog)
    plot(time2,load2)
    horline = '____load 2_____';
    templgd = leg2;
    xlabel('Time')
    ylabel('Population')
    hold on
    if get(handles.load1, 'value') == 1
        global load1 time leg 
        axes(handles.dog)
        plot(time,load1)
      
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 1_____';
        templgd = horzcat(templgd, leg);
    end
    if get(handles.load3, 'value') == 1
        global load3 time3 leg3 
        axes(handles.dog)
        plot(time3,load3)
        
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 3_____';
        templgd = horzcat(templgd, leg3)
    end
    lgd = legend(templgd);
    hold off
elseif get(handles.load3, 'value') == 1
    horline = '____load 3_____';
    templgd = leg3;
    axes(handles.dog)
    plot(time3,load3)
    
    xlabel('Time')
    ylabel('Population')
    hold on
    if get(handles.load1, 'value') == 1
        global load1 time leg 
        axes(handles.dog)
        plot(time,load1)
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 1_____';
        templgd = horzcat(templgd, leg);
    end
    if get(handles.load2, 'value') == 1
        global load2 time2 leg2 
        axes(handles.dog)
        plot(time2,load2)
        xlabel('Time')
        ylabel('Population')
        hold on
        horline = '____load 2_____';
    templgd = horzcat(templgd, leg2);
    end
    hold off
    lgd = legend(templgd);
else
    axes(handles.dog)
    plot(defaultTime,defaultPop)
end

% Hint: get(hObject,'Value') returns toggle state of load3



function bd_Callback(hObject, eventdata, handles)
% hObject    handle to bd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd as text
%        str2double(get(hObject,'String')) returns contents of bd as a double


% --- Executes during object creation, after setting all properties.
function bd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
