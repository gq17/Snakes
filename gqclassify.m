% classify automatically
clear all, close all;

% sample
norm   = [5 6 7 8 9 10 12 13 14 15 16 17 18 19 20 22 23 24 25 26 28 29 36 37 38 40 42 43 44 46 48 50 53 54 55];
abnorm = [1 2 5 6 7 8 9 10 11 13 14 15 16 18 19 20 21 22 23 25 26 28 30 31 32 34 35 37 38];

% get the contour sequence from the heart video and save them to file
ext = '.avi';
description = 'this is the file to store the contour data';
save('data.mat', 'description')
for i=1:size(norm,2)
    n        = norm(i);
    filename = strcat('../examples/normal/',num2str(n),'.avi');
    contouri = getContour(filename);
    save('data.mat', 'contouri','-append');
end

% load data
% load('data.mat');
