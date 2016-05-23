% This file is to test the barycenter
clear all; close all;

% Load data
load('normal.mat');
load('abnormal.mat');

% Compute the barycenter
UEAq = zeros(1,27);
UEVq = UEAq;
UEAp = zeros(1,17);
UEVp = UEAp;

% Normal hearts
[UEAq(5), UEVq(5)] = ComputeMotionBarycenter(nor05);
[UEAq(6), UEVq(6)] = ComputeMotionBarycenter(nor06);
[UEAq(7), UEVq(7)] = ComputeMotionBarycenter(nor07);
[UEAq(8), UEVq(8)] = ComputeMotionBarycenter(nor08);
[UEAq(9), UEVq(9)] = ComputeMotionBarycenter(nor09);
[UEAq(10), UEVq(10)] = ComputeMotionBarycenter(nor10);
[UEAq(12), UEVq(12)] = ComputeMotionBarycenter(nor12);
[UEAq(13), UEVq(13)] = ComputeMotionBarycenter(nor13);
[UEAq(15), UEVq(15)] = ComputeMotionBarycenter(nor15);
[UEAq(17), UEVq(17)] = ComputeMotionBarycenter(nor17);
[UEAq(18), UEVq(18)] = ComputeMotionBarycenter(nor18);
[UEAq(19), UEVq(19)] = ComputeMotionBarycenter(nor19);
[UEAq(20), UEVq(20)] = ComputeMotionBarycenter(nor20);
[UEAq(23), UEVq(23)] = ComputeMotionBarycenter(nor23);
[UEAq(24), UEVq(24)] = ComputeMotionBarycenter(nor24);
[UEAq(25), UEVq(25)] = ComputeMotionBarycenter(nor25);
[UEAq(26), UEVq(26)] = ComputeMotionBarycenter(nor26);
% Abnormal hearts
[UEAp(1), UEVp(1)] = ComputeMotionBarycenter(abnor01);
[UEAp(2), UEVp(2)] = ComputeMotionBarycenter(abnor02);
[UEAp(5), UEVp(5)] = ComputeMotionBarycenter(abnor05);
[UEAp(6), UEVp(6)] = ComputeMotionBarycenter(abnor06);
[UEAp(7), UEVp(7)] = ComputeMotionBarycenter(abnor07);
[UEAp(8), UEVp(8)] = ComputeMotionBarycenter(abnor08);
[UEAp(9), UEVp(9)] = ComputeMotionBarycenter(abnor09);
[UEAp(10), UEVp(10)] = ComputeMotionBarycenter(abnor10);
[UEAp(13), UEVp(13)] = ComputeMotionBarycenter(abnor13);
[UEAp(14), UEVp(14)] = ComputeMotionBarycenter(abnor14);
[UEAp(15), UEVp(15)] = ComputeMotionBarycenter(abnor15);
[UEAp(16), UEVp(16)] = ComputeMotionBarycenter(abnor16);

% Show the results
figure;
plot(UEAq, UEVq, 'o', 'color', 'b');
title('Heart distribution in UEV-UEA plane', 'FontSize', 20);
h = xlabel('UEA');
set(h, 'FontSize', 18);
h = ylabel('UED');
set(h, 'FontSize', 18);
hold on
plot(UEAp, UEVp, '*', 'color', 'r');
hold off
legend('Normal heart', 'Abnormal heart');

