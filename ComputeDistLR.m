function DistList = ComputeDistLR(P)
% This function compute the distance betwen the left and right surface.

% DistList = ComputeDistCentral(P)

% Input&Output
% P: the contour set
% Distlist: the distance list

% By GUO Qiang 31/03/2016 at ENS 

a = zeros(1,size(P,1)/2);
DistList = zeros(1,size(P,3));

N = size(P,1);
for j=1:size(P,3)
    for i=1:(N/2)
        if i<=(N*3/8)
            a(i) = min(sqrt((P(i+N*3/8:i+N*5/8,1,j) - P(i,1,j)).^2 + (P(i+N*3/8:i+N*5/8,2,j) - P(i,2,j)).^2));
        else
            c1 = min(sqrt((P((i+N*3/8):N,1,j) - P(i,1,j)).^2 + (P((i+N*3/8):N,2,j) - P(i,2,j)).^2));
            c2 = min(sqrt((P(1:mod(i+N*5/8, N),1,j) - P(i,1,j)).^2 + (P(1:mod(i+N*5/8, N),2,j) - P(i,2,j)).^2));
            a(i) = min(c1,c2);
        end
    end
    DistList(j) = min(a);
end

% Show the result
figure;
plot(DistList);
title('the distance between left and right surfaces');
ylim([0 max(DistList)*1.1]);