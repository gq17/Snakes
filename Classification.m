% Classification
% By GUO Qiang 25/05/2016 at ENS
clear all; close all;

% Load data
load('normal.mat');
load('abnormal.mat');

% First low apex location for normal hearts
Q1 = [0 0 0 0 12 14 15 13 5 13 0 6 10 0 12 0 11 6 12 11 0 0 6 12 6 6 0];  
% First low apex location for abnormal hearts
P1 = [10 12 0 0 7 16 12 15 44 6 0 0 12 12 11 18 0];
% Frequency of normal hearts
freq = [82 76 84 81 85 62 66 55 70 64 75 67 100 48 88 72 78 78 100 85 61 56 72 73 71 63 99]; %fre 23th
% Frame rate of normal hearts
frateq = [0 0 0 0 30 25 30 30 15 25 0 15 30 0 30 0 25 15 25 25 0 0 15 25 15 15 0];
% Frequency of abnormal hearts
frep = [103 103 64 69 57 60 60 71 46 85 70 136 103 54 92 52 130];
% Frame rate of abnormal hearts
fratep = [25 25 0 0 15 30 30 25 30 15 0 0 25 25 30 30 0];

%Normal hearts
Voln5 = ComputeArea(nor05);Voln6 = ComputeArea(nor06);
Voln7 = ComputeArea(nor07);Voln8 = ComputeArea(nor08);
Voln9 = ComputeArea(nor09);Voln10 = ComputeArea(nor10);
Voln12 = ComputeArea(nor12);Voln13 = ComputeArea(nor13);
Voln15 = ComputeArea(nor15);Voln17 = ComputeArea(nor17);
Voln18 = ComputeArea(nor18);Voln19 = ComputeArea(nor19);
Voln20 = ComputeArea(nor20);Voln23 = ComputeArea(nor23);
Voln24 = ComputeArea(nor24);Voln25 = ComputeArea(nor25);
Voln26 = ComputeArea(nor26);

%Abnormal heart
Vola1 = ComputeArea(abnor01);Vola2 = ComputeArea(abnor02);
Vola5 = ComputeArea(abnor05);Vola6 = ComputeArea(abnor06);
Vola7 = ComputeArea(abnor07);Vola8 = ComputeArea(abnor08);
Vola9 = ComputeArea(abnor09);Vola10 = ComputeArea(abnor10);
Vola13 = ComputeArea(abnor13);Vola14 = ComputeArea(abnor14);
Vola15 = ComputeArea(abnor15);Vola16 = ComputeArea(abnor16);

%% Cosine function fitting
IUAq = zeros(1, size(Q1, 2));
IUDq = IUAq;
[IUAq(5), IUDq(5)] = FreqA(Voln5, freq(5), frateq(5));
[IUAq(6), IUDq(6)] = FreqA(Voln6, freq(6), frateq(5));
[IUAq(7), IUDq(7)] = FreqA(Voln7, freq(7), frateq(7));
[IUAq(8), IUDq(8)] = FreqA(Voln8, freq(8), frateq(8));
[IUAq(9), IUDq(9)] = FreqA(Voln9, freq(9), frateq(9));
[IUAq(10), IUDq(10)] = FreqA(Voln10, freq(10), frateq(10));
[IUAq(12), IUDq(12)] = FreqA(Voln12, freq(12), frateq(12));
[IUAq(13), IUDq(13)] = FreqA(Voln13, freq(13), frateq(13));
[IUAq(15), IUDq(15)] = FreqA(Voln15, freq(15), frateq(15));
[IUAq(17), IUDq(17)] = FreqA(Voln17, freq(17), frateq(17));
[IUAq(18), IUDq(18)] = FreqA(Voln18, freq(18), frateq(18));
[IUAq(19), IUDq(19)] = FreqA(Voln19, freq(19), frateq(19));
[IUAq(20), IUDq(20)] = FreqA(Voln20, freq(20), frateq(20));
[IUAq(23), IUDq(23)] = FreqA(Voln23, freq(23), frateq(23));
[IUAq(24), IUDq(24)] = FreqA(Voln24, freq(24), frateq(24));
[IUAq(25), IUDq(25)] = FreqA(Voln25, freq(25), frateq(25));
[IUAq(26), IUDq(26)] = FreqA(Voln26, freq(26), frateq(26));

