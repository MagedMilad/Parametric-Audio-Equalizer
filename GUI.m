function varargout = GUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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
global qq;
qq=7;

function GUI_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
handles.fir=0;
handles.path='';
guidata(hObject, handles);

function varargout = GUI_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;

function type_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function slider55_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider66_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider77_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider88_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider11_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider22_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider33_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider44_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider99_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function otherValue_Callback(~, ~, ~)


function otherValue_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function open_Callback(hObject, ~, handles)
[FileName,PathName,~] = uigetfile('input.wav');
%handles.path = strcat(PathName,FileName);
%guidata(hObject, handles);
global global_struct;
global_struct.path= strcat(PathName,FileName);

function uipanel2_SelectionChangeFcn(~, eventdata, handles)
global global_struct;
if handles.FIR == eventdata.NewValue
    set(handles.type,'Visible','on');
    global_struct.fir= 1;
else
    set(handles.type,'Visible','off');
    global_struct.fir= 0;
end


function pushbutton3_Callback(~, ~, handles)
global global_struct;

global_struct.fir = get(handles.FIR,'Value');

global_struct.slid1 = get(handles.slider11, 'Value');
global_struct.slid2 = get(handles.slider22, 'Value');
global_struct.slid3 = get(handles.slider33, 'Value');
global_struct.slid4 = get(handles.slider44, 'Value');
global_struct.slid5 = get(handles.slider55, 'Value');
global_struct.slid6 = get(handles.slider66, 'Value');
global_struct.slid7 = get(handles.slider77, 'Value');
global_struct.slid8 = get(handles.slider88, 'Value');
global_struct.slid9 = get(handles.slider99, 'Value');


%filePath = handles.path;
global_struct.path
[x,fs] = audioread(global_struct.path);
outputSampleRate=0;
if get(handles.same, 'Value') == 1
    outputSampleRate=fs;
elseif get(handles.half, 'Value') == 1
    outputSampleRate=fs/2;
elseif get(handles.double, 'Value') == 1
    outputSampleRate=fs*2;
else
    outputSampleRate=str2num(get(handles.otherValue, 'String'));
end

if fs <= 32000
    errordlg('error in sample rate','Error');
else
global_struct.outputSampleRate = outputSampleRate;
global_struct.fs = fs;
global_struct.x = x;
global_struct.firType = get(handles.type, 'Value');
plots
end


% --- Executes on button press in allMax.
function allMax_Callback(~, ~, handles)
set(handles.slider11, 'Value', 30);
set(handles.slider22, 'Value', 30);
set(handles.slider33, 'Value', 30);
set(handles.slider44, 'Value', 30);
set(handles.slider55, 'Value', 30);
set(handles.slider66, 'Value', 30);
set(handles.slider77, 'Value', 30);
set(handles.slider88, 'Value', 30);
set(handles.slider99, 'Value', 30);


function allMin_Callback(~, ~, handles)
set(handles.slider11, 'Value', -30);
set(handles.slider22, 'Value', -30);
set(handles.slider33, 'Value', -30);
set(handles.slider44, 'Value', -30);
set(handles.slider55, 'Value', -30);
set(handles.slider66, 'Value', -30);
set(handles.slider77, 'Value', -30);
set(handles.slider88, 'Value', -30);
set(handles.slider99, 'Value', -30);

function allZeros_Callback(~, ~, handles)
set(handles.slider11, 'Value', 0);
set(handles.slider22, 'Value', 0);
set(handles.slider33, 'Value', 0);
set(handles.slider44, 'Value', 0);
set(handles.slider55, 'Value', 0);
set(handles.slider66, 'Value', 0);
set(handles.slider77, 'Value', 0);
set(handles.slider88, 'Value', 0);
set(handles.slider99, 'Value', 0);


function bassBoost_Callback(~, ~, handles)
set(handles.slider11, 'Value', 30);
set(handles.slider22, 'Value', 25);
set(handles.slider33, 'Value', 20);
set(handles.slider44, 'Value', 15);
set(handles.slider55, 'Value', 10);
set(handles.slider66, 'Value', 5);
set(handles.slider77, 'Value', 0);
set(handles.slider88, 'Value', 0);
set(handles.slider99, 'Value', 0);


function bassReduce_Callback(~, ~, handles)
set(handles.slider11, 'Value', -30);
set(handles.slider22, 'Value', -25);
set(handles.slider33, 'Value', -20);
set(handles.slider44, 'Value', -15);
set(handles.slider55, 'Value', -10);
set(handles.slider66, 'Value', -5);
set(handles.slider77, 'Value', 0);
set(handles.slider88, 'Value', 0);
set(handles.slider99, 'Value', 0);



function pop_Callback(~, ~, handles)
set(handles.slider11, 'Value', 0);
set(handles.slider22, 'Value', 0);
set(handles.slider33, 'Value', 3);
set(handles.slider44, 'Value', 5);
set(handles.slider55, 'Value', 10);
set(handles.slider66, 'Value', 5);
set(handles.slider77, 'Value', 3);
set(handles.slider88, 'Value', 0);
set(handles.slider99, 'Value', 0);


function rock_Callback(~, ~, handles)
set(handles.slider11, 'Value', 10);
set(handles.slider22, 'Value', 7);
set(handles.slider33, 'Value', 5);
set(handles.slider44, 'Value', 3);
set(handles.slider55, 'Value', 0);
set(handles.slider66, 'Value', 3);
set(handles.slider77, 'Value', 5);
set(handles.slider88, 'Value', 7);
set(handles.slider99, 'Value', 10);


function metal_Callback(~, ~, handles)
set(handles.slider11, 'Value', 20);
set(handles.slider22, 'Value', 15);
set(handles.slider33, 'Value', 0);
set(handles.slider44, 'Value', 10);
set(handles.slider55, 'Value', 0);
set(handles.slider66, 'Value', 10);
set(handles.slider77, 'Value', 0);
set(handles.slider88, 'Value', 15);
set(handles.slider99, 'Value', 20);
