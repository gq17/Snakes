% Training and Classification
% By GUO Qiang 25/05/2016 at ENS
clear all; close all;

% Load data
load('data.mat');

% Number of samples
numNormel = 55;
numAbnor  = 38;

%% Area change features
% ACA: area change amplitude
% ACD: area change deviation
ACAq = zeros(numNormel,1);
ACDq = ACAq;
ACAp = zeros(numAbnor,1);
ACDp = ACAp;

% Normal hearts
[ACAq(5), ACDq(5)] = ComputeArea(nor5);   [ACAq(6), ACDq(6)] = ComputeArea(nor6);
[ACAq(7), ACDq(7)] = ComputeArea(nor7);   [ACAq(8), ACDq(8)] = ComputeArea(nor8);
[ACAq(9), ACDq(9)] = ComputeArea(nor9);   [ACAq(10), ACDq(10)] = ComputeArea(nor10);
[ACAq(12), ACDq(12)] = ComputeArea(nor12);[ACAq(13), ACDq(13)] = ComputeArea(nor13);
[ACAq(14), ACDq(14)] = ComputeArea(nor14);[ACAq(15), ACDq(15)] = ComputeArea(nor15);
[ACAq(16), ACDq(16)] = ComputeArea(nor16);[ACAq(17), ACDq(17)] = ComputeArea(nor17);
[ACAq(18), ACDq(18)] = ComputeArea(nor18);[ACAq(19), ACDq(19)] = ComputeArea(nor19);
[ACAq(20), ACDq(20)] = ComputeArea(nor20);[ACAq(22), ACDq(22)] = ComputeArea(nor22);
[ACAq(23), ACDq(23)] = ComputeArea(nor23);[ACAq(24), ACDq(24)] = ComputeArea(nor24);
[ACAq(25), ACDq(25)] = ComputeArea(nor25);[ACAq(26), ACDq(26)] = ComputeArea(nor26);
[ACAq(28), ACDq(28)] = ComputeArea(nor28);[ACAq(29), ACDq(29)] = ComputeArea(nor29);
[ACAq(36), ACDq(36)] = ComputeArea(nor36);[ACAq(37), ACDq(37)] = ComputeArea(nor37);
[ACAq(13), ACDq(13)] = ComputeArea(nor38);[ACAq(40), ACDq(40)] = ComputeArea(nor40);
[ACAq(42), ACDq(42)] = ComputeArea(nor42);[ACAq(43), ACDq(43)] = ComputeArea(nor43);
[ACAq(44), ACDq(44)] = ComputeArea(nor44);[ACAq(46), ACDq(46)] = ComputeArea(nor46);
[ACAq(48), ACDq(48)] = ComputeArea(nor48);[ACAq(50), ACDq(50)] = ComputeArea(nor50);
[ACAq(53), ACDq(53)] = ComputeArea(nor53);[ACAq(54), ACDq(54)] = ComputeArea(nor54);
[ACAq(55), ACDq(55)] = ComputeArea(nor55);

% Abnormal heart
[ACAp(1), ACDp(1)] = ComputeArea(abnor1);   [ACAp(2), ACDp(2)] = ComputeArea(abnor2);
[ACAp(5), ACDp(5)] = ComputeArea(abnor5);   [ACAp(6), ACDp(6)] = ComputeArea(abnor6);
[ACAp(7), ACDp(7)] = ComputeArea(abnor7);   [ACAp(8), ACDp(8)] = ComputeArea(abnor8);
[ACAp(9), ACDp(9)] = ComputeArea(abnor9);   [ACAp(10), ACDp(10)] = ComputeArea(abnor10);
[ACAp(11), ACDp(11)] = ComputeArea(abnor11);[ACAp(13), ACDp(13)] = ComputeArea(abnor13);
[ACAp(14), ACDp(14)] = ComputeArea(abnor14);[ACAp(15), ACDp(15)] = ComputeArea(abnor15);
[ACAp(16), ACDp(16)] = ComputeArea(abnor16);[ACAp(18), ACDp(18)] = ComputeArea(abnor18);
[ACAp(19), ACDp(19)] = ComputeArea(abnor19);[ACAp(20), ACDp(20)] = ComputeArea(abnor20);
[ACAp(21), ACDp(21)] = ComputeArea(abnor21);[ACAp(22), ACDp(22)] = ComputeArea(abnor22);
[ACAp(23), ACDp(23)] = ComputeArea(abnor23);[ACAp(25), ACDp(25)] = ComputeArea(abnor25);
[ACAp(26), ACDp(26)] = ComputeArea(abnor26);[ACAp(28), ACDp(28)] = ComputeArea(abnor28);
[ACAp(30), ACDp(30)] = ComputeArea(abnor30);[ACAp(31), ACDp(31)] = ComputeArea(abnor31);
[ACAp(32), ACDp(32)] = ComputeArea(abnor32);[ACAp(34), ACDp(34)] = ComputeArea(abnor34);
[ACAp(35), ACDp(35)] = ComputeArea(abnor35);[ACAp(37), ACDp(37)] = ComputeArea(abnor37);
[ACAp(38), ACDp(38)] = ComputeArea(abnor38);


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

%% Compute the barycenter movement
% BMR: barycentre movement radius
BMRq = zeros(numNormel,1);
BMRp = zeros(numAbnor,1);

% Normal hearts
BMRq(5) = ComputeMotionBarycenter(nor5);  BMRq(6) = ComputeMotionBarycenter(nor6);
BMRq(7) = ComputeMotionBarycenter(nor7);  BMRq(8) = ComputeMotionBarycenter(nor8);
BMRq(9) = ComputeMotionBarycenter(nor9);  BMRq(10) = ComputeMotionBarycenter(nor10);
BMRq(12) = ComputeMotionBarycenter(nor12);BMRq(13) = ComputeMotionBarycenter(nor13);
BMRq(14) = ComputeMotionBarycenter(nor14);
BMRq(15) = ComputeMotionBarycenter(nor15);BMRq(16) = ComputeMotionBarycenter(nor16);
BMRq(17) = ComputeMotionBarycenter(nor17);BMRq(18) = ComputeMotionBarycenter(nor18);
BMRq(19) = ComputeMotionBarycenter(nor19);BMRq(20) = ComputeMotionBarycenter(nor20);
BMRq(22) = ComputeMotionBarycenter(nor22);BMRq(23) = ComputeMotionBarycenter(nor23);
BMRq(24) = ComputeMotionBarycenter(nor24);BMRq(25) = ComputeMotionBarycenter(nor25);
BMRq(26) = ComputeMotionBarycenter(nor26);BMRq(28) = ComputeMotionBarycenter(nor28);
BMRq(29) = ComputeMotionBarycenter(nor29);BMRq(36) = ComputeMotionBarycenter(nor36);
BMRq(37) = ComputeMotionBarycenter(nor37);BMRq(38) = ComputeMotionBarycenter(nor38);
BMRq(40) = ComputeMotionBarycenter(nor40);BMRq(42) = ComputeMotionBarycenter(nor42);
BMRq(43) = ComputeMotionBarycenter(nor43);BMRq(44) = ComputeMotionBarycenter(nor44);
BMRq(46) = ComputeMotionBarycenter(nor46);BMRq(48) = ComputeMotionBarycenter(nor48);
BMRq(50) = ComputeMotionBarycenter(nor50);BMRq(53) = ComputeMotionBarycenter(nor53);
BMRq(54) = ComputeMotionBarycenter(nor54);BMRq(55) = ComputeMotionBarycenter(nor55);

