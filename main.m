% This is the main.m for the project.
clear all, close all;

% There are three steps separately
%    collecting data
%    training the model,
%    application for new data.


%% collecting data
% collecting means running the active contour models on the heart videos to
% get the contour change. contour.m is an example showing the process with
% many intermediate results.
% An alternative is to use the GetTour function. This will return the
% contour.
% The two ways could get the contour change of individual heart video.
% The data is stored in the heartdata.mat file located in the parent
% directory.


%% Training and Validation
% This part do the training process. It could be run directly to see the
% results.

% Load data. This file stores the contour change for each heart, both
% normal and abnormal.
load('../heartdata.mat');

% Heart sequence. the number represents the heart video number which are
% chosen. 5 means the fifth video is chosen. Those video are stored in the
% "data" folder in the parent directory. 
% The data folder contains two subfolders, respectively the normal and
% abnormal hearts.
% To add more data, just add its sequence number in the array
nseq = [5 6 7 8 9 10 12 13 14 15 16 17 18 19 20 22 23 24 25 26 28 29 36 37 38 40 42 43 44 46 48 50 53 54 55];
aseq = [1 2 5 6 7 8 9 10 11 13 14 15 16 18 19 20 21 22 23 25 26 28 30 31 32 34 35 37 38];

% 'nheart' stores the data for normal hearts, 'aheart' for abnormal hearts.
ntotal = size(nheart,1);
atotal = size(aheart,1);

nseqnum = size(nseq,2);
aseqnum = size(aseq,2);

xdatan = zeros(nseqnum, 5);
xdataa = zeros(aseqnum, 5);

% Extract the features
% Those functions are introduced in their source files
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

% store the feature data
xdata = [xdatan; xdataa];
ydata = [ones(nseqnum,1);zeros(aseqnum,1)];


% This section of code show a 3-dimension distribution of hearts. The
% features could be chosen.
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


% The function shows the support vector machine classification in two
% dimensions
% This function would be replaced in further release of Matlab

figure;
svmStruct = svmtrain(xdata(:,[1 5]),ydata, 'boxconstraint', 200, 'kernel_function','polynomial','polyorder', 3,'ShowPlot',true);
%svmStruct = svmtrain(xdata(:,[1 5]),ydata, 'boxconstraint', 200, 'ShowPlot',true);


% K-fold cross validation
k=10;
cvFolds = crossvalind('Kfold', ydata, k);
cp = classperf(ydata);
for i=1:k
    testIdx = (cvFolds == i);
    trainIdx = ~testIdx;
    
    % the svmtrain function is replaced by other function in the newest
    % version of matlab
    
    %svmModel = svmtrain(xdata(trainIdx,[1 2  5]),ydata(trainIdx,:), 'kernel_function','rbf','rbf_sigma', 0.5,'ShowPlot',false);
    svmModel = svmtrain(xdata(trainIdx,[1 2 3 4 5]),ydata(trainIdx,:), 'kernel_function', 'polynomial','polyorder', 1,'ShowPlot',false);
    %svmModel = svmtrain(xdata(trainIdx,[1 2 3 4 5]),ydata(trainIdx,:),'ShowPlot',false);
    pred = svmclassify(svmModel, xdata(testIdx,[1 2 3 4 5]), 'Showplot',false);
    cp = classperf(cp, pred, testIdx);
end


%% application for new data.

% get the parameters for the test heart video
testcontour = GetContour('../testdata/test.avi');
testdata = zeros(1,5);
[testdata(1), testdata(2)] = ComputeArea(testcontour); 
testdata(3) = ComputeMotionBarycenter(testcontour);
testdata(4) = ComputeAreaLR(testcontour);
testdata(5) = ComputeCurvature(testcontour);

% find the its k-neareat neighbors
nb=5;
IDx = knnsearch(xdata, testdata,'K',nb);

% check whether the normal neighbors are more then abnormal neighbors
% if so, consider it's normal, otherwise abnormal
heartsign = (sum(IDx<nseqnum)>size(IDx,2)/2);



% validate for the dataset
j=0;
nb=5;
for i=1:(nseqnum + aseqnum)
    IDx = knnsearch(xdata, xdata(i,:),'K',nb);
    heartsign = (sum(IDx<nseqnum)>size(IDx,2)/2);
    if(heartsign==1 && i<36)
        j=j+1;
    end
    if(heartsign==0 && i>=36)
        j=j+1;
    end
end

% compute the correct rate
correct_rate = j/(nseqnum + aseqnum);






