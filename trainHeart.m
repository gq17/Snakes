function w = trainHeart(data, m, n)
%  This function trains the data we got before to get the parameters for
%  the classifier

% w = trainHeart(data, m, n)

% Input 
% data: training data (X1,X2,..., Y1,Y2,...)
% m: dimension of the input data X
% n: dimension of the output data Y

% Output
% w: parameters of the classifier

% By GUO Qiang 27/05/2016 at ENS

xdata = data(:,1:m);
ydata = data(:,m+1:m+n);
figure;
svmStruct = svmtrain(xdata,ydata,'ShowPlot',true);


% 
Xnew = [5 2; 4 1.5];
species = svmclassify(svmStruct,Xnew,'ShowPlot',true)
hold on;
plot(Xnew(:,1),Xnew(:,2),'ro','MarkerSize',12);
hold off