% Abnormal hearts
BMRp(1) = ComputeMotionBarycenter(abnor1);  BMRp(2) = ComputeMotionBarycenter(abnor2);
BMRp(5) = ComputeMotionBarycenter(abnor5);  BMRp(6) = ComputeMotionBarycenter(abnor6);
BMRp(7) = ComputeMotionBarycenter(abnor7);  BMRp(8) = ComputeMotionBarycenter(abnor8);
BMRp(9) = ComputeMotionBarycenter(abnor9);  BMRp(10) = ComputeMotionBarycenter(abnor10);BMRp(11) = ComputeMotionBarycenter(abnor11);
BMRp(13) = ComputeMotionBarycenter(abnor13);BMRp(14) = ComputeMotionBarycenter(abnor14);
BMRp(15) = ComputeMotionBarycenter(abnor15);BMRp(16) = ComputeMotionBarycenter(abnor16);
BMRp(18) = ComputeMotionBarycenter(abnor18);BMRp(19) = ComputeMotionBarycenter(abnor19);
BMRp(20) = ComputeMotionBarycenter(abnor20);BMRp(21) = ComputeMotionBarycenter(abnor21);
BMRp(22) = ComputeMotionBarycenter(abnor22);BMRp(23) = ComputeMotionBarycenter(abnor23);
BMRp(25) = ComputeMotionBarycenter(abnor25);BMRp(26) = ComputeMotionBarycenter(abnor26);
BMRp(28) = ComputeMotionBarycenter(abnor28);BMRp(30) = ComputeMotionBarycenter(abnor30);
BMRp(31) = ComputeMotionBarycenter(abnor31);BMRp(32) = ComputeMotionBarycenter(abnor32);BMRp(34) = ComputeMotionBarycenter(abnor34);
BMRp(35) = ComputeMotionBarycenter(abnor35);BMRp(37) = ComputeMotionBarycenter(abnor37);
BMRp(38) = ComputeMotionBarycenter(abnor38);

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

%% Left and Right area similiarity
% SLR : similarity between left and right
SLRq = zeros(numNormel,1);
SLRp = zeros(numAbnor,1);

% Normal hearts
SLRq(5) = ComputeAreaLR(nor5);  SLRq(6) = ComputeAreaLR(nor6);
SLRq(7) = ComputeAreaLR(nor7);  SLRq(8) = ComputeAreaLR(nor8);
SLRq(9) = ComputeAreaLR(nor9);  SLRq(10) = ComputeAreaLR(nor10);
SLRq(12) = ComputeAreaLR(nor12);SLRq(13) = ComputeAreaLR(nor13);SLRq(14) = ComputeAreaLR(nor14);
SLRq(15) = ComputeAreaLR(nor15);SLRq(16) = ComputeAreaLR(nor16);SLRq(17) = ComputeAreaLR(nor17);
SLRq(18) = ComputeAreaLR(nor18);SLRq(19) = ComputeAreaLR(nor19);
SLRq(20) = ComputeAreaLR(nor20);SLRq(22) = ComputeAreaLR(nor22);SLRq(23) = ComputeAreaLR(nor23);
SLRq(24) = ComputeAreaLR(nor24);SLRq(25) = ComputeAreaLR(nor25);
SLRq(26) = ComputeAreaLR(nor26);SLRq(28) = ComputeAreaLR(nor28);SLRq(29) = ComputeAreaLR(nor29);
SLRq(36) = ComputeAreaLR(nor36);SLRq(37) = ComputeAreaLR(nor37);SLRq(38) = ComputeAreaLR(nor38);
SLRq(40) = ComputeAreaLR(nor40);SLRq(42) = ComputeAreaLR(nor42);
SLRq(43) = ComputeAreaLR(nor43);SLRq(44) = ComputeAreaLR(nor44);
SLRq(46) = ComputeAreaLR(nor46);SLRq(48) = ComputeAreaLR(nor48);
SLRq(50) = ComputeAreaLR(nor50);SLRq(53) = ComputeAreaLR(nor53);SLRq(54) = ComputeAreaLR(nor54);
SLRq(55) = ComputeAreaLR(nor55);

% Abnormal hearts
SLRp(1) = ComputeAreaLR(abnor1);  SLRp(2) = ComputeAreaLR(abnor2);
SLRp(5) = ComputeAreaLR(abnor5);  SLRp(6) = ComputeAreaLR(abnor6);
SLRp(7) = ComputeAreaLR(abnor7);  SLRp(8) = ComputeAreaLR(abnor8);
SLRp(9) = ComputeAreaLR(abnor9);  SLRp(10) = ComputeAreaLR(abnor10);SLRp(11) = ComputeAreaLR(abnor11);
SLRp(13) = ComputeAreaLR(abnor13);SLRp(14) = ComputeAreaLR(abnor14);
SLRp(15) = ComputeAreaLR(abnor15);SLRp(16) = ComputeAreaLR(abnor16);
SLRp(18) = ComputeAreaLR(abnor18);SLRp(19) = ComputeAreaLR(abnor19);
SLRp(20) = ComputeAreaLR(abnor20);SLRp(21) = ComputeAreaLR(abnor21);
SLRp(22) = ComputeAreaLR(abnor22);SLRp(23) = ComputeAreaLR(abnor23);
SLRp(25) = ComputeAreaLR(abnor25);SLRp(26) = ComputeAreaLR(abnor26);
SLRp(28) = ComputeAreaLR(abnor28);SLRp(30) = ComputeAreaLR(abnor30);
SLRp(31) = ComputeAreaLR(abnor31);SLRp(32) = ComputeAreaLR(abnor32);SLRp(34) = ComputeAreaLR(abnor34);
SLRp(35) = ComputeAreaLR(abnor35);SLRp(37) = ComputeAreaLR(abnor37);
SLRp(38) = ComputeAreaLR(abnor38);


