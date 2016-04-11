function  [x1, x2] = AnalsCurv(Curv)

% This function is used to analyse the curvature of the contour. The
% interesting part will be found to proceed further study.


avg = mean(Curv,2);

stdc = std(Curv,0,2);
