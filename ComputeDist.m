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
DistArray = zeros(size(P,1), size(P,3));
for i=1:size(P,1)
    DistArray(i,:) = sqrt((P(i,1,:) - P(mod(num+i, size(P,1))+1,1,:)).^2 + (P(i,2,:) - P(mod(num+i, size(P,1))+1,2,:)).^2);
end

% Show the results
figure;
for i=1:size(DistArray,2)
    plot(DistArray(:,i));
    ylim([min(min(DistArray))*0.8 max(max(DistArray))*1.2]);
    title(['Farthest neighbor distance distribution of time: ', num2str(i)]);
    pause(1);
end
