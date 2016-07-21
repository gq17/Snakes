function  moveCircleRadius = ComputeMotionBarycenter(O)
% This function wants to observe the movement of the barycenter of the
% LV. 

% !!!!!!!!
% There is an undermined assumption that the video is the normal size of
% human. It's not expanded.

% moveCircleRadius = ComputeMotionBarycenter(O)

% Input 
% O: the contour points with coordinates

% Output
% moveCircleRadius: the radius of the smallest circle that includes all the barycenters

% By GUO Qiang 31/03/2016 at ENS

% Compute the average area
% P = O;
% num = size(P);
% n = num(3);
% Vol = zeros(1, n);
% for i=1:n
%     Cx = mean(P(:,1,n));
%     Cy = mean(P(:,2,n));
%     % Compute the area
%     for j=1:num(1)-1
%         temp1 = sqrt((P(j,1,i)-Cx)^2 + (P(j,2,i)-Cy)^2)*sqrt((P(j,1,i)-P(j+1,1,i))^2 + (P(j,2,i)-P(j+1,2,i))^2);
%         temp2 = (P(j,1,i)-Cx)*(P(j,1,i)-P(j+1,1,i)) + (P(j,2,i)-Cy)*(P(j,2,i)-P(j+1,2,i));
%         Sine = sqrt(1-(temp2/temp1)^2);
%         Vol(i) = Vol(i) + temp1*Sine/2;
%     end
%     Vol(i) = Vol(i) + sqrt((P(num(1),1,i)-Cx)^2 + (P(num(1),2,i)-Cy)^2)*sqrt((P(num(1),1,i)-P(num(1)-1,1,i))^2 + (P(num(1),2,i)-P(num(1)-1,2,i))^2)/2;
% end
% 
% average_area = mean(Vol);

%Compute the change
LocaB = mean(O);
MotionB = squeeze(LocaB);
X = MotionB(1,:);
Y = MotionB(2,:);

[~,radius] = minboundcircle(X,Y, true);


%MoveCircleRadius = radius/average_area;
moveCircleRadius = radius;





