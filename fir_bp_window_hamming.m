function Hd = fir_bp_window_hamming(Fs,N,Fc1,Fc2)
%FIR_BP_WINDOW_HAMMING Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.2 and the Signal Processing Toolbox 6.20.
% Generated on: 24-Jan-2016 16:07:56

% FIR Window Bandpass filter designed using the FIR1 function.

% All frequency values are in Hz.

flag = 'scale';  % Sampling Flag
% Create the window vector for the design algorithm.
win = hamming(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);
Hd = dfilt.dffir(b);

% [EOF]
