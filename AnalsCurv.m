function  CorrCurvC = AnalsCurv(Curv)

% This function is used to analyse the curvature of the contour. The
% interesting part will be found to proceed further study.

% sign = AnalsCurv(Curv)
% Input&Output
% Curv: the curvature array

% sign: 

% By GUO Qiang 11/04/2016 at ENS

avgc = mean(Curv,2);
stdc = std(Curv,0,2);

avgavgc = mean(avgc);
avgstdc = mean(stdc);


% The thresholds need to be improved for more cases.
Thavg = avgavgc*1.2 + max(avgc)*1;
Thstd = avgstdc*1.0 + max(stdc)*0.0;

N = size(Curv, 1);
sign = zeros(1,N);
for i=1:N
    if(avgc(i)<Thavg)&&(stdc(i)<Thstd)
        sign(i) = 1;
    end
end
N2 = sum(sign);
CurvC = zeros(N2, size(Curv,2));

j=1;
for i=1:N
    if sign(i)==0
        avgc(i)=0;
        stdc(i)=0;
        Curv(i,:)=0;
    else
        CurvC(j,:) = Curv(i,:);
        j=j+1;
    end
end

% figure;
% subplot(2,1,1)
% plot(avgc);
% subplot(2,1,2)
% plot(stdc);

% Compute the correlation
CorrCurv = corrcoef(Curv);
CorrCurvC = corrcoef(CurvC);

% Show the results
figure;
surf(CorrCurv);
figure;
surf(CorrCurvC);

