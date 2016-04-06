function DistArray = ComputeDist(P)
% This function compute the distance betwen points in the contour. The
% nearest and farthest distances are non-sense, so we compute the distance
% between points and their farthest fellow.

% DistArray = ComputeDist(P)

% Input&Output
% P: the contour set
% DisArray: the distance array

% By GUO Qiang 29/03/2016 at ENS 

num = floor(size(P,1)/2);

DistArray = sqrt((P(1:num,1,:) - P(num+1:num*2,1,:)).^2 + (P(1:num,2,:) - P(num+1:num*2,2,:)).^2);

DistArray = squeeze(DistArray);

% Show the results
figure;
for i=1:size(DistArray,2)
    plot(DistArray(:,i));
    ylim([min(min(DistArray))*0.8 max(max(DistArray))*1.2]);
    title(['Farthest neighbor distance distribution of time: ', num2str(i)]);
    pause(1);
end
