function sums = computeCurvature(P)
% This function compute the curvature of the contour for each point of the
% contour. This may needs to be improved to get a better precision.

% Q = computeCurvature(P, n)
% Input&Output
% P: all the contours with their coordinate set
% n: the resample coefficient

% Q: curvature of all the contours

% By GUO Qiang 25/03/2016 at ENS
% http://fr.mathworks.com/matlabcentral/newsreader/view_thread/119458

Q = zeros(size(P,1), size(P,3));

% Compute the curvature
for i=1:size(P,3)
%     dx = gradient(P(:,1,i));
%     dy = gradient(P(:,2,i));
%     Q(:,i) = gradient(atan2(dy,dx))./hypot(dx,dy);
%     The above formula has some extrema in some points.
    x = P(:,1,i); y = P(:,2,i);
    xe = [x(3);x;x(end-2)];ye = [y(3);y;y(end-2)];
    dx = diff(xe); dy = diff(ye);
    dxb = dx(1:end-1); dyb = dy(1:end-1);
    dxf = dx(2:end); dyf = dy(2:end);
    d2x = xe(3:end)-xe(1:end-2); d2y = ye(3:end)-ye(1:end-2);
    Q(:,i) = 2*(dxb.*dyf-dyb.*dxf)./sqrt((dxb.^2+dyb.^2).*(dxf.^2+dyf.^2).*(d2x.^2+d2y.^2));
end

% This is based on the idea that the curvature of a circle running through
% three points is equal to four times the area of the triangle formed by
% them, divided by the product of its three sides.

% Formulas like this based on three nearby points
% are very sensitive to noise in the data, and they work better if the
% points are not spaced too closely together.

% Find the left wall part and use the curvature for classification
DistArray = ComputeDistCentral(P);
dist = sum(DistArray, 2);
value0 = max(dist);
lowv = size(P,1)/4;
highv = size(P,1)-lowv;
[~, inds1] = min(dist)
if(inds1<=lowv)
    dist(1:inds1+lowv)=value0+1;
    dist(inds1+highv:size(P,1))=value0+1;
else if(inds1>highv)
        dist(inds1-lowv:size(P,1))=value0+1;
        dist(1:inds1-highv)=value0+1;
    else
        dist(inds1-lowv:inds1+lowv)=value0+1;
    end
end
[~, inds2] = min(dist)

if(P(inds2,2,1)<P(inds1,2,1))
    inds = inds2;
else
    inds = inds1;
end

% Compute the curvature feature
lowv = size(dist,1)/8;
highv = size(dist,1)-lowv;
%datas = zeros(2*lowv+1, size(Q ,2));
if(inds<=lowv)
    datas = [Q(inds+highv:size(P,1)); Q(1:inds+25)];
else if(inds>highv)
    datas = [Q(inds-lowv:size(P,1)); Q(1:inds-highv)];    
    else
        datas = Q(inds-lowv:inds+lowv,:);
    end
end

S = corrcoef(datas);
sums = 0;
for i =1:size(S,1)-1
    sums = sums + S(i,i+1);
end
sums = sums/size(S,1);


% % Show the results
% figure;
% for i=1:size(Q,2)
%     plot(Q(:,i));
%     %ylim([min(min(Q))-4 max(max(Q))+4]);
%     title(['Curvature of contour of time: ', num2str(i)]);
%     %w = waitforbuttonpress;
%     pause(1);
% end
