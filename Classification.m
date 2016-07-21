% Training and Classification
% By GUO Qiang 25/05/2016 at ENS
clear all; close all;

% Load data
load('data.mat');

% Number of samples
numNormel = 55;
numAbnor  = 38;

%% Normal hearts
IUAq = zeros(1, numNormel);
IUDq = IUAq;
[IUAq(5), IUDq(5)] = ComputeArea(nor5);   [IUAq(6), IUDq(6)] = ComputeArea(nor6);
[IUAq(7), IUDq(7)] = ComputeArea(nor7);   [IUAq(8), IUDq(8)] = ComputeArea(nor8);
[IUAq(9), IUDq(9)] = ComputeArea(nor9);   [IUAq(10), IUDq(10)] = ComputeArea(nor10);
[IUAq(12), IUDq(12)] = ComputeArea(nor12);[IUAq(13), IUDq(13)] = ComputeArea(nor13);
[IUAq(15), IUDq(15)] = ComputeArea(nor15);[IUAq(17), IUDq(17)] = ComputeArea(nor17);
[IUAq(18), IUDq(18)] = ComputeArea(nor18);[IUAq(19), IUDq(19)] = ComputeArea(nor19);
[IUAq(20), IUDq(20)] = ComputeArea(nor20);[IUAq(23), IUDq(23)] = ComputeArea(nor23);
[IUAq(24), IUDq(24)] = ComputeArea(nor24);[IUAq(25), IUDq(25)] = ComputeArea(nor25);
[IUAq(26), IUDq(26)] = ComputeArea(nor26);[IUAq(29), IUDq(29)] = ComputeArea(nor29);
[IUAq(36), IUDq(36)] = ComputeArea(nor36);[IUAq(42), IUDq(42)] = ComputeArea(nor42);
[IUAq(43), IUDq(43)] = ComputeArea(nor43);[IUAq(44), IUDq(44)] = ComputeArea(nor44);
[IUAq(46), IUDq(46)] = ComputeArea(nor46);[IUAq(48), IUDq(48)] = ComputeArea(nor48);
[IUAq(50), IUDq(50)] = ComputeArea(nor50);[IUAq(53), IUDq(53)] = ComputeArea(nor53);
[IUAq(55), IUDq(55)] = ComputeArea(nor55);

% Abnormal heart
IUAp = zeros(1, numAbnor);
IUDp = IUAp;
[IUAp(1), IUDp(1)] = ComputeArea(abnor1);   [IUAp(2), IUDp(2)] = ComputeArea(abnor2);
[IUAp(5), IUDp(5)] = ComputeArea(abnor5);   [IUAp(6), IUDp(6)] = ComputeArea(abnor6);
[IUAp(7), IUDp(7)] = ComputeArea(abnor7);   [IUAp(8), IUDp(8)] = ComputeArea(abnor8);
[IUAp(9), IUDp(9)] = ComputeArea(abnor9);   [IUAp(10), IUDp(10)] = ComputeArea(abnor10);
[IUAp(13), IUDp(13)] = ComputeArea(abnor13);[IUAp(14), IUDp(14)] = ComputeArea(abnor14);
[IUAp(15), IUDp(15)] = ComputeArea(abnor15);[IUAp(16), IUDp(16)] = ComputeArea(abnor16);
[IUAp(18), IUDp(18)] = ComputeArea(abnor18);[IUAp(19), IUDp(19)] = ComputeArea(abnor19);
[IUAp(20), IUDp(20)] = ComputeArea(abnor20);[IUAp(21), IUDp(21)] = ComputeArea(abnor21);
[IUAp(22), IUDp(22)] = ComputeArea(abnor22);[IUAp(23), IUDp(23)] = ComputeArea(abnor23);
[IUAp(25), IUDp(25)] = ComputeArea(abnor25);[IUAp(26), IUDp(26)] = ComputeArea(abnor26);
[IUAp(28), IUDp(28)] = ComputeArea(abnor28);[IUAp(30), IUDp(30)] = ComputeArea(abnor30);
[IUAp(31), IUDp(31)] = ComputeArea(abnor31);[IUAp(34), IUDp(34)] = ComputeArea(abnor34);
[IUAp(35), IUDp(35)] = ComputeArea(abnor35);[IUAp(37), IUDp(37)] = ComputeArea(abnor37);
[IUAp(38), IUDp(38)] = ComputeArea(abnor38);


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

