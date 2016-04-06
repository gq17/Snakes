function DistArray = ComputeDistPoints(P)
% This function compute the distance change betwen points of the contour

% DistArray = ComputeDistPoints(P)

% Input&Output
% P: the contour set
% DistArray: the distance array

% By GUO Qiang 04/04/2016 at ENS 

% Distance between points
DistArray = sqrt((P(1:end-1,1,:) - P(2:end,1,:)).^2 + (P(1:end-1,2,:) - P(2:end,2,:)).^2);

DistArray = squeeze(DistArray);

% Show the results
figure;
for i=1:(size(DistArray,2))
    plot(DistArray(:,i));
    %ylim([min(min(DistArray))*0.8 max(max(DistArray))*1.2]);
    title(['Distance change betwen points of time: ', num2str(i)]);
    pause(1);
end