clear all; close all;

%% Read the vidio, extract the frames/images
heartVideo = VideoReader('../examples/abnormal/35.avi');
heartImg = heartVideo.read();
frames = heartVideo.NumberOfFrames;

img = heartImg(:,:,:,26);
img2 = heartImg(:,:,:,27);
I=im2double(img - img2);


Igray=rgb2gray(I);
figure, imshow(Igray);

% figure, imshow(I(:,:,1));
% figure, imshow(I(:,:,2));
% figure, imshow(I(:,:,3));
% figure, imshow(I(:,:,3) - I(:,:,2));

% Iout = imadjust(I(:,:,3), [0; 0.2],[0.0; 0.8]);
% figure, imshow(Iout);
% Iout1 = IdealLowPass(Iout,0.5);
% figure, imshow(Iout1);
% 
% kernel = [-1 -1 -1;-1 8 -1;-1 -1 -1];
% filteredImage = imfilter(I(:,:,3), kernel, 'same');
% figure, imshow(filteredImage);
