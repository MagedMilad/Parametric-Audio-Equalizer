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

function otherValue_Callback(hObject, eventdata, handles)


function otherValue_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



%our code starts here <===============================
function open_Callback(hObject, ~, handles)
[FileName,PathName,~] = uigetfile();
%handles.path = strcat(PathName,FileName);
%guidata(hObject, handles);
global global_struct;
global_struct.path= strcat(PathName,FileName);

function save_Callback(~, ~, handles)

% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%   EventName: string 'SelectionChanged' (read only)
%   OldValue: handle of the previously selected object or empty if none was selected
%   NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global global_struct;
if handles.FIR == eventdata.NewValue
    set(handles.type,'Visible','on');
    %handles.fir=1;
    %guidata(hObject, handles);
    global_struct.fir= 1;
else
    set(handles.type,'Visible','off');
    %handles.fir=0;
    %guidata(hObject, handles);
    global_struct.fir= 0;
    
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(~, ~, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
[x,fs] = wavread(global_struct.path);
outputSampleRate=0;
if get(handles.same, 'Value') == 1
    outputSampleRate=fs;
elseif get(handles.half, 'Value') == 1
    outputSampleRate=fs/2;
elseif get(handles.double, 'Value') == 1
    outputSampleRate=fs*2;
else
    outputSampleRate=get(handles.otherValue, 'Value');
end
global_struct.fs = outputSampleRate;
global_struct.x = x;
global_struct.firType = get(handles.type, 'Value');



% --- Executes on button press in plotter.
function plotter_Callback(hObject, eventdata, handles)
plots
    
