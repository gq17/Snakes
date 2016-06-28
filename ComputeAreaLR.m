function SimiliarityLR = ComputeAreaLR(P)
% This function computes the left and right area changes of the LV, and
% return their similiarity.

% SimiliarityLR = ComputeAreaLR(P)

% Input 
% P: the contour points with coordinates

% Output
% SimiliarityLR: the ratio between the smallest area and the biggest one

% By GUO Qiang 08/06/2016 at ENS

% Find the center of the heart
center_x = mean(mean(P(:,1,:)));
center_y = mean(mean(P(:,1,:)));

num = size(P);
n = num(3);
area_left = zeros(1,n);
area_right = zeros(1,n);

for i=1:n
    % Compute the area
    for j=1:num(1)-1
        temp1 = sqrt((P(j,1,i)-center_x)^2 + (P(j,2,i)-center_y)^2)*sqrt((P(j,1,i)-P(j+1,1,i))^2 + (P(j,2,i)-P(j+1,2,i))^2);
        temp2 = (P(j,1,i)-center_x)*(P(j,1,i)-P(j+1,1,i)) + (P(j,2,i)-center_y)*(P(j,2,i)-P(j+1,2,i));
        Sine = sqrt(1-(temp2/temp1)^2);
        if(P(j,1,i) < center_x)
            area_left(i) = area_left(i) + temp1*Sine/2;
        else
            area_right(i) = area_right(i) + temp1*Sine/2;
        end
    end
    %Vol(i) = Vol(i) + sqrt((P(num(1),1,i)-center_x)^2 + (P(num(1),2,i)-center_y)^2)*sqrt((P(num(1),1,i)-P(num(1)-1,1,i))^2 + (P(num(1),2,i)-P(num(1)-1,2,i))^2)/2;
end

% Normalization of the volume
area_left = area_left/max(area_left);  
area_right = area_right/max(area_right); 

%SimiliarityLR = sum((area_left-area_right).^2)/size(area_left,2);
SimiliarityLR = var(area_left)/var(area_right);
% Show the results
figure;
plot(area_left, 'b'); 
ylim([0, 1.1]);
title('The change of area of the LV');
xlabel('The timeline');
ylabel('The normalized area');
legend('The area change');
hold on
plot(area_right, 'r');
hold off




