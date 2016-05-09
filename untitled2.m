clear all; close all;

%% Read the vidio, extract the frames/images
%heartVideo = VideoReader('../FETT4C.avi');
%heartVideo = VideoReader('../NOBECOURT3cvg.avi');
%heartVideo = VideoReader('../benis4c.avi');
heartVideo = VideoReader('../examples/normal/003.avi');
heartImg = heartVideo.read();
frames = heartVideo.NumberOfFrames;

img = heartImg(:,:,:,1);
I=im2double(img);
figure, imshow(I);[y,x] = getpts; 
P=[x(:) y(:)];

% The contour must always be clockwise (because of the balloon force)
P=MakeContourClockwise2D(P);

% Make an uniform sampled contour description
P=InterpolateContourPoints2D(P,200);

figure;

for x = 1:frames
    img = heartImg(:,:,:,x);
    I=im2double(img);
    imshow(I, []);hold on;plot(P(:,2),P(:,1),'b.'); hold off;
    %pause(1);
    w = waitforbuttonpress;
end
