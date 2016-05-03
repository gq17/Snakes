%% features extraction
% Potential choice: the area, curvature, distance, barycenter
clear all; close all;
load('nor01.mat');

% Compute the area of the left ventricle, record the change
% w = waitforbuttonpress;
[Rat, Vol] = ComputeArea(O);


% % Compute and show the curvature
% w = waitforbuttonpress;
% Curv = computeCurvature(O);
% figure;
% surf(Curv);

% % Compute the distance between points in LV.
% w = waitforbuttonpress;
% ffDistArray = ComputeDist(O);
% 
% % Compute the distance between points and the center in LV.
% w = waitforbuttonpress;
% [cDistArray, DistSum] = ComputeDistCentral(O);
% figure;
% plot(DistSum);
% title('The sum of distance change');
% 
% % Compute the distance between the left and right surface of the LV
% w = waitforbuttonpress;
% [DistList, EccenList] = ComputeDistLR(O);
% 
% % The motion of the barycenter
% w = waitforbuttonpress;
% MotionB = ComputeMotionBarycenter(O);

%% feature extraction 2
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
% % Compute the correlation of the distance between points and the center
% w = waitforbuttonpress;
% CorrArray = ComputeCorrelation(O);




% Analyses

% 
% % Curvature analyse
% CorrCurv = AnalsCurv(Curv);

% Distance analyse



