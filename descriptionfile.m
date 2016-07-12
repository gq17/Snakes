%% video description
% This file stores the information about the heart video

%% Nameing
%  The input video shoud be n.avi in different directories to avoid
%  confusion between two tags
%  The contour variable should be normal+n or abnormal+n, they are store in
%  the data.mat file
%  The rest process should be done in loops

%  abnormal hearts
%  3&4 the right part is blur and exceeds the boundary
%  12  the right part is blur
%  14 the total view is moving, making the barycenter moves much
%  17&29 the right part is blur
%  24 there is no image in the beginning
%  27 blur everywhere
%  36 the bottom is blur


%  normal hearts

%  1&2  there is not complete contour
%  3 the top part will disappear
%  4 there is a big shadow in the middle of the video, making it inaccurate
%  5 the top left part is not close
%  11 The top half of the LV will disappear at some time, so not work
%  14 the bottom right part is not easy to track
%  16 the top part of LV is blur
%  21 the left part contour is wrong at some tiome
%  28 the last 10 frames are not accurate, the reat 100 are good
%  30&33&34&35 the contrst is too low and the nearby chamber is close
%  31&32 the top part is blur
%  39 the right area is blur
%  41 the right area is blur, and the top left part exceeds the boundary
%  45&47&49&51&52 the left part is blur and close to the boundary


