% This file is to test the distance
% By GUO Qiang 23/05/2016 at ENS
clear all; close all;

% Load data
load('normal.mat');
load('abnormal.mat');

% Compute the correlation
DistArrayq = zeros(1, 27);
CorrArrayq = DistArrayq;
DistArrayp = zeros(1, 17);
CorrArrayp = DistArrayp;
% Normal hearts
[DistArrayq(5), CorrArrayq(5)] = ComputeDistCentral(nor05);
[DistArrayq(6), CorrArrayq(6)] = ComputeDistCentral(nor06);
[DistArrayq(7), CorrArrayq(7)] = ComputeDistCentral(nor07);
[DistArrayq(8), CorrArrayq(8)] = ComputeDistCentral(nor08);
[DistArrayq(9), CorrArrayq(9)] = ComputeDistCentral(nor09);
[DistArrayq(10), CorrArrayq(10)] = ComputeDistCentral(nor10);
[DistArrayq(12), CorrArrayq(12)] = ComputeDistCentral(nor12);
[DistArrayq(13), CorrArrayq(13)] = ComputeDistCentral(nor13);
[DistArrayq(15), CorrArrayq(15)] = ComputeDistCentral(nor15);
[DistArrayq(17), CorrArrayq(17)] = ComputeDistCentral(nor17);
[DistArrayq(18), CorrArrayq(18)] = ComputeDistCentral(nor18);
[DistArrayq(19), CorrArrayq(19)] = ComputeDistCentral(nor19);
[DistArrayq(20), CorrArrayq(20)] = ComputeDistCentral(nor20);
[DistArrayq(23), CorrArrayq(23)] = ComputeDistCentral(nor23);
[DistArrayq(24), CorrArrayq(24)] = ComputeDistCentral(nor24);
[DistArrayq(25), CorrArrayq(25)] = ComputeDistCentral(nor25);
[DistArrayq(26), CorrArrayq(26)] = ComputeDistCentral(nor26);
% Abnormal hearts
[DistArrayp(1), CorrArrayp(1)] = ComputeDistCentral(abnor01);
[DistArrayp(2), CorrArrayp(2)] = ComputeDistCentral(abnor02);
[DistArrayp(5), CorrArrayp(5)] = ComputeDistCentral(abnor05);
[DistArrayp(6), CorrArrayp(6)] = ComputeDistCentral(abnor06);
[DistArrayp(7), CorrArrayp(7)] = ComputeDistCentral(abnor07);
[DistArrayp(8), CorrArrayp(8)] = ComputeDistCentral(abnor08);
[DistArrayp(9), CorrArrayp(9)] = ComputeDistCentral(abnor09);
[DistArrayp(10), CorrArrayp(10)] = ComputeDistCentral(abnor10);
[DistArrayp(13), CorrArrayp(13)] = ComputeDistCentral(abnor13);
[DistArrayp(14), CorrArrayp(14)] = ComputeDistCentral(abnor14);
[DistArrayp(15), CorrArrayp(15)] = ComputeDistCentral(abnor15);
[DistArrayp(16), CorrArrayp(16)] = ComputeDistCentral(abnor16);

% Show the results
figure
stem(DistArrayq)
hold on
stem(DistArrayp, 'r')

