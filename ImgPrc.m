function Iout = ImgPrc(I)
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
Iout = imadjust(I, [0; 0.21],[0.2; 0.8]);

% Median filtering


