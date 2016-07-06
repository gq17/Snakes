clear all; close all;

%% Read the vidio, extract the frames/images
heartVideo = VideoReader('../examples/abnormal/028.avi');
heartImg = heartVideo.read();
frames = heartVideo.NumberOfFrames;

img = heartImg(:,:,:,1);
I=im2double(img);


Igray=rgb2gray(I);
figure, imshow(Igray);

figure, imshow(I(:,:,1));
figure, imshow(I(:,:,2));
figure, imshow(I(:,:,3));

Iout = imadjust(Igray, [0; 0.21],[0.2; 0.8]);
figure, imshow(Iout);