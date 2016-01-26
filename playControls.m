function varargout = playControls(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @playControls_OpeningFcn, ...
                   'gui_OutputFcn',  @playControls_OutputFcn, ...
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
function playControls_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = playControls_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;

function play_Callback(hObject, eventdata, handles)
global global_struct;
wavplay(global_struct.output,global_struct.outputSampleRate,'async');
function stop_Callback(hObject, eventdata, handles)
clear playsnd;
function save_Callback(hObject, eventdata, handles)
global global_struct;
[FileName,PathName] = uiputfile('output.wav');
wavwrite(global_struct.output,global_struct.outputSampleRate,strcat(PathName,FileName));
