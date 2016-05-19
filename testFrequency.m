% This file check the frequency of the area change
% clear all; close all;
% 
% load('normal.mat');
% load('abnormal.mat');
[Rat, Vol] = ComputeArea(abnor14);
figure;
subplot(2,1,1)
plot(Vol);
a = abs(fft(Vol));
b = abs(ifft(a));
subplot(2,1,2)
plot(a);





