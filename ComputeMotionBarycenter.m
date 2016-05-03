function  MotionB = ComputeMotionBarycenter(O)
% This function wants to observe the movement of the barycenter of the
% LV. We compute the barycenter at each time

% MotionB = ComputeMotionBarycenter(O)

% Input 
% O: the contour points with coordinates

% Output
% MotionB: the area of the contour

% By GUO Qiang 31/03/2016 at ENS

LocaB = mean(O);
MotionB = squeeze(LocaB);

%DistB = sqrt((MotionB(1,:) - MotionB(1,1)).^2 + (MotionB(2,:) - MotionB(2,1)).^2);
X = MotionB(1,:) - MotionB(1,1);
Y = MotionB(2,:) - MotionB(2,1);

figure;
plot(X, Y, '-.');
title('The movement of barycenter');
xlabel('The horizonal direction');
ylabel('The vertical direction');
legend('The position change');