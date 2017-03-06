clear all;close all;clc;


[y,fs]=audioread('m01ae.wav');
window=hamming(64);
noverlap=32;
nfft=128;  
[S,F,T,P]=spectrogram(y,window,noverlap,nfft,fs,'yaxis');
final = surf(T,F,10*log10(P),'edgecolor','none');
axis tight;
view(0,90);
colormap(gray);
set(gca,'clim',[-80 -30]);
xlabel('Temps (Seconds)');
ylabel('Frequnences Hz');

