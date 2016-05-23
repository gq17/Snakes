% This file is to test the barycenter
% By GUO Qiang 23/05/2016 at ENS
clear all; close all;

% Load data
load('normal.mat');
load('abnormal.mat');

% Compute the barycenter
UEAq = zeros(1,27);
UEVq = UEAq;
UESq = UEAq;
UEAp = zeros(1,17);
UEVp = UEAp;
UESp = UEAp;

% Normal hearts
[UEAq(5), UEVq(5), UESq(5)] = ComputeMotionBarycenter(nor05);
[UEAq(6), UEVq(6), UESq(6)] = ComputeMotionBarycenter(nor06);
[UEAq(7), UEVq(7), UESq(7)] = ComputeMotionBarycenter(nor07);
[UEAq(8), UEVq(8), UESq(8)] = ComputeMotionBarycenter(nor08);
[UEAq(9), UEVq(9), UESq(9)] = ComputeMotionBarycenter(nor09);
[UEAq(10), UEVq(10), UESq(10)] = ComputeMotionBarycenter(nor10);
[UEAq(12), UEVq(12), UESq(12)] = ComputeMotionBarycenter(nor12);
[UEAq(13), UEVq(13), UESq(13)] = ComputeMotionBarycenter(nor13);
[UEAq(15), UEVq(15), UESq(15)] = ComputeMotionBarycenter(nor15);
[UEAq(17), UEVq(17), UESq(17)] = ComputeMotionBarycenter(nor17);
[UEAq(18), UEVq(18), UESq(18)] = ComputeMotionBarycenter(nor18);
[UEAq(19), UEVq(19), UESq(19)] = ComputeMotionBarycenter(nor19);
[UEAq(20), UEVq(20), UESq(20)] = ComputeMotionBarycenter(nor20);
[UEAq(23), UEVq(23), UESq(23)] = ComputeMotionBarycenter(nor23);
[UEAq(24), UEVq(24), UESq(24)] = ComputeMotionBarycenter(nor24);
[UEAq(25), UEVq(25), UESq(25)] = ComputeMotionBarycenter(nor25);
[UEAq(26), UEVq(26), UESq(26)] = ComputeMotionBarycenter(nor26);
% Abnormal hearts
[UEAp(1), UEVp(1), UESp(1)] = ComputeMotionBarycenter(abnor01);
[UEAp(2), UEVp(2), UESp(2)] = ComputeMotionBarycenter(abnor02);
[UEAp(5), UEVp(5), UESp(5)] = ComputeMotionBarycenter(abnor05);
[UEAp(6), UEVp(6), UESp(6)] = ComputeMotionBarycenter(abnor06);
[UEAp(7), UEVp(7), UESp(7)] = ComputeMotionBarycenter(abnor07);
[UEAp(8), UEVp(8), UESp(8)] = ComputeMotionBarycenter(abnor08);
[UEAp(9), UEVp(9), UESp(9)] = ComputeMotionBarycenter(abnor09);
[UEAp(10), UEVp(10), UESp(10)] = ComputeMotionBarycenter(abnor10);
[UEAp(13), UEVp(13), UESp(13)] = ComputeMotionBarycenter(abnor13);
[UEAp(14), UEVp(14), UESp(14)] = ComputeMotionBarycenter(abnor14);
[UEAp(15), UEVp(15), UESp(15)] = ComputeMotionBarycenter(abnor15);
[UEAp(16), UEVp(16), UESp(16)] = ComputeMotionBarycenter(abnor16);

% Show the results
figure;
plot(UEAq, UEVq, 'o', 'color', 'b');
title('Barycenter movement in UEV-UEA plane', 'FontSize', 20);
h = xlabel('UEA');
set(h, 'FontSize', 18);
h = ylabel('UEV');
set(h, 'FontSize', 18);
hold on
plot(UEAp, UEVp, '*', 'color', 'r');
hold off
legend('Normal heart', 'Abnormal heart');

% figure;
% plot3(UEAq, UEVq, UESq, 'o', 'color', 'b');
% title('Heart distribution in UEV-UEA plane', 'FontSize', 20);
% h = xlabel('UEA');
% set(h, 'FontSize', 18);
% h = ylabel('UEV');
% set(h, 'FontSize', 18);
% h = zlabel('UES');
% set(h, 'FontSize', 18);
% hold on
% plot3(UEAp, UEVp, UESp, '*', 'color', 'r');
% hold off
% legend('Normal heart', 'Abnormal heart');

