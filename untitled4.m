% Get excellent pictures

% % area change
% figure;
% plot(Voln48);
% ylim([0 1.1]);
% xlabel('frame', 'FontSize', 18);
% ylabel('normalized area', 'FontSize', 18);
% title('area change function', 'FontSize', 20);
% 
% figure;
% plot(abs(fft(Voln5)));
% title('FFT of the area change function', 'FontSize', 20);
% 
% figure;
% plot(Voln5);
% ylim([0 1.1]);
% hold on
% plot(abs(ifft(fi)), 'r');
% legend('original function', 'rebuilt function', 'FontSize', 18);
% xlabel('frame', 'FontSize', 18);
% ylabel('normalized area', 'FontSize', 18);
% title('rebuild the original area function', 'FontSize', 20);
% hold off

% the barycenter

% location = mean(nor50);
% location = squeeze(location);
% figure;
% plot(location(1,:),location(2,:))
% title('barycenter movement', 'FontSize', 20)
% xlabel('x axis', 'FontSize', 18)
% ylabel('y axis', 'FontSize', 18)
% hold on 
% [center,radius] = minboundcircle(location(1,:),location(2,:), true);
% ang = 0:0.01:2*pi;
% xp = radius*cos(ang);
% yp = radius*sin(ang);
% plot(center(1)+xp, center(2)+yp, 'r');


% P = nor48;
% center_x = mean(mean(P(:,1,:)));
% center_y = mean(mean(P(:,1,:)));
% 
% num = size(P);
% n = num(3);
% area_left = zeros(1,n);
% area_right = zeros(1,n);
% 
% for i=1:n
%     % Compute the area
%     for j=1:num(1)-1
%         temp1 = sqrt((P(j,1,i)-center_x)^2 + (P(j,2,i)-center_y)^2)*sqrt((P(j,1,i)-P(j+1,1,i))^2 + (P(j,2,i)-P(j+1,2,i))^2);
%         temp2 = (P(j,1,i)-center_x)*(P(j,1,i)-P(j+1,1,i)) + (P(j,2,i)-center_y)*(P(j,2,i)-P(j+1,2,i));
%         Sine = sqrt(1-(temp2/temp1)^2);
%         if(P(j,1,i) < center_x)
%             area_left(i) = area_left(i) + temp1*Sine/2;
%         else
%             area_right(i) = area_right(i) + temp1*Sine/2;
%         end
%     end
%     %Vol(i) = Vol(i) + sqrt((P(num(1),1,i)-center_x)^2 + (P(num(1),2,i)-center_y)^2)*sqrt((P(num(1),1,i)-P(num(1)-1,1,i))^2 + (P(num(1),2,i)-P(num(1)-1,2,i))^2)/2;
% end
% 
% area = area_right + area_left;
% % % Show the results
% figure;
% plot(area, 'b'); 
% ylim([0 max(area)*1.1])
% hold on
% plot(area_left, 'r');
% plot(area_right, 'k');
% title('area change', 'FontSize', 20);
% xlabel('frame', 'FontSize', 18);
% ylabel('area', 'FontSize', 18);
% legend('total area', 'left area', 'right area', 'FontSize', 18);
% hold off
