%clear all; close all;

% Load data
load('normal.mat');
load('abnormal.mat');
heartVideo = VideoReader('../examples/abnormal/016.avi');
heartImg = heartVideo.read();
img = heartImg(:,:,:,1);
I=im2double(img);
frames = heartVideo.NumberOfFrames;
O = abnor16;
figure;
imshow(I,[]), hold on; 
title('Contour movement ')
drawnow;
for i = 1:frames
    c = i/frames;
    plot([O(:,2,i);O(1,2,i)],[O(:,1,i);O(1,1,i)],'-','Color',[c 1-c 0]);  drawnow
    pause(1);
end


