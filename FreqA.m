function [A, diff] = FreqA(Vol)
% Using a cosine function y = Acos(wt+p)+B to fit the curve. Then compute 
% the difference between the real data and the cosine funtion over the 
% number of sampling.

% [A, diff] = FreqA(Vol)

% Input 
% Vol: area change sequence

% Output
% A: amplitude of the area change function
% Diff: difference between the original function and the sinusoidal
% function

% By GUO Qiang 04/07/2016 at ENS

Volb = Vol;

% Ampltitude & Height
bd = sort(Vol, 'descend');
ba = sort(Vol);
up = bd(1+floor(size(Vol,2)/20));
dow = ba(1+floor(size(Vol,2)/20));
A = (up-dow)/2;  
B = (up+dow)/2;

% Fitting
Volc = (Volb-B)/A;

% Get the frequency from the sequence using FFT 
fVol = abs(fft(Vol));
%[~,lInds] = findpeaks([0 fVol(2:end) 0]);
[~,lInds] = max([0 fVol(2:end)]);
cVol = zeros(1, numel(fVol));
cVol([1 lInds (numel(fVol)+2-lInds)]) = fVol([1 lInds (numel(fVol)+2-lInds)]);
iVol = abs(ifft(cVol));
% figure;
% plot(Vol);
% hold on
% plot(iVol, 'r')
% hold off

%pd = 60*frate/fre;
[~,iInds] = findpeaks(iVol);
if(numel(iInds) < 1)
    disp('The heart video is short. Results could be inaccurate!');
end
pd = (numel(Vol)-1)/(lInds(1)-1);
% pd = iInds(2) - iInds(1);
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

% figure;
% plot(Vol, 'b','LineWidth',2);
% title('Area change frequency analyses', 'FontSize', 24);
% h = xlabel('Frame');
% set(h, 'FontSize', 22);
% h = ylabel('Normalized area');
% set(h, 'FontSize', 22);
% hold on
% plot(y, 'r');
% plot(Vol-y, 'k')
% legend('Original curve', 'Fitting cosine function', 'Difference');
% hold off
