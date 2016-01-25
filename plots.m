function varargout = plots(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plots_OpeningFcn, ...
                   'gui_OutputFcn',  @plots_OutputFcn, ...
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

function plots_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global global_struct;

slid1 = global_struct.slid1;
slid2 = global_struct.slid2;
slid3 = global_struct.slid3;
slid4 = global_struct.slid4;
slid5 = global_struct.slid5;
slid6 = global_struct.slid6;
slid7 = global_struct.slid7;
slid8 = global_struct.slid8;
slid9 = global_struct.slid9;

global x1 x2 x3 x4 x5 x6 x7 x8 x9 total_x outputSampleRate;

outputSampleRate = global_struct.fs;
firType = global_struct.firType;
x = global_struct.x;
fir = global_struct.fir;
y=fft(x);
y=fftshift(y);
y_abs=abs(y);
y_ang=angle(y);
order=10;


if fir == 1
    %fir filter
    if firType == 1
        %equiripple
        f=fir_lp_equiripple(outputSampleRate,order,170,180);
        x1=filter(f,x);
        f=fir_bp_equiripple(outputSampleRate,order,160,170,310,320);
        x2=filter(f,x);
        f=fir_bp_equiripple(outputSampleRate,order,300,310,600,610);
        x3=filter(f,x);
        f=fir_bp_equiripple(outputSampleRate,order,590,600,1000,1010);
        x4=filter(f,x);
        f=fir_bp_equiripple(outputSampleRate,order,990,1000,3000,3010);
        x5=filter(f,x);
        f=fir_bp_equiripple(outputSampleRate,order,2990,3000,6000,6010);
        x6=filter(f,x);
        f=fir_bp_equiripple(outputSampleRate,order,5990,6000,12000,12010);
        x7=filter(f,x);
        f=fir_bp_equiripple(outputSampleRate,order,11990,12000,14000,14010);
        x8=filter(f,x);
        f=fir_bp_equiripple(outputSampleRate,order,13990,14000,16000,16010);
        x9=filter(f,x);
       
    elseif firType == 2
        %least-square
        f=fir_lp_least_squares(outputSampleRate,order,170,180);
        x1=filter(f,x);
        f=fir_bp_least_squares(outputSampleRate,order,160,170,310,320);
        x2=filter(f,x);
        f=fir_bp_least_squares(outputSampleRate,order,300,310,600,610);
        x3=filter(f,x);
        f=fir_bp_least_squares(outputSampleRate,order,590,600,1000,1010);
        x4=filter(f,x);
        f=fir_bp_least_squares(outputSampleRate,order,990,1000,3000,3010);
        x5=filter(f,x);
        f=fir_bp_least_squares(outputSampleRate,order,2990,3000,6000,6010);
        x6=filter(f,x);
        f=fir_bp_least_squares(outputSampleRate,order,5990,6000,12000,12010);
        x7=filter(f,x);
        f=fir_bp_least_squares(outputSampleRate,order,11990,12000,14000,14010);
        x8=filter(f,x);
        f=fir_bp_least_squares(outputSampleRate,order,13990,14000,16000,16010);
        x9=filter(f,x);
    elseif firType == 3
        %rectangular
         f=fir_lp_window_rectangular(outputSampleRate,order,170);
        x1=filter(f,x);
        f=fir_bp_window_rectangular(outputSampleRate,order,170,310);
        x2=filter(f,x);
        f=fir_bp_window_rectangular(outputSampleRate,order,310,600);
        x3=filter(f,x);
        f=fir_bp_window_rectangular(outputSampleRate,order,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_rectangular(outputSampleRate,order,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_rectangular(outputSampleRate,order,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_rectangular(outputSampleRate,order,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_rectangular(outputSampleRate,order,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_rectangular(outputSampleRate,order,14000,16000);
        x9=filter(f,x);
    elseif firType == 4
        %Chebyshev
        f=fir_lp_window_chebyshev(outputSampleRate,order,170);
        x1=filter(f,x);
        f=fir_bp_window_chebyshev(outputSampleRate,order,170,310);
        x2=filter(f,x);
        f=fir_bp_window_chebyshev(outputSampleRate,order,310,600);
        x3=filter(f,x);
        f=fir_bp_window_chebyshev(outputSampleRate,order,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_chebyshev(outputSampleRate,order,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_chebyshev(outputSampleRate,order,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_chebyshev(outputSampleRate,order,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_chebyshev(outputSampleRate,order,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_chebyshev(outputSampleRate,order,14000,16000);
        x9=filter(f,x);
    elseif firType == 5
        %hamming
        f=fir_lp_window_hamming(outputSampleRate,order,170);
        x1=filter(f,x);
        f=fir_bp_window_hamming(outputSampleRate,order,170,310);
        x2=filter(f,x);
        f=fir_bp_window_hamming(outputSampleRate,order,310,600);
        x3=filter(f,x);
        f=fir_bp_window_hamming(outputSampleRate,order,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_hamming(outputSampleRate,order,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_hamming(outputSampleRate,order,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_hamming(outputSampleRate,order,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_hamming(outputSampleRate,order,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_hamming(outputSampleRate,order,14000,16000);
        x9=filter(f,x);
    else
        %blackman-harris
        f=fir_lp_window_blackman_harris(outputSampleRate,order,170);
        x1=filter(f,x);
        f=fir_bp_window_blackmax_harris(outputSampleRate,order,170,310);
        x2=filter(f,x);
        f=fir_bp_window_blackmax_harris(outputSampleRate,order,310,600);
        x3=filter(f,x);
        f=fir_bp_window_blackmax_harris(outputSampleRate,order,600,1000);
        x4=filter(f,x);
        f=fir_bp_window_blackmax_harris(outputSampleRate,order,1000,3000);
        x5=filter(f,x);
        f=fir_bp_window_blackmax_harris(outputSampleRate,order,3000,6000);
        x6=filter(f,x);
        f=fir_bp_window_blackmax_harris(outputSampleRate,order,6000,12000);
        x7=filter(f,x);
        f=fir_bp_window_blackmax_harris(outputSampleRate,order,12000,14000);
        x8=filter(f,x);
        f=fir_bp_window_blackmax_harris(outputSampleRate,order,14000,16000);
        x9=filter(f,x);
    end
else
    %iir filter
    f=iir_lp_butterworth(outputSampleRate,order,170);
    x1=filter(f,x);
    f=iir_bp_butterworth(outputSampleRate,order,170,310);
    x2=filter(f,x);
    f=iir_bp_butterworth(outputSampleRate,order,310,600);
    x3=filter(f,x);
    f=iir_bp_butterworth(outputSampleRate,order,600,1000);
    x4=filter(f,x);
    f=iir_bp_butterworth(outputSampleRate,order,1000,3000);
    x5=filter(f,x);
    f=iir_bp_butterworth(outputSampleRate,order,3000,6000);
    x6=filter(f,x);
    f=iir_bp_butterworth(outputSampleRate,order,6000,12000);
    x7=filter(f,x);
    f=iir_bp_butterworth(outputSampleRate,order,12000,14000);
    x8=filter(f,x);
    f=iir_bp_butterworth(outputSampleRate,order,14000,16000);
    x9=filter(f,x);
end

x1s=x1*10^(slid1/20);
x2s=x2*10^(slid2/20);
x3s=x3*10^(slid3/20);
x4s=x4*10^(slid4/20);
x5s=x5*10^(slid5/20);
x6s=x6*10^(slid6/20);
x7s=x7*10^(slid7/20);
x8s=x8*10^(slid8/20);
x9s=x9*10^(slid9/20);
%amplitude


total_x = x1s+x2s+x3s+x4s+x5s+x6s+x7s+x8s+x9s;
global_struct.output = total_x;
total_y=fft(total_x);
total_y=fftshift(total_y);
total_y_abs=abs(total_y);
total_y_ang=angle(total_y);

playControls;

t = (1/outputSampleRate)*(1:length(x));
axes(handles.in_time);
plot(t,x);
title('Input in time doman');
xlabel('time');
ylabel('amplitude');

freq=linspace(-outputSampleRate/2,outputSampleRate/2,length(total_x));
axes(handles.in_freq_mag);
plot(freq,abs(fftshift(fft(x))));
title('Input in frequence doman (Magnitude Response)');
xlabel('frequence');
ylabel('magnitude');

axes(handles.in_freq_phase);
plot(freq,angle(fftshift(fft(x))));
title('Input in frequence doman (Phase Response)');
xlabel('frequence');
ylabel('phase');

axes(handles.out_time);
plot(t,total_x);
title('output in time doman');
xlabel('time');
ylabel('amplitude');

freq=linspace(-outputSampleRate/2,outputSampleRate/2,length(total_x));
axes(handles.out_freq_mag);
plot(freq,total_y_abs);
title('output in frequence doman (Magnitude Response)');
xlabel('frequence');
ylabel('magnitude');

axes(handles.out_freq_phase);
plot(freq,total_y_ang);
title('output in frequence doman (Phase Response)');
xlabel('frequence');
ylabel('phase');



function varargout = plots_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes when selected object is changed in outType.
function outType_SelectionChangeFcn(hObject, eventdata, handles)

global var;
global x1 x2 x3 x4 x5 x6 x7 x8 x9 total_x outputSampleRate;


if eventdata.NewValue == handles.band1
    var=x1;
elseif eventdata.NewValue == handles.band2   
     var=x2;
elseif eventdata.NewValue == handles.band3
     var=x3;
elseif eventdata.NewValue == handles.band4
     var=x4;
elseif eventdata.NewValue == handles.band5
     var=x5;
elseif eventdata.NewValue == handles.band6
     var=x6;
elseif eventdata.NewValue == handles.band7
     var=x7;
elseif eventdata.NewValue == handles.band8
     var=x8;
elseif eventdata.NewValue == handles.band9
     var=x9;
else
     var=total_x;
end


t = (1/outputSampleRate)*(1:length(total_x));
axes(handles.out_time);
plot(t,var);
title('Output in time doman');
xlabel('time');
ylabel('amplitude');

freq=linspace(-outputSampleRate/2,outputSampleRate/2,length(total_x));
axes(handles.out_freq_mag);
plot(freq,abs(fftshift(fft(var))));
title('Output in frequence doman (Magnitude Response)');
xlabel('frequence');
ylabel('magnitude');

axes(handles.out_freq_phase);
plot(freq,angle(fftshift(fft(var))));
title('Output in frequence doman (Phase Response)');
xlabel('frequence');
ylabel('phase');
