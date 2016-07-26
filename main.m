% classify automatically
clear all, close all;

%% Get the contour


%% Training and Validaion

% Load data
load heartdata.mat

% Heart sequence
nseq = [5 6 7 8 9 10 12 13 14 15 16 17 18 19 20 22 23 24 25 26 28 29 36 37 38 40 42 43 44 46 48 50 53 54 55];
aseq = [1 2 5 6 7 8 9 10 11 13 14 15 16 18 19 20 21 22 23 25 26 28 30 31 32 34 35 37 38];

ntotal = size(nheart,1);
atotal = size(aheart,1);

nseqnum = size(nseq,2);
aseqnum = size(aseq,2);

xdatan = zeros(nseqnum, 5);
xdataa = zeros(aseqnum, 5);

for i=1:nseqnum
    [xdatan(i,1), xdatan(i,2)] = ComputeArea(nheart{nseq(i)}); 
    xdatan(i,3) = ComputeMotionBarycenter(nheart{nseq(i)});
    xdatan(i,4) = ComputeAreaLR(nheart{nseq(i)});
    xdatan(i,5) = ComputeCurvature(nheart{nseq(i)});
end

for i=1:aseqnum
    [xdataa(i,1), xdataa(i,2)] = ComputeArea(aheart{aseq(i)}); 
    xdataa(i,3) = ComputeMotionBarycenter(aheart{aseq(i)});
    xdataa(i,4) = ComputeAreaLR(aheart{aseq(i)});
    xdataa(i,5) = ComputeCurvature(aheart{aseq(i)});
end

xdata = [xdatan; xdataa];
ydata = [ones(nseqnum,1);zeros(aseqnum,1)];

% Show results

m2 = nseqnum + aseqnum;
figure;
plot3(xdata(1:nseqnum,1), xdata(1:nseqnum,2), xdata(1:nseqnum,5), 'o', 'color', 'b');
title('Heart distribution in 3-D space', 'FontSize', 20);
h = xlabel('ACA');
set(h, 'FontSize', 18);
h = ylabel('ACD');
set(h, 'FontSize', 18);
h = zlabel('CC');
set(h, 'FontSize', 18);
hold on
plot3(xdata((nseqnum+1):m2,1), xdata((nseqnum+1):m2,2), xdata((nseqnum+1):m2,5), '*', 'color', 'r');
hold off
legend('Normal heart', 'Abnormal heart');

figure;
% % This function would be replaced in further release of Matlab
 svmStruct = svmtrain(xdata(:,[1 5]),ydata, 'kernel_function','polynomial','polyorder',1,'ShowPlot',true);


% K-fold cross validation
k=10;
cvFolds = crossvalind('Kfold', ydata, k);
cp = classperf(ydata);
for i=1:k
    testIdx = (cvFolds == i);
    trainIdx = ~testIdx;
    
    svmModel = svmtrain(xdata(trainIdx,[1 2 3 4 5]),ydata(trainIdx,:), 'kernel_function','polynomial','polyorder',1,'ShowPlot',false);
    pred = svmclassify(svmModel, xdata(testIdx,[1 2 3 4 5]), 'Showplot',false);
    cp = classperf(cp, pred, testIdx);
end

