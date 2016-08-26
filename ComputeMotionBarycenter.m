function  moveCircleRadius = ComputeMotionBarycenter(P)
% This function wants to observe the movement of the barycenter of the
% LV. 

% moveCircleRadius = ComputeMotionBarycenter(O)

% Input 
% P: the contour points with coordinates

% Output
% moveCircleRadius: the radius of the smallest circle that includes all the barycenters

% By GUO Qiang 31/03/2016 at ENS

% Compute the average area
Vol = zeros(1, size(P,3));
Coord = zeros(2, size(P,3));
for i=1:size(P,3)
    Vol(i) = abs(sum(P(1:end-1,1,i).*P(2:end,2,i) - P(2:end,1,i).*P(1:end-1,2,i)))/2;
    temp = sum(P(1:end-1,1,i).*P(2:end,2,i) - P(2:end,1,i).*P(1:end-1,2,i))/2;
    Coord(1,i) = sum((P(1:end-1,1,i)+P(2:end,1,i)).*(P(1:end-1,1,i).*P(2:end,2,i) - P(2:end,1,i).*P(1:end-1,2,i)))/6;
    %Coord(1,i) = -Coord(1,i)/Vol(i);
    Coord(1,i) = Coord(1,i)/temp;
    Coord(2,i) = sum((P(1:end-1,2,i)+P(2:end,2,i)).*(P(1:end-1,1,i).*P(2:end,2,i) - P(2:end,1,i).*P(1:end-1,2,i)))/6;
    %Coord(2,i) = -Coord(2,i)/Vol(i);
    Coord(2,i) = Coord(2,i)/temp;
end

average_area = mean(Vol);

%MotionB = squeeze(mean(P));
%X = MotionB(1,:);
%Y = MotionB(2,:);
X = Coord(1,:);
Y = Coord(2,:);

[~,radius] = minboundcircle(X,Y, true);


%MoveCircleRadius = radius/average_area;
moveCircleRadius = radius/average_area;

% figure
% plot(Coord(1,:), 'b');
% hold on 
% plot(MotionB(1,:), 'r');
% hold off

figure;
plot(Coord(1,:),Coord(2,:));