%% Barycenter added

% Compute the barycenter
UEAq = zeros(1,numNormel);
UEVq = UEAq;
UESq = UEAq;
UEAp = zeros(1,numAbnor);
UEVp = UEAp;
UESp = UEAp;

% Normal hearts
[UEAq(5), UEVq(5), UESq(5)] = ComputeMotionBarycenter(nor5);
[UEAq(6), UEVq(6), UESq(6)] = ComputeMotionBarycenter(nor6);
[UEAq(7), UEVq(7), UESq(7)] = ComputeMotionBarycenter(nor7);
[UEAq(8), UEVq(8), UESq(8)] = ComputeMotionBarycenter(nor8);
[UEAq(9), UEVq(9), UESq(9)] = ComputeMotionBarycenter(nor9);
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
[UEAq(29), UEVq(29), UESq(29)] = ComputeMotionBarycenter(nor29);
[UEAq(36), UEVq(36), UESq(36)] = ComputeMotionBarycenter(nor36);
[UEAq(42), UEVq(42), UESq(42)] = ComputeMotionBarycenter(nor42);
[UEAq(43), UEVq(43), UESq(43)] = ComputeMotionBarycenter(nor43);
[UEAq(44), UEVq(44), UESq(44)] = ComputeMotionBarycenter(nor44);
[UEAq(46), UEVq(46), UESq(46)] = ComputeMotionBarycenter(nor46);
[UEAq(48), UEVq(48), UESq(48)] = ComputeMotionBarycenter(nor48);
[UEAq(50), UEVq(50), UESq(50)] = ComputeMotionBarycenter(nor50);
[UEAq(53), UEVq(53), UESq(53)] = ComputeMotionBarycenter(nor53);
[UEAq(55), UEVq(55), UESq(55)] = ComputeMotionBarycenter(nor55);

% Abnormal hearts
[UEAp(1), UEVp(1), UESp(1)] = ComputeMotionBarycenter(abnor1);
[UEAp(2), UEVp(2), UESp(2)] = ComputeMotionBarycenter(abnor2);
[UEAp(5), UEVp(5), UESp(5)] = ComputeMotionBarycenter(abnor5);
[UEAp(6), UEVp(6), UESp(6)] = ComputeMotionBarycenter(abnor6);
[UEAp(7), UEVp(7), UESp(7)] = ComputeMotionBarycenter(abnor7);
[UEAp(8), UEVp(8), UESp(8)] = ComputeMotionBarycenter(abnor8);
[UEAp(9), UEVp(9), UESp(9)] = ComputeMotionBarycenter(abnor9);
[UEAp(10), UEVp(10), UESp(10)] = ComputeMotionBarycenter(abnor10);
[UEAp(13), UEVp(13), UESp(13)] = ComputeMotionBarycenter(abnor13);
[UEAp(14), UEVp(14), UESp(14)] = ComputeMotionBarycenter(abnor14);
[UEAp(15), UEVp(15), UESp(15)] = ComputeMotionBarycenter(abnor15);
[UEAp(16), UEVp(16), UESp(16)] = ComputeMotionBarycenter(abnor16);
[UEAp(18), UEVp(18), UESp(18)] = ComputeMotionBarycenter(abnor18);
[UEAp(19), UEVp(19), UESp(19)] = ComputeMotionBarycenter(abnor19);
[UEAp(20), UEVp(20), UESp(20)] = ComputeMotionBarycenter(abnor20);
[UEAp(21), UEVp(21), UESp(21)] = ComputeMotionBarycenter(abnor21);
[UEAp(22), UEVp(22), UESp(22)] = ComputeMotionBarycenter(abnor22);
[UEAp(23), UEVp(23), UESp(23)] = ComputeMotionBarycenter(abnor23);
[UEAp(25), UEVp(25), UESp(25)] = ComputeMotionBarycenter(abnor25);
[UEAp(26), UEVp(26), UESp(26)] = ComputeMotionBarycenter(abnor26);
[UEAp(28), UEVp(28), UESp(28)] = ComputeMotionBarycenter(abnor28);
[UEAp(30), UEVp(30), UESp(30)] = ComputeMotionBarycenter(abnor30);
[UEAp(31), UEVp(31), UESp(31)] = ComputeMotionBarycenter(abnor31);
[UEAp(34), UEVp(34), UESp(34)] = ComputeMotionBarycenter(abnor34);
[UEAp(35), UEVp(35), UESp(35)] = ComputeMotionBarycenter(abnor35);
[UEAp(37), UEVp(37), UESp(37)] = ComputeMotionBarycenter(abnor37);
[UEAp(38), UEVp(38), UESp(38)] = ComputeMotionBarycenter(abnor38);

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
SMLq = zeros(1,numNormel);
SMLp = zeros(1,numAbnor);

SMLq(5) = ComputeAreaLR(nor5); SMLq(6) = ComputeAreaLR(nor6);
SMLq(7) = ComputeAreaLR(nor7); SMLq(8) = ComputeAreaLR(nor8);
SMLq(9) = ComputeAreaLR(nor9); SMLq(10) = ComputeAreaLR(nor10);
SMLq(12) = ComputeAreaLR(nor12);SMLq(13) = ComputeAreaLR(nor13);
SMLq(15) = ComputeAreaLR(nor15);SMLq(17) = ComputeAreaLR(nor17);
SMLq(18) = ComputeAreaLR(nor18);SMLq(19) = ComputeAreaLR(nor19);
SMLq(20) = ComputeAreaLR(nor20);SMLq(23) = ComputeAreaLR(nor23);
SMLq(24) = ComputeAreaLR(nor24);SMLq(25) = ComputeAreaLR(nor25);
SMLq(26) = ComputeAreaLR(nor26);SMLq(29) = ComputeAreaLR(nor29);
SMLq(36) = ComputeAreaLR(nor36);SMLq(42) = ComputeAreaLR(nor42);
SMLq(43) = ComputeAreaLR(nor43);SMLq(44) = ComputeAreaLR(nor44);
SMLq(46) = ComputeAreaLR(nor46);SMLq(48) = ComputeAreaLR(nor48);
SMLq(50) = ComputeAreaLR(nor50);SMLq(53) = ComputeAreaLR(nor53);
SMLq(55) = ComputeAreaLR(nor55);

