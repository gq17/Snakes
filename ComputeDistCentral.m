function DistArray = ComputeDistCentral(P)
% This function compute the distance change betwen points and the center of the
% contour

% DistArray = ComputeDistCentral(P)

% Input&Output
% P: the contour set
% DistArrayC: the distance array

% By GUO Qiang 29/03/2016 at ENS 

% Average center of the contour
cx = mean(mean(P(:,1,:)));
cy = mean(mean(P(:,2,:)));

% Distance between points and the center
DistArray = sqrt((P(:,1,:) - cx).^2 + (P(:,2,:) - cy).^2);

DistArray = squeeze(DistArray);

%DistArrayC = DistArray(:,2:size(DistArray,2)) - DistArray(:,1:size(DistArray,2)-1);

% sum of the distance
% DistSum = sum(abs(DistArrayC));
% DistSum = sum((DistArrayC).^2);

% Compute the correlation
% CorrArray = corrcoef(DistArray);
% figure
% %plot(CorrArray(5,:));
% plot(mean(CorrArray(1:3,:)));
% ylim([0 1]);

% Show the results
% figure;
% surf(DistArray);
% title('Distance distribution', 'FontSize', 20);
% xlabel('Frame', 'FontSize', 18);
% ylabel('Contour points', 'FontSize', 18);
% zlabel('Value', 'FontSize', 18);
% % 
% figure;
% surf(CorrArray);
% title('Distance distribution correlation', 'FontSize', 20);
% xlabel('Frame', 'FontSize', 18);
% ylabel('Frame', 'FontSize', 18);
% zlabel('Value', 'FontSize', 18);

% a = sum(CorrArray(:)<0.8)/(size(CorrArray,1)^2);
% % Show the results
% figure;
% for i=1:(size(DistArray,2)-1)
%     subplot(2,1,1);
%     plot(DistArray(:,i));
%     title(['Central distance distribution of time: ', num2str(i)]);
%     subplot(2,1,2);
%     plot(DistArrayC(:,i));
%     %ylim([min(min(DistArray))*1.2 max(max(DistArray))*1.2]);
%     title(['Central distance change distribution of time: ', num2str(i)]);
%     pause(1);
% end
% 
% Show the mean and variance of the coorelation
% x = zeros(1,size(CorrArray,1));
% for i=1:size(CorrArray,1)
%     x(i) = CorrArray(i,mod(i+1, size(CorrArray,1))+1);
% end
% 
% TYA = mean(x);
% TYV = var(x);
