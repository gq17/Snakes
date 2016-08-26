function [A, diff] = ComputeArea(P)
% This function computes the area of the heart chamber with the 
% coordinates of the snake.

% [A, diff] = ComputeArea(P)

% Input 
% P: the contour points with coordinates

% Output
% A: amplitude of the area change function
% Diff: difference between the original function and the sinusoidal
% function

% By GUO Qiang 18/03/2016 at ENS


% compute the area change
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
    temp1 = sqrt((P(num(1),1,i)-Cx)^2 + (P(num(1),2,i)-Cy)^2)*sqrt((P(num(1),1,i)-P(1,1,i))^2 + (P(num(1),2,i)-P(1,2,i))^2);
    temp2 = (P(num(1),1,i)-Cx)*(P(num(1),1,i)-P(1,1,i)) + (P(num(1),2,i)-Cy)*(P(num(1),2,i)-P(1,2,i));
    Sine = sqrt(1-(temp2/temp1)^2);
    Vol(i) = Vol(i) + temp1*Sine/2;
end

% Normalize the area
Vol = Vol/max(Vol);  

% decomposation of the function
[A, diff] = FreqA(Vol);

% %Show the results
% figure;
% plot(Vol,'LineWidth',2); 
% ylim([0, max(Vol)*1.1]);
% %title('The change of area of the LV', 'FontSize', 24);
% h = xlabel('Time');
% set(h, 'FontSize', 22);
% h = ylabel('Normalized area');
% set(h, 'FontSize', 22);

% FFT of area change
% fftvol = fft(Vol);
% figure;plot(abs(fftshift(fftvol)));
% title('Frequency of the area change', 'FontSize', 24);

