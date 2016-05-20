%% features extraction
% Potential choice: the area, curvature, distance, barycenter
clear all; close all;
load('nor08.mat');

% Compute the area of the left ventricle, record the change
% w = waitforbuttonpress;
% Vol = ComputeArea(O);

% The motion of the barycenter
% w = waitforbuttonpress;
% MotionB = ComputeMotionBarycenter(O);

% Compute the distance between the left and right surface of the LV
% w = waitforbuttonpress;
% [DistList, EccenList] = ComputeDistLR(O);

% Compute the distance between points and the center in LV.
% w = waitforbuttonpress;
[DistArray, CorrArray] = ComputeDistCentral(O);

% % Compute and show the curvature
% w = waitforbuttonpress;
% Curv = computeCurvature(O);
% figure;
% surf(Curv);

% % Compute the distance between points in LV.
% w = waitforbuttonpress;
% ffDistArray = ComputeDist(O);
% 
% % Compute the distance between points in one contour
% w = waitforbuttonpress;
% DistArrayP = ComputeDistPoints(O);
% 
% % Compute the perimeter of the contour
% w = waitforbuttonpress;
% Peri = sum(DistArrayP);
% figure;
% plot(Peri);
% title('The perimeter change');
% 

% Analyses

% 
% % Curvature analyse
% CorrCurv = AnalsCurv(Curv);

% Distance analyse



