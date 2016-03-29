%clear all; 
close all;

r = 1;
% a = 2*pi-0.005*pi:-0.005*pi:0;
a = 0:0.01*pi:2*pi;
x = r*cos(a);
y = r*sin(a);
figure;
plot(x,y);

Pxy = [x', y'];
Pxy1(:,:,1) = Pxy;
Pxy1(:,:,2) = Pxy;

Qxy = computeCurvature(Pxy1);
