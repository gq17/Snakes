function Q = computeCurvature(P)
% This function compute the curvature of the contour for each point of the
% contour. This may needs to be improved to get a better precision.

% Q = computeCurvature(P)
% Input&Output
% P: all the contours with their coordinate set
% Q: curvature of all the contours

% By GUO Qiang 25/03/2016 at ENS

xp = interp(P,4);


Q = zeros(size(P,1), size(P,3));

for i=1:size(P,3)
    dx = gradient(P(:,1,i));
    dy = gradient(P(:,2,i));
    Q(:,i) = gradient(atan2(dy,dx))./hypot(dx, dy);
    
end

figure;
for i=1:size(Q,2)
    plot(Q(:,i));
    ylim([min(min(Q)) max(max(Q))]);
    title(['Curvature of contour of time: ', num2str(i)]);
    pause(1);
end
