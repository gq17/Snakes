clear all; close all;

%% Set the options of the algorithm
Options=struct;
Options.Verbose=true;
Options.Iterations=250;
Options.nPoints = 200;
Options.Wedge=2;
Options.Wline=0;
Options.Wterm=2;
Options.Kappa=4;
Options.Sigma1=8;
Options.Sigma2=8;
Options.Alpha=0.1;
Options.Beta=0.3;
Options.Mu=0.5;
Options.Delta=0.1;
Options.GIterations=200;

%% Run the snakes algorithm
img = imread('testimage.png');
I=im2double(img);
figure, imshow(I);[y,x] = getpts; 
P=[x(:) y(:)];

% The contour must always be clockwise (because of the balloon force)
P=MakeContourClockwise2D(P);

% Make an uniform sampled contour description
P=InterpolateContourPoints2D(P,Options.nPoints);


% Run snakes
[O(:,:,1),J]=Snake2D(I,P,Options);

