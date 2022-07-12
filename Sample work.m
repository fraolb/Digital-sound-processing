clc, clear all, close all;
Fs = 40000; channels = 1; bits = 16;
r = audiorecorder(Fs,bits,channels);
duration = 5;
disp('Recording Started');
recordblocking(r,duration);
disp('Recording Stopped');
x = getaudiodata(r);
t = 0:1/Fs:(length(x)-1)/Fs;
figure
plot(x,'LineWidth',1.5);
grid on;
xlabel('time (sec)'); ylabel('Amplitude');
title('Time Domain plot of the recording signal');


 n = length(x); F = 0:(n-1)*Fs/n;
 Y = fft(x,n);
 F_0 = (-n/2:n/2-1).*(Fs/n);
 Y_0 = fftshift(Y);
 AY_0 = abs(Y_0);

figure;
 plot(F_0,AY_0,'LineWidth',1.5);
 xlabel('Frequency (Hz)'); ylabel('Amplitude');
 title('frequency domain plot of audio signal');
 

%%FFT 
Xf=fft(x);

figure
plot(real(Xf));
grid on;
title('FFT');

figure
plot(real(Xf(1:50000)))
grid on;
title('chop');
%%EZIGA NEW EYEW 10KHZ FREQUENCY GENERATE ADIRG KEZA ESUN BE 50000 NEW ENE
%%GA YASKEMETEW...KESU BETACH YALUTN BE ARRAY ASKEMETKUACHEW ENA WEDE IFFT
%%MELESKUT..KEZA CHOP ARGOTAL...
%%ena after command lay check argew sound(x) ena sound(real(z)) bleh

q(1:50000)=Xf(1:50000);
 z=ifft(q);
 
figure
plot(real(z));
title('chopped');
 
% %%IFFT
% X1=zeros(1,length(Xf));
% X1(2)=Xf(2);
% xn=ifft(X1);
% figure;
% plot(real(xn));
% title('IFFT Of Low pass Filtered Signal');
% 

%  z = length(xn); F = 0:(z-1)*Fs/z;
%  YY = fft(xn,z);
%  FF_0 = (-n/2:z/2-1).*(Fs/z);
%  YY_0 = fftshift(YY);
%  AAY_0 = abs(YY_0);
%  figure;
%  plot(FF_0,AAY_0,'LineWidth',1.5);
%  xlabel('Frequency (Hz)'); ylabel('Amplitude');
%  title('IFFT Of Low pass Filtered Signal in frequncy domain');
