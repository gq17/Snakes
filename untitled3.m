clear all; close all;

%% Read the vidio, extract the frames/images
heartVideo = VideoReader('../examples/abnormal/014.avi');
heartImg = heartVideo.read();
frames = heartVideo.NumberOfFrames;

%% Set the options of the algorithm
Options=struct;
Options.Verbose=true;
Options.Iterations=100;
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
Options.Delta=-0.1;
Options.GIterations=200;

%% Run the snakes algorithm
img = heartImg(:,:,:,1);
I=im2double(img);
figure, imshow(I);[y,x] = getpts; 
P=[x(:) y(:)];

% Igray=rgb2gray(I);
% figure, imshow(Igray);
% 
% figure, imshow(I(:,:,1));
% figure, imshow(I(:,:,2));
% figure, imshow(I(:,:,3));

% The contour must always be clockwise (because of the balloon force)
P=MakeContourClockwise2D(P);

% Make an uniform sampled contour description
P=InterpolateContourPoints2D(P,Options.nPoints);
Pcopy = P;

% Preallocate for acceleration
O = zeros(Options.nPoints, 2, frames);

% flag of the conraction. 1 means systole, -1 means diastole, 0 unsure
cflag = 1;

% Run snakes
[O(:,:,1),J]=Snake2D(I,P,Options);
for x = 2:frames
    img = heartImg(:,:,:,x);
    I=im2double(img);
    [O(:,:,x),J]=Snake2D(I,P,Options);
    cflag = ComputeState(O, x);
    if(cflag == -1)
        Options.Delta=0.1;
    else if(cflag == 1)
            Options.Delta=-0.1;
        else
            Options.Delta= 0;
        end
    end
    P = ContourIte(Pcopy, O(:,:,x));
    % Linear resampling of the contour to avoid twist
    dis=[0;cumsum(sqrt(sum((P(2:end,:)-P(1:end-1,:)).^2,2)))];
    P(:,1) = interp1(dis,P(:,1),linspace(0,dis(end),floor(size(P,1))));
    P(:,2) = interp1(dis,P(:,2),linspace(0,dis(end),floor(size(P,1))));
end