%% The curvature feature
% CC: curvature change
CCq = zeros(numNormel,1);
CCp = zeros(numAbnor,1);

% Normal hearts
CCq(5) = ComputeCurvature(nor5);  CCq(6) = ComputeCurvature(nor6);
CCq(7) = ComputeCurvature(nor7);  CCq(8) = ComputeCurvature(nor8);
CCq(9) = ComputeCurvature(nor9);  CCq(10) = ComputeCurvature(nor10);
CCq(12) = ComputeCurvature(nor12);CCq(13) = ComputeCurvature(nor13);CCq(14) = ComputeCurvature(nor14);
CCq(15) = ComputeCurvature(nor15);CCq(16) = ComputeCurvature(nor16);CCq(17) = ComputeCurvature(nor17);
CCq(18) = ComputeCurvature(nor18);CCq(19) = ComputeCurvature(nor19);
CCq(20) = ComputeCurvature(nor20);CCq(22) = ComputeCurvature(nor22);CCq(23) = ComputeCurvature(nor23);
CCq(24) = ComputeCurvature(nor24);CCq(25) = ComputeCurvature(nor25);
CCq(26) = ComputeCurvature(nor26);CCq(28) = ComputeCurvature(nor28);CCq(29) = ComputeCurvature(nor29);
CCq(36) = ComputeCurvature(nor36);CCq(37) = ComputeCurvature(nor37);CCq(38) = ComputeCurvature(nor38);
CCq(40) = ComputeCurvature(nor40);CCq(42) = ComputeCurvature(nor42);
CCq(43) = ComputeCurvature(nor43);CCq(44) = ComputeCurvature(nor44);
CCq(46) = ComputeCurvature(nor46);CCq(48) = ComputeCurvature(nor48);
CCq(50) = ComputeCurvature(nor50);CCq(53) = ComputeCurvature(nor53);CCq(54) = ComputeCurvature(nor54);
CCq(55) = ComputeCurvature(nor55);

% Abnormal hearts
CCp(1) = ComputeCurvature(abnor1);  CCp(2) = ComputeCurvature(abnor2);
CCp(5) = ComputeCurvature(abnor5);  CCp(6) = ComputeCurvature(abnor6);
CCp(7) = ComputeCurvature(abnor7);  CCp(8) = ComputeCurvature(abnor8);
CCp(9) = ComputeCurvature(abnor9);  CCp(10) = ComputeCurvature(abnor10);CCp(11) = ComputeCurvature(abnor11);
CCp(13) = ComputeCurvature(abnor13);CCp(14) = ComputeCurvature(abnor14);
CCp(15) = ComputeCurvature(abnor15);CCp(16) = ComputeCurvature(abnor16);
CCp(18) = ComputeCurvature(abnor18);CCp(19) = ComputeCurvature(abnor19);
CCp(20) = ComputeCurvature(abnor20);CCp(21) = ComputeCurvature(abnor21);
CCp(22) = ComputeCurvature(abnor22);CCp(23) = ComputeCurvature(abnor23);
CCp(25) = ComputeCurvature(abnor25);CCp(26) = ComputeCurvature(abnor26);
CCp(28) = ComputeCurvature(abnor28);CCp(30) = ComputeCurvature(abnor30);
CCp(31) = ComputeCurvature(abnor31);CCp(32) = ComputeCurvature(abnor32);CCp(34) = ComputeCurvature(abnor34);
CCp(35) = ComputeCurvature(abnor35);CCp(37) = ComputeCurvature(abnor37);
CCp(38) = ComputeCurvature(abnor38);


