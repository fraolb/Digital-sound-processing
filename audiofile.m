%clc, clear all, close all;

recording = audiorecorder();
disp('SPEAK...!!!')
recordblocking(recording ,5);
disp('STOP...')
% play(recording);
y= getaudiodata(recording);
plot(y);

N=8;   %order of filter
fc= 0.2;%sampling freq

%highpass filter
% num1=fir1(N,fc,'high');
% den1=[1];
% fvtool(num1,den1)
% subplot(2,1,1)
% plot(y)  %original audio
% FILTER1 =filter(num1,den1,y)
% subplot(2,1,2)
% plot(FILTER1)
% sound(FILTER1);

lowpass filter
num2=fir1(N,fc,'low');
den2=[1];
fvtool(num2,den2)
subplot(2,1,1)
plot(y)  %original audio
FILTER2 =filter(num2,den2,y)
subplot(2,1,2)
plot(FILTER2)

%bandpass filter
% f2=0.3;
% f1=0.1;
% FILTER3= fir1(N,[f2 f1]);
% fvtool(FILTER3,1)
% figure
% plot(FILTER3);

%bandstop filter
% f2=0.1;
% f1=0.5;
% FILTER4=fir1(N,[f2f1],'stop');
% fvtool(FILTER4, 1)
% figure
% plot(FILTER4);