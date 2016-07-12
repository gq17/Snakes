function Iout = ImgPrc(I, P)
% This function processes the input image, increases the contrast of the
% interested area. 

% Iout = ImgPrc(I)

% Input&Output
% I: input image
% Iout: output image


% 22/03/2016 By GUO Qiang at ENS

% Histogram equaliztion
%Iout = histeq(I, 200);

% Histogram specialization
% Thd = 0.2;
% sizeP = size(I);
% find the value for the LV
x = floor(mean(P));
z = mean(mean(I(x(1)-4:x(1)+5,x(2)-4:x(2)+5)));
zmax = min(z+0.2, 0.99);


Iout = imadjust(I, [z; zmax],[0.0; 0.8]);
Iout = IdealLowPass(Iout,0.3);
% kernel = [-1 -1 -1;-1 8 -1;-1 -1 -1];
% Iout = imfilter(I, kernel, 'same');

% Median filtering


