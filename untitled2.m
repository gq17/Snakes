%clear all; close all;

r = 5;
a = 0:0.01*pi:2*pi-0.01*pi;
x = r*cos(a);
y = r*sin(a);
figure;
plot(x,y);

Pxy = [x', y'];

Qxy = computeCurvature(Pxy, 1);