IUAp = zeros(1, size(P1, 2));
IUDp = IUAp;
[IUAp(1), IUDp(1)] = FreqA(Vola1, frep(1), fratep(1));
[IUAp(2), IUDp(2)] = FreqA(Vola2, frep(2), fratep(2));
[IUAp(5), IUDp(5)] = FreqA(Vola5, frep(5), fratep(5));
[IUAp(6), IUDp(6)] = FreqA(Vola6, frep(6), fratep(5));
[IUAp(7), IUDp(7)] = FreqA(Vola7, frep(7), fratep(7));
[IUAp(8), IUDp(8)] = FreqA(Vola8, frep(8), fratep(8));
[IUAp(9), IUDp(9)] = FreqA(Vola9, frep(9), fratep(9));
[IUAp(10), IUDp(10)] = FreqA(Vola10, frep(10), fratep(10));
[IUAp(13), IUDp(13)] = FreqA(Vola13, frep(13), fratep(13));
[IUAp(14), IUDp(14)] = FreqA(Vola14, frep(14), fratep(14));
[IUAp(15), IUDp(15)] = FreqA(Vola15, frep(15), fratep(15));
[IUAp(16), IUDp(16)] = FreqA(Vola16, frep(16), fratep(16));

% Show the results
% figure;
% plot(IUAq, IUDq, 'o', 'color', 'b');
% title('Heart distribution in IUD-IUA plane', 'FontSize', 20);
% h = xlabel('IUA');
% set(h, 'FontSize', 18);
% h = ylabel('IUD');
% set(h, 'FontSize', 18);
% hold on
% plot(IUAp, IUDp, '*', 'color', 'r');
% hold off
% legend('Normal heart', 'Abnormal heart');


%% Aligning
% figure;
% plot( Voln5(Q1(5):end), 'b');
% ylim([0, 1.2]);
% title('The change of area of the LV');
% xlabel('Frame');
% ylabel('Normalized area');
% hold on
% plot( Vola1(P1(1):end), 'r');
% legend('Normal heart', 'Abnormal heart');
% plot( Voln6(Q1(6):end), 'b');plot( Voln7(Q1(7):end), 'b');
% plot( Voln8(Q1(8):end), 'b');plot( Voln9(Q1(9):end), 'b');
% plot( Voln10(Q1(10):end), 'b');plot( Voln12(Q1(12):end), 'b');
% plot( Voln13(Q1(13):end), 'b');plot( Voln15(Q1(15):end), 'b');
% plot( Voln17(Q1(17):end), 'b');plot( Voln18(Q1(18):end), 'b');
% plot( Voln19(Q1(19):end), 'b');plot( Voln20(Q1(20):end), 'b');
% plot( Voln23(Q1(23):end), 'b');plot( Voln24(Q1(24):end), 'b');
% plot( Voln25(Q1(25):end), 'b');plot( Voln26(Q1(26):end), 'b');
% plot( Vola2(P1(2):end), 'r');plot( Vola5(P1(5):end), 'r');
% plot( Vola6(P1(6):end), 'r');plot( Vola7(P1(7):end), 'r');
% plot( Vola8(P1(8):end), 'r');plot( Vola9(P1(9):end), 'r');
% plot( Vola10(P1(10):end), 'r');plot( Vola13(P1(13):end), 'r');
% plot( Vola14(P1(14):end), 'r');plot( Vola15(P1(15):end), 'r');
% plot( Vola16(P1(16):end), 'r');
% hold off

%% Barycenter added

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
% figure;
% plot(UEAq, UEVq, 'o', 'color', 'b');
% title('Barycenter movement in UEV-UEA plane', 'FontSize', 20);
% h = xlabel('UEA');
% set(h, 'FontSize', 18);
% h = ylabel('UEV');
% set(h, 'FontSize', 18);
% hold on
% plot(UEAp, UEVp, '*', 'color', 'r');
% hold off
% legend('Normal heart', 'Abnormal heart');

%% 3-D classification
figure;
plot3(IUAq, UEAq, UEVq, 'o', 'color', 'b');
title('Heart distribution in 3-D space', 'FontSize', 20);
h = xlabel('IUA');
set(h, 'FontSize', 18);
h = ylabel('UEA');
set(h, 'FontSize', 18);
h = zlabel('UEV');
set(h, 'FontSize', 18);
hold on
plot3(IUAp, UEAp, UEVp, '*', 'color', 'r');
hold off
legend('Normal heart', 'Abnormal heart');


