% This file shows the difference of left ventricle area change
clear all; close all;
% Normal hearts
P1 = [10 12 7 16 12 15 44 6 12 12 11 18];
Q1 = [12 14 15 13 5 13 6 10 12 11 6 12 11 6 12 6 6];
R = max([P1, Q1]);
P = R - P1;
Q = R - Q1;
load('normal.mat');
figure;
[Rat, Vol] = ComputeArea(nor05);plot( Vol(Q1(1):end), 'b');
%plot([zeros(1,Q(1)) Vol], 'b');
ylim([0, 1.2]);
title('The change of area of the LV');
xlabel('Frame');
ylabel('Normalized area');
hold on
load('abnormal.mat');
[Rat, Vol] = ComputeArea(abnor01);plot( Vol(P1(1):end), 'r');
%plot([zeros(1,P(1)) Vol], 'r');
legend('Normal heart', 'Abnormal heart');

[Rat, Vol] = ComputeArea(nor06);plot( Vol(Q1(2):end), 'b');
%plot([zeros(1,Q(2)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor07);plot( Vol(Q1(3):end), 'b');
%plot([zeros(1,Q(3)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor08);plot( Vol(Q1(4):end), 'b');
%plot([zeros(1,Q(4)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor09);plot( Vol(Q1(5):end), 'b');
%plot([zeros(1,Q(5)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor10);plot( Vol(Q1(6):end), 'b');
%plot([zeros(1,Q(6)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor12);plot( Vol(Q1(7):end), 'b');
%plot([zeros(1,Q(7)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor13);plot( Vol(Q1(8):end), 'b');
%plot([zeros(1,Q(8)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor15);plot( Vol(Q1(9):end), 'b');
%plot([zeros(1,Q(9)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor17);plot( Vol(Q1(10):end), 'b');
%plot([zeros(1,Q(10)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor18);plot( Vol(Q1(11):end), 'b');
%plot([zeros(1,Q(11)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor19);plot( Vol(Q1(12):end), 'b');
%plot([zeros(1,Q(12)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor20);plot( Vol(Q1(13):end), 'b');
%plot([zeros(1,Q(13)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor23);plot( Vol(Q1(14):end), 'b');
%plot([zeros(1,Q(14)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor24);plot( Vol(Q1(15):end), 'b');
%plot([zeros(1,Q(15)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor25);plot( Vol(Q1(16):end), 'b');
%plot([zeros(1,Q(16)) Vol], 'b');
[Rat, Vol] = ComputeArea(nor26);plot( Vol(Q1(17):end), 'b');
%plot([zeros(1,Q(17)) Vol], 'b');

%Abnormal heart

[Rat, Vol] = ComputeArea(abnor02);plot( Vol(P1(2):end), 'r');
%plot([zeros(1,P(2)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor05);plot( Vol(P1(3):end), 'r');
%plot([zeros(1,P(3)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor06);plot( Vol(P1(4):end), 'r');
%plot([zeros(1,P(4)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor07);plot( Vol(P1(5):end), 'r');
%plot([zeros(1,P(5)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor08);plot( Vol(P1(6):end), 'r');
%plot([zeros(1,P(6)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor09);plot( Vol(P1(7):end), 'r');
%plot([zeros(1,P(7)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor10);plot( Vol(P1(8):end), 'r');
%plot([zeros(1,P(8)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor13);plot( Vol(P1(9):end), 'r');
%plot([zeros(1,P(9)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor14);plot( Vol(P1(10):end), 'r');
%plot([zeros(1,P(10)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor15);plot( Vol(P1(11):end), 'r');
%plot([zeros(1,P(11)) Vol], 'r');
[Rat, Vol] = ComputeArea(abnor16);plot( Vol(P1(11):end), 'r');
%plot([zeros(1,P(12)) Vol], 'r');

hold off