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


%our code starts here <===============================
function open_Callback(hObject, ~, handles)
[FileName,PathName,~] = uigetfile();
handles.path = strcat(PathName,FileName); 
guidata(hObject, handles);
function save_Callback(~, ~, handles)

% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%   EventName: string 'SelectionChanged' (read only)
%   OldValue: handle of the previously selected object or empty if none was selected
%   NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if handles.FIR == eventdata.NewValue
    set(handles.type,'Visible','on');
    handles.fir=1;
    guidata(hObject, handles);
else
    set(handles.type,'Visible','off');
    handles.fir=0;
    guidata(hObject, handles);
end
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(~, ~, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filePath = handles.path;
[x,fs] = wavread(filePath);
y=fft(x);
y=fftshift(y);
y_abs=abs(y);
y_ang=angle(y);

slid1 = get(handles.slider11, 'Value');
slid2 = get(handles.slider22, 'Value');
slid3 = get(handles.slider33, 'Value');
slid4 = get(handles.slider44, 'Value');
slid5 = get(handles.slider55, 'Value');
slid6 = get(handles.slider66, 'Value');
slid7 = get(handles.slider77, 'Value');
slid8 = get(handles.slider88, 'Value');
slid9 = get(handles.slider99, 'Value');

firType=get(handles.type, 'Value');

if handles.fir == 1
    %fir filter
    if firType == 1
        %equiripple
        f=fir_lp_equiripple(fs,50,170,180);
        x1=filter(f,x);
        f=fir_bp_equiripple(fs,50,160,170,310,320);
        x2=filter(f,x);
        f=fir_bp_equiripple(fs,50,300,310,600,610);
        x3=filter(f,x);
        f=fir_bp_equiripple(fs,50,590,600,1000,1010);
        x4=filter(f,x);
        f=fir_bp_equiripple(fs,50,990,1000,3000,3010);
        x5=filter(f,x);
        f=fir_bp_equiripple(fs,50,2990,3000,6000,6010);
        x6=filter(f,x);
        f=fir_bp_equiripple(fs,50,5990,6000,12000,12010);
        x7=filter(f,x);
        f=fir_bp_equiripple(fs,50,11990,12000,14000,14010);
        x8=filter(f,x);
        f=fir_bp_equiripple(fs,50,13990,14000,16000,16010);
        x9=filter(f,x);
       
    elseif firType == 2
        %least-square
        f=fir_lp_least_squares(fs,50,170,180);
        x1=filter(f,x);
        f=fir_bp_least_squares(fs,50,160,170,310,320);
        x2=filter(f,x);
        f=fir_bp_least_squares(fs,50,300,310,600,610);
        x3=filter(f,x);
        f=fir_bp_least_squares(fs,50,590,600,1000,1010);
        x4=filter(f,x);
        f=fir_bp_least_squares(fs,50,990,1000,3000,3010);
        x5=filter(f,x);
        f=fir_bp_least_squares(fs,50,2990,3000,6000,6010);
        x6=filter(f,x);
        f=fir_bp_least_squares(fs,50,5990,6000,12000,12010);
        x7=filter(f,x);
        f=fir_bp_least_squares(fs,50,11990,12000,14000,14010);
        x8=filter(f,x);
        f=fir_bp_least_squares(fs,50,13990,14000,16000,16010);
        x9=filter(f,x);
    elseif firType == 3
        %rectangular
         f=fir_lp_window_rectangular(fs,50,170);
        x1=filter(f,x);
        f=fir_bp_window_rectangular(fs,50,170,310);
        x2=filter(f,x);
        f=fir_bp_window_rectangular(fs,50,310,600);
        x3=filter(f,x);
        f=fir_bp_window_rectangular(fs,50,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_rectangular(fs,50,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_rectangular(fs,50,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_rectangular(fs,50,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_rectangular(fs,50,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_rectangular(fs,50,14000,16000);
        x9=filter(f,x);
    elseif firType == 4
        %Chebyshev
        f=fir_lp_window_chebyshev(fs,50,170);
        x1=filter(f,x);
        f=fir_bp_window_chebyshev(fs,50,170,310);
        x2=filter(f,x);
        f=fir_bp_window_chebyshev(fs,50,310,600);
        x3=filter(f,x);
        f=fir_bp_window_chebyshev(fs,50,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_chebyshev(fs,50,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_chebyshev(fs,50,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_chebyshev(fs,50,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_chebyshev(fs,50,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_chebyshev(fs,50,14000,16000);
        x9=filter(f,x);
    elseif firType == 5
        %hamming
        f=fir_lp_window_hamming(fs,50,170);
        x1=filter(f,x);
        f=fir_bp_window_hamming(fs,50,170,310);
        x2=filter(f,x);
        f=fir_bp_window_hamming(fs,50,310,600);
        x3=filter(f,x);
        f=fir_bp_window_hamming(fs,50,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_hamming(fs,50,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_hamming(fs,50,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_hamming(fs,50,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_hamming(fs,50,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_hamming(fs,50,14000,16000);
        x9=filter(f,x);
    else
        %blackman-harris
        f=fir_lp_window_blackman_harris(fs,50,170);
        x1=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,50,170,310);
        x2=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,50,310,600);
        x3=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,50,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,50,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,50,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,50,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,50,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_blackmax_harris(fs,50,14000,16000);
        x9=filter(f,x);
    end
else
    %iir filter
    f=iir_lp_butterworth(fs,50,170);
    x1=filter(f,x);
    f=iir_bp_butterworth(fs,50,170,310);
    x2=filter(f,x);
    f=iir_bp_butterworth(fs,50,310,600);
    x3=filter(f,x);
    f=iir_bp_butterworth(fs,50,600,1000);
    x4=filter(f,x);
    f=iir_bp_butterworth(fs,50,1000,3000);
    x5=filter(f,x);
    f=iir_bp_butterworth(fs,50,3000,6000);
    x6=filter(f,x);
    f=iir_bp_butterworth(fs,50,6000,12000);
    x7=filter(f,x);
    f=iir_bp_butterworth(fs,50,12000,14000);
    x8=filter(f,x);
    f=iir_bp_butterworth(fs,50,14000,16000);
    x9=filter(f,x);
end
y1=fft(x1);
y2=fft(x2);
y3=fft(x3);
y4=fft(x4);
y5=fft(x5);
y6=fft(x6);
y7=fft(x7);
y8=fft(x8);
y9=fft(x9);
y1=fftshift(y1);
y2=fftshift(y2);
y3=fftshift(y3);
y4=fftshift(y4);
y5=fftshift(y5);
y6=fftshift(y6);
y7=fftshift(y7);
y8=fftshift(y8);
y9=fftshift(y9);
y1_abs=abs(y1);
y1_ang=angle(y1);
y2_abs=abs(y2);
y2_ang=angle(y2);
y3_abs=abs(y3);
y3_ang=angle(y3);
y4_abs=abs(y4);
y4_ang=angle(y4);
y5_abs=abs(y5);
y5_ang=angle(y5);
y6_abs=abs(y6);
y6_ang=angle(y6);
y7_abs=abs(y7);
y7_ang=angle(y7);
y8_abs=abs(y8);
y8_ang=angle(y8);
y9_abs=abs(y9);
y9_ang=angle(y9);
x1s=x1*slid1;
x2s=x1*slid2;
x3s=x1*slid3;
x4s=x1*slid4;
x5s=x1*slid5;
x6s=x1*slid6;
x7s=x1*slid7;
x8s=x1*slid8;
x9s=x1*slid9;
total_x = x1s+x2s+x3s+x4s+x5s+x6s+x7s+x8s+x9s;
total_y=fft(total_x);
total_y=fftshift(total_y);
total_y_abs=abs(total_y);
total_y_ang=angle(total_y);
end
