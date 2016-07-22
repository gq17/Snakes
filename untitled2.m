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

aheart{1} = abnor1;aheart{10} = abnor10;aheart{11} = abnor11;
aheart{13} = abnor13;aheart{14} = abnor14;aheart{15} = abnor15;
aheart{16} = abnor16;aheart{18} = abnor18;aheart{19} = abnor19;
aheart{2} = abnor2;aheart{20} = abnor20;aheart{21} = abnor21;
aheart{22} = abnor22;aheart{23} = abnor23;aheart{25} = abnor25;
aheart{26} = abnor26;aheart{28} = abnor28;aheart{30} = abnor30;
aheart{31} = abnor31;aheart{32} = abnor32;aheart{34} = abnor34;
aheart{35} = abnor35;aheart{37} = abnor37;aheart{38} = abnor38;
aheart{5} = abnor5;aheart{6} = abnor6;aheart{7} = abnor7;
aheart{8} = abnor8;aheart{9} = abnor9;


