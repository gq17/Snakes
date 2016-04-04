function [DistArrayC, DistSum] = ComputeDistCentral(P)
% This function compute the distance change betwen points and the center of the
% contour

% DistArray = ComputeDistCentral(P)

% Input&Output
% P: the contour set
% DistArrayC: the distance array

% By GUO Qiang 29/03/2016 at ENS 

% Average center of the contour
cx = mean(mean(P(:,1,:)));
cy = mean(mean(P(:,2,:)));

% Distance between points and the center
DistArray = sqrt((P(:,1,:) - cx).^2 + (P(:,2,:) - cy).^2);

DistArray = squeeze(DistArray);

DistArrayC = DistArray(:,2:size(DistArray,2)) - DistArray(:,1:size(DistArray,2)-1);

% sum of the distance
DistSum = sum(abs(DistArrayC));
DistSum2 = sum((DistArrayC).^2);

% Show the results
figure;
for i=1:(size(DistArray,2)-1)
    plot(DistArrayC(:,i));
    %ylim([min(min(DistArray))*0.8 max(max(DistArray))*1.2]);
    title(['Central distance change distribution of time: ', num2str(i)]);
    pause(1);
end