SMLp(1) = ComputeAreaLR(abnor1); SMLp(2) = ComputeAreaLR(abnor2);
SMLp(5) = ComputeAreaLR(abnor5); SMLp(6) = ComputeAreaLR(abnor6);
SMLp(7) = ComputeAreaLR(abnor7); SMLp(8) = ComputeAreaLR(abnor8);
SMLp(9) = ComputeAreaLR(abnor9); SMLp(10) = ComputeAreaLR(abnor10);
SMLp(13) = ComputeAreaLR(abnor13);SMLp(14) = ComputeAreaLR(abnor14);
SMLp(15) = ComputeAreaLR(abnor15);SMLp(16) = ComputeAreaLR(abnor16);
SMLp(18) = ComputeAreaLR(abnor18);SMLp(19) = ComputeAreaLR(abnor19);
SMLp(20) = ComputeAreaLR(abnor20);SMLp(21) = ComputeAreaLR(abnor21);
SMLp(22) = ComputeAreaLR(abnor22);SMLp(23) = ComputeAreaLR(abnor23);
SMLp(25) = ComputeAreaLR(abnor25);SMLp(26) = ComputeAreaLR(abnor26);
SMLp(28) = ComputeAreaLR(abnor28);SMLp(30) = ComputeAreaLR(abnor30);
SMLp(31) = ComputeAreaLR(abnor31);SMLp(34) = ComputeAreaLR(abnor34);
SMLp(35) = ComputeAreaLR(abnor35);SMLp(37) = ComputeAreaLR(abnor37);
SMLp(38) = ComputeAreaLR(abnor38);



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
xdata = [IUAq(5) IUDq(5) UEAq(5) UEVq(5) SMLq(5); IUAq(6) IUDq(6) UEAq(6) UEVq(6) SMLq(6);IUAq(7) IUDq(7) UEAq(7) UEVq(7) SMLq(7);
    IUAq(8) IUDq(8) UEAq(8) UEVq(8) SMLq(8); IUAq(9) IUDq(9) UEAq(9) UEVq(9) SMLq(9); IUAq(10) IUDq(10) UEAq(10) UEVq(10) SMLq(10);
    IUAq(12) IUDq(12) UEAq(12) UEVq(12) SMLq(12); IUAq(13) IUDq(13) UEAq(13) UEVq(13) SMLq(13); IUAq(15) IUDq(15) UEAq(15) UEVq(15) SMLq(15);
    IUAq(17) IUDq(17) UEAq(17) UEVq(17) SMLq(17); IUAq(18) IUDq(18) UEAq(18) UEVq(18) SMLq(18); IUAq(19) IUDq(19) UEAq(19) UEVq(19) SMLq(19);
    %IUAq(20) IUDq(20) UEAq(20) UEVq(20) SMLq(20); 
    IUAq(23) IUDq(23) UEAq(23) UEVq(23) SMLq(23); %IUAq(24) IUDq(24) UEAq(24) UEVq(24) SMLq(24); 
    IUAq(25) IUDq(25) UEAq(25) UEVq(25) SMLq(25); IUAq(26) IUDq(26) UEAq(26) UEVq(26) SMLq(26); IUAq(29) IUDq(29) UEAq(29) UEVq(29) SMLq(29); 
    IUAq(36) IUDq(36) UEAq(36) UEVq(36) SMLq(36); %IUAq(42) IUDq(42) UEAq(42) UEVq(42) SMLq(42); 
    IUAq(43) IUDq(43) UEAq(43) UEVq(43) SMLq(43); 
    IUAq(44) IUDq(44) UEAq(44) UEVq(44) SMLq(44); IUAq(46) IUDq(46) UEAq(46) UEVq(46) SMLq(46); IUAq(48) IUDq(48) UEAq(48) UEVq(48) SMLq(48); 
    IUAq(50) IUDq(50) UEAq(50) UEVq(50) SMLq(50); IUAq(53) IUDq(53) UEAq(53) UEVq(53) SMLq(53); IUAq(55) IUDq(55) UEAq(55) UEVq(55) SMLq(55); 
    IUAp(1) IUDp(1) UEAp(1) UEVp(1) SMLp(1); IUAp(2) IUDp(2) UEAp(2) UEVp(2) SMLp(2); %IUAp(5) IUDp(5) UEAp(5) UEVp(5) SMLp(5);
    IUAp(6) IUDp(6) UEAp(6) UEVp(6) SMLp(6); IUAp(7) IUDp(7) UEAp(7) UEVp(7) SMLp(7); IUAp(8) IUDp(8) UEAp(8) UEVp(8) SMLp(8);
    IUAp(9) IUDp(9) UEAp(9) UEVp(9) SMLp(9); IUAp(10) IUDp(10) UEAp(10) UEVp(10) SMLp(10); IUAp(13) IUDp(13) UEAp(13) UEVp(13) SMLp(13);
    IUAp(14) IUDp(14) UEAp(14) UEVp(14) SMLp(14); IUAp(15) IUDp(15) UEAp(15) UEVp(15) SMLp(15); IUAp(16) IUDp(16) UEAp(16) UEVp(16) SMLp(16);
    IUAp(18) IUDp(18) UEAp(18) UEVp(18) SMLp(18); IUAp(19) IUDp(19) UEAp(19) UEVp(19) SMLp(19); IUAp(20) IUDp(20) UEAp(20) UEVp(20) SMLp(20);
    IUAp(21) IUDp(21) UEAp(21) UEVp(21) SMLp(21); IUAp(22) IUDp(22) UEAp(22) UEVp(22) SMLp(22); %IUAp(23) IUDp(23) UEAp(23) UEVp(23) SMLp(23);
    IUAp(25) IUDp(25) UEAp(25) UEVp(25) SMLp(25); IUAp(26) IUDp(26) UEAp(26) UEVp(26) SMLp(26); %IUAp(28) IUDp(28) UEAp(28) UEVp(28) SMLp(28);
    IUAp(30) IUDp(30) UEAp(30) UEVp(30) SMLp(30); IUAp(31) IUDp(31) UEAp(31) UEVp(31) SMLp(31); IUAp(34) IUDp(34) UEAp(34) UEVp(34) SMLp(34);
    %IUAp(35) IUDp(35) UEAp(35) UEVp(35) SMLp(35); 
    IUAp(37) IUDp(37) UEAp(37) UEVp(37) SMLp(37); IUAp(38) IUDp(38) UEAp(38) UEVp(38) SMLp(38);];
ydata = [1 1 1 1 1 1 1 1 1 ...
         1 1 1 1 1 1 1 1 1 ...
         1 1 1 1 1 1 ...
         0 0 0 0 0 0 0 0 0 ...
         0 0 0 0 0 0 0 0 0 ...
         0 0 0 0 0]';
% Feature value normalization
% xdata(:,1) = (xdata(:,1)-min(xdata(:,1)))/(max(xdata(:,1))-min(xdata(:,1)));
% xdata(:,2) = (xdata(:,2)-min(xdata(:,2)))/(max(xdata(:,2))-min(xdata(:,2)));
% xdata(:,3) = (xdata(:,3)-min(xdata(:,3)))/(max(xdata(:,3))-min(xdata(:,3)));
% xdata(:,4) = (xdata(:,4)-min(xdata(:,4)))/(max(xdata(:,4))-min(xdata(:,4)));

m1 = 24;
m2 = 47;

figure;
plot3(xdata(1:m1,1), xdata(1:m1,2), xdata(1:m1,5), 'o', 'color', 'b');
title('Heart distribution in 3-D space', 'FontSize', 20);
h = xlabel('IUA');
set(h, 'FontSize', 18);
h = ylabel('IUD');
set(h, 'FontSize', 18);
h = zlabel('LRAS');
set(h, 'FontSize', 18);
hold on
plot3(xdata((m1+1:m2),1), xdata((m1+1):m2,2), xdata((m1+1):m2,5), '*', 'color', 'r');
hold off
legend('Normal heart', 'Abnormal heart');

 figure;
% % This function would be replaced in further release of Matlab
 svmStruct = svmtrain(xdata(:,[1 2]),ydata, 'kernel_function','polynomial','polyorder',1,'ShowPlot',true);

% Cross Validation
% K-fold cross validation
k=10;
cvFolds = crossvalind('Kfold', ydata, k);
cp = classperf(ydata);
for i=1:k
    testIdx = (cvFolds == i);
    trainIdx = ~testIdx;
    
    svmModel = svmtrain(xdata(trainIdx,[1 2 3 5]),ydata(trainIdx,:), 'kernel_function','polynomial','polyorder',1,'ShowPlot',false);
    %svmModel = svmtrain(xdata(trainIdx,:),ydata(trainIdx,:), 'ShowPlot',false);
    pred = svmclassify(svmModel, xdata(testIdx,[1 2 3 5]), 'Showplot',false);
    cp = classperf(cp, pred, testIdx);
end


% species = svmclassify(svmStruct,Xnew,'ShowPlot',true)
% hold on;
% plot(Xnew(:,1),Xnew(:,2),'ro','MarkerSize',12);
% hold off