%% 3-D classification
% figure;
% plot3(IUAq, UEAq, UEVq, 'o', 'color', 'b');
% title('Heart distribution in 3-D space', 'FontSize', 20);
% h = xlabel('IUA');
% set(h, 'FontSize', 18);
% h = ylabel('UEA');
% set(h, 'FontSize', 18);
% h = zlabel('UEV');
% set(h, 'FontSize', 18);
% hold on
% plot3(IUAp, UEAp, UEVp, '*', 'color', 'r');
% hold off
% legend('Normal heart', 'Abnormal heart');

%% Training and Cross Validation
% By GUO Qiang 27/05/2016 at ENS

% not good: normal 20 24 42  abnormal 5 23 28 35
normalqueue =   [5 6 7 8 9 10 12 13 14 15 16 17 18 19 20 22 23 24 25 26 28 29 36 37 38 40 42 43 44 46 48 50 53 54 55];
abnormalqueue = [1 2 5 6 7 8 9 10 11 13 14 15 16 18 19 20 21 22 23 25 26 28 30 31 32 34 35 37 38];
xdataq = [ACAq(normalqueue) ...
          ACDq(normalqueue) ...
          BMRq(normalqueue) ...
          SLRq(normalqueue) ...
           CCq(normalqueue) ...
          ];
xdatap = [ACAp(abnormalqueue) ...
          ACDp(abnormalqueue) ...
          BMRp(abnormalqueue) ...
          SLRp(abnormalqueue) ...
           CCp(abnormalqueue) ...
          ];
xdata = [xdataq; xdatap];
ydata = [ones(size(normalqueue,2),1);zeros(size(abnormalqueue,2),1)];
% Feature value normalization
% xdata(:,1) = (xdata(:,1)-min(xdata(:,1)))/(max(xdata(:,1))-min(xdata(:,1)));
% xdata(:,2) = (xdata(:,2)-min(xdata(:,2)))/(max(xdata(:,2))-min(xdata(:,2)));
% xdata(:,3) = (xdata(:,3)-min(xdata(:,3)))/(max(xdata(:,3))-min(xdata(:,3)));
% xdata(:,4) = (xdata(:,4)-min(xdata(:,4)))/(max(xdata(:,4))-min(xdata(:,4)));
% xdata(:,5) = (xdata(:,5)-min(xdata(:,5)))/(max(xdata(:,5))-min(xdata(:,5)));

m1 = size(normalqueue,2);
m2 = size(normalqueue,2) + size(abnormalqueue,2);

figure;
plot3(xdata(1:m1,1), xdata(1:m1,2), xdata(1:m1,5), 'o', 'color', 'b');
title('Heart distribution in 3-D space', 'FontSize', 20);
h = xlabel('ACA');
set(h, 'FontSize', 18);
h = ylabel('ACD');
set(h, 'FontSize', 18);
h = zlabel('CC');
set(h, 'FontSize', 18);
hold on
plot3(xdata((m1+1:m2),1), xdata((m1+1):m2,2), xdata((m1+1):m2,5), '*', 'color', 'r');
hold off
legend('Normal heart', 'Abnormal heart');

figure;
% This function would be replaced in further release of Matlab
svmStruct = svmtrain(xdata(:,[1 5]),ydata, 'kernel_function','polynomial','polyorder',2,'ShowPlot',true);

% K-fold cross validation
k=10;
cvFolds = crossvalind('Kfold', ydata, k);
cp = classperf(ydata);
for i=1:k
    testIdx = (cvFolds == i);
    trainIdx = ~testIdx;
    
    svmModel = svmtrain(xdata(trainIdx,[1 2 3 4 5]),ydata(trainIdx,:), 'kernel_function','polynomial','polyorder',1,'ShowPlot',false);
    %svmModel = svmtrain(xdata(trainIdx,:),ydata(trainIdx,:), 'ShowPlot',false);
    pred = svmclassify(svmModel, xdata(testIdx,[1 2 3 4 5]), 'Showplot',false);
    cp = classperf(cp, pred, testIdx);
end


% species = svmclassify(svmStruct,Xnew,'ShowPlot',true)
% hold on;
% plot(Xnew(:,1),Xnew(:,2),'ro','MarkerSize',12);
% hold off


