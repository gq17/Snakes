function [Rat, Vol] = ComputeArea(P)
% This function computes the volume of the heart chamber with the 
% coordinates of the snake. The current method is coarse and could be
% improved later.

% [Rat, Vol] = ComputeArea(P)

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
        temp1 = sqrt((P(j,1,i)-Cx)^2 + (P(j,2,i)-Cy)^2)*sqrt((P(j,1,i)-P(j+1,1,i))^2 + (P(j,2,i)-P(j+1,2,i))^2);
        temp2 = (P(j,1,i)-Cx)*(P(j,1,i)-P(j+1,1,i)) + (P(j,2,i)-Cy)*(P(j,2,i)-P(j+1,2,i));
        Sine = sqrt(1-(temp2/temp1)^2);
        Vol(i) = Vol(i) + temp1*Sine/2;
    end
    Vol(i) = Vol(i) + sqrt((P(num(1),1,i)-Cx)^2 + (P(num(1),2,i)-Cy)^2)*sqrt((P(num(1),1,i)-P(num(1)-1,1,i))^2 + (P(num(1),2,i)-P(num(1)-1,2,i))^2)/2;
end

% Normalization of the volume
Vol = Vol/max(Vol);  

% Show the results
figure;
plot(Vol); 
ylim([0, max(Vol)*1.1]);
title('The change of area of the LV');
xlabel('The timeline');
ylabel('the normalized area');
legend('the changing function');

% The ratio between the min and the max
Rat = min(Vol)/max(Vol);

% % FFT of area change
% fftvol = fft(Vol);
% figure;plot(abs(fftvol));
% title('Frequence of the area change');