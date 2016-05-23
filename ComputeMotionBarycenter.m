function  [UEA, UEV] = ComputeMotionBarycenter(O)
% This function wants to observe the movement of the barycenter of the
% LV. We compute the barycenter at each time

% MotionB = ComputeMotionBarycenter(O)

% Input 
% O: the contour points with coordinates

% Output
% MotionB: the area of the contour

% By GUO Qiang 31/03/2016 at ENS

% Compute the average area
P=O;
num = size(P);
n = num(3);
Vol = zeros(1, n);
for i=1:n
    Cx = mean(P(:,1,n));
    Cy = mean(P(:,2,n));
    % Compute the area
    for j=1:num(1)-1
        temp1 = sqrt((P(j,1,i)-Cx)^2 + (P(j,2,i)-Cy)^2)*sqrt((P(j,1,i)-P(j+1,1,i))^2 + (P(j,2,i)-P(j+1,2,i))^2);
        temp2 = (P(j,1,i)-Cx)*(P(j,1,i)-P(j+1,1,i)) + (P(j,2,i)-Cy)*(P(j,2,i)-P(j+1,2,i));
        Sine = sqrt(1-(temp2/temp1)^2);
        Vol(i) = Vol(i) + temp1*Sine/2;
    end
    Vol(i) = Vol(i) + sqrt((P(num(1),1,i)-Cx)^2 + (P(num(1),2,i)-Cy)^2)*sqrt((P(num(1),1,i)-P(num(1)-1,1,i))^2 + (P(num(1),2,i)-P(num(1)-1,2,i))^2)/2;
end
vol = mean(Vol);

%Compute the change
LocaB = mean(O);
MotionB = squeeze(LocaB);
X = MotionB(1,:) - MotionB(1,1);
Y = MotionB(2,:) - MotionB(2,1);

figure;
subplot(1,2,1)
plot(Vol);
title('Area change of heart','FontSize',20);
xlabel('Frame','FontSize',18);
ylabel('Area','FontSize',18);
legend('Area change');
subplot(1,2,2)
plot(X, Y, '-.');
title('Movement of barycenter','FontSize',20);
xlabel('Horizonal direction/pixel','FontSize',18);
ylabel('Vertical direction/pixel','FontSize',18);
legend('Position change');

% Normalized with area
pos_x = mean(X);
pos_y = mean(Y);
DistB = sqrt((X - pos_x).^2 + (Y - pos_y).^2);
DistB = DistB/vol;
figure
plot(DistB);
title('Distribution of barycenter movement','FontSize',20);
xlabel('Frame','FontSize',18);
ylabel('Distance','FontSize',18);
legend('Distance change');

UEA = mean(DistB);
UEV = var(DistB);



