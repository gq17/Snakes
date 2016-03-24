clear all; close all;
%heartVideo = VideoReader('FETT4C.avi');
%heartVideo = VideoReader('NOBECOURT3cvg.avi');
heartVideo = VideoReader('benis4c.avi');
heartImg = heartVideo.read();
frames = heartVideo.NumberOfFrames;
img = heartImg(:,:,:,7);
I=im2double(img);

if(size(I,3)==3), I=rgb2gray(I); end

figure;
imshow(I, []);
figure;
imhist(I)

Iout = ImgPrc(I);

figure;
imshow(Iout,[]);
figure;
imhist(Iout)

