% clear all; close all;
% 
% load('normal.mat');
% load('abnormal.mat');
% heartVideo = VideoReader('../examples/abnormal/028.avi');
% heartImg = heartVideo.read();
% img = heartImg(:,:,:,1);
% I=im2double(img);
% frames = heartVideo.NumberOfFrames;
% O = abnor28;
% figure;
% imshow(I,[]), hold on; 
% title('Contour movement ')
% drawnow;
% for i = 1:frames
%     c = i/frames;
%     plot([O(:,2,i);O(1,2,i)],[O(:,1,i);O(1,1,i)],'-','Color',[c 1-c 0]);  drawnow
%     pause(1);
% end


% fVol = abs(fft(Voln36));
% figure;
% plot(fVol);
% %[~,lInds] = findpeaks([0 fVol(2:end) 0]);
% [~,lInds] = max([0 fVol(2:end)]);
% cVol = zeros(1,numel(fVol));
% cVol([1 lInds (numel(fVol)+2-lInds)]) = fVol([1 lInds (numel(fVol)+2-lInds)]);
% iVol = abs(ifft(cVol));
% size(iVol)
% figure;
% plot(Voln36);
% hold on
% plot(iVol, 'r')
% hold off

% try the distance
%load data.mat;

[a, b] = ComputeDistCentral(nor5);
[a, b] = ComputeDistCentral(nor6);
[a, b] = ComputeDistCentral(nor7);
[a, b] = ComputeDistCentral(nor8);
[a, b] = ComputeDistCentral(abnor5);
[a, b] = ComputeDistCentral(abnor6);
[a, b] = ComputeDistCentral(abnor7);
[a, b] = ComputeDistCentral(abnor8);

