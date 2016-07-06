clear all; close all;

load('normal.mat');
load('abnormal.mat');
heartVideo = VideoReader('../examples/abnormal/014.avi');
heartImg = heartVideo.read();
img = heartImg(:,:,:,1);
I=im2double(img);
frames = heartVideo.NumberOfFrames;
O = abnor14;
figure;
imshow(I,[]), hold on; 
title('Contour movement ')
drawnow;
for i = 1:frames
    c = i/frames;
    plot([O(:,2,i);O(1,2,i)],[O(:,1,i);O(1,1,i)],'-','Color',[c 1-c 0]);  drawnow
    pause(1);
end




% fVol = abs(fft(Voln5(1:22)));
% figure;
% plot(fVol);
% [~,lInds] = findpeaks([0 fVol(2:end) 0]);
% cVol = zeros(1,numel(fVol));
% cVol([1 lInds(1) (numel(fVol)+2-lInds(1))]) = fVol([1 lInds(1) (numel(fVol)+2-lInds(1))]);
% iVol = abs(ifft(cVol));
% size(iVol)
% figure;
% plot(Voln5);
% hold on
% plot(iVol, 'r')
% hold off


