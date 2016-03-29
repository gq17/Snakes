function Q = computeCurvature(P)
% This function compute the curvature of the contour for each point of the
% contour. This may needs to be improved to get a better precision.

% Q = computeCurvature(P, n)
% Input&Output
% P: all the contours with their coordinate set
% n: the resample coefficient

% Q: curvature of all the contours

% By GUO Qiang 25/03/2016 at ENS


Q = zeros(size(P,1), size(P,3));

% Compute the curvature
for i=1:size(P,3)
%     dx = gradient(P(:,1,i));
%     dy = gradient(P(:,2,i));
%     Q(:,i) = gradient(atan2(dy,dx))./hypot(dx,dy);
    x = P(:,1,i); y = P(:,2,i);
    xe = [x(3);x;x(end-2)];ye = [y(3);y;y(end-2)];
    dx = diff(xe); dy = diff(ye);
    dxb = dx(1:end-1); dyb = dy(1:end-1);
    dxf = dx(2:end); dyf = dy(2:end);
    d2x = xe(3:end)-xe(1:end-2); d2y = ye(3:end)-ye(1:end-2);
    Q(:,i) = 2*(dxb.*dyf-dyb.*dxf)./sqrt((dxb.^2+dyb.^2).*(dxf.^2+dyf.^2).*(d2x.^2+d2y.^2));
end

% Show the results
figure;
for i=1:size(Q,2)
    plot(Q(:,i));
    %ylim([min(min(Q))-4 max(max(Q))+4]);
    title(['Curvature of contour of time: ', num2str(i)]);
    pause(1);
end
