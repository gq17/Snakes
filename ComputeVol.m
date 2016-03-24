function [Rat, Vol] = ComputeVol(P)
% This function computes the volume of the heart chamber with the 
% coordinates of the snake. The current method is coarse and could be
% improved later.

% [Rat, Vol] = ComputeVol(P)

% Input 
% P: the contour points with coordinates

% Output
% Vol: the area of the contour
% Rat: the ratio between the smallest area and the biggest one

% By GUO Qiang 18/03/2016 at ENS

num = size(P);
n = num(3);
Vol = zeros(1, n);
for i=1:n
    Cx = mean(P(:,1,n));
    Cy = mean(P(:,2,n));
    % Compute the area
    for j=1:num(1)-1
        Vol(i) = Vol(i) + sqrt((P(j,1,i)-Cx)^2 + (P(j,2,i)-Cy)^2)*sqrt((P(j,1,i)-P(j+1,1,i))^2 + (P(j,2,i)-P(j+1,2,i))^2)/2;
    end
    Vol(i) = Vol(i) + sqrt((P(num(1),1,i)-Cx)^2 + (P(num(1),2,i)-Cy)^2)*sqrt((P(num(1),1,i)-P(num(1)-1,1,i))^2 + (P(num(1),2,i)-P(num(1)-1,2,i))^2)/2;
end

% Normalization of the volume
Vol = Vol/max(Vol);  

% Show the results
figure;plot(Vol); ylim([0, max(Vol)*1.1]);

% The ratio between the min and the max
Rat = min(Vol)/max(Vol);