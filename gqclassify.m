% classify automatically
clear all, close all;

% sample
norm   = [];
abnorm = [];

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
