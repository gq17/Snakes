
f         = fft(Vola19); % FFt of orig signal 
% sort the abs of coefficients 
[s,inds]  = sort(abs(f(1:ceil(numel(f)/2))),'ascend');
% preallocation
fTemp      = f;
numPoints  = numel(inds);% floor(numel(inds)/2);
meanPeriod = zeros(1,numPoints);
sse        = zeros(1,numPoints);
figure, hold on, 
for sIdx = 1:numPoints-1
    fTemp(inds(sIdx))= 0;
    fTemp(numel(f)-inds(sIdx))=0;
    fi               = abs(ifft(fTemp));
    % find local maxima
    [m,lInds]        = findpeaks(fi);
    % calculate mean period time (scaled time)
    d                = diff(lInds);
    meanPeriod(sIdx) = mean(d);
    sse(sIdx)        = norm(fi-Vola19);
    plot(fi,'DisplayName',['Scale', num2str(sIdx)]), drawnow
end
plot(Voln5,'r','DisplayName','orig','LineWidth',5);

figure, plot(meanPeriod,sse,'o'), xlabel('mean period'), ylabel('sse')
