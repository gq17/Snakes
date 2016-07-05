function [A, diff] = FreqA2(Vol, fre, frate)
% Using a cosine function y = Acos(wt+p)+B to fit the curve. Then compute 
% the difference between the real data and the cosine funtion over the 
% number of sampling.

% diff = FreqA(Vol, fre, frate)

% Input 
% Vol: area change sequence
% fre: frequency of heart beat
% frate: frame rate of the video

% Output
% Diff: difference from a sinusoidal function

% By GUO Qiang 04/07/2016 at ENS

Volb = Vol;
bd = sort(Vol, 'descend');
ba = sort(Vol);
up = bd(1+floor(size(Vol,2)/20));
dow = ba(1+floor(size(Vol,2)/20));
% Ampltitude & Height
A = (up-dow)/2;  
B = (up+dow)/2;

% Fitting
Volc = (Volb-B)/A;

% Get the frequency from the sequence using FFT 
fVol = abs(fft(Vol));
[~,lInds] = findpeaks([0 fVol(2:end) 0]);
cVol = zeros(1, numel(fVol));
cVol([1 lInds(1) (numel(fVol)+2-lInds(1))]) = fVol([1 lInds(1) (numel(fVol)+2-lInds(1))]);
iVol = abs(ifft(cVol));
% figure;
% plot(Vol);
% hold on
% plot(iVol, 'r')
% hold off

%pd = 60*frate/fre;
[~,iInds] = findpeaks(iVol);
if(numel(iInds) < 2)
    disp('The video is too short. Result could be inaccurate!');
    pd = (numel(Vol)-1)/(lInds(1)-1);
else
    pd = iInds(2) - iInds(1);
end
w = 2*pi/pd;

p = 0;
diff = 10000;
t = 1:size(Vol,2);
for i=1:pd
    y = cos(w*t + i);
    temp = sum((Volc-y).^2);
    if(temp<diff)
        diff =  temp;
        p = i;
    end
end

y = A*cos(w*t + p) + B;
diff = sum((Vol-y).^2)/size(Vol,2);
%diff = diff/A;

% figure;
% subplot(3,1,1)
% plot(Vol);
% subplot(3,1,2)
% plot(Volc);
% subplot(3,1,3)
% plot(y)

figure;
plot(Vol, 'b');
title('Area change frequency analyses', 'FontSize', 20);
h = xlabel('Frame');
set(h, 'FontSize', 18);
h = ylabel('Normalized area');
set(h, 'FontSize', 18);
hold on
plot(y, 'r');
plot(Vol-y, 'k')
legend('Original curve', 'Fitting cosine function', 'Difference');
hold off
