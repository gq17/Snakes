function CorrArray = ComputeCorrelation(P)
% This function compute the correlation betwen the contours

% CorrArray = ComputeCorrelation(P)

% Input&Output
% P: the contour set
% CorrArray: the correlation array

% By GUO Qiang 04/04/2016 at ENS 

% Average center of the contour
cx = mean(mean(P(:,1,:)));
cy = mean(mean(P(:,2,:)));

% Distance between points and the center
DistArray = sqrt((P(:,1,:) - cx).^2 + (P(:,2,:) - cy).^2);

DistArray = squeeze(DistArray);

% Compute the correlation
CorrArray = corrcoef(DistArray);

% Show the results
figure;
for i=1:(size(DistArray,2))
    plot(DistArray(:,i));
    %ylim([min(min(DistArray))*0.8 max(max(DistArray))*1.2]);
    title(['Distance change distribution betwen points of time: ', num2str(i)]);
    pause(1);
end