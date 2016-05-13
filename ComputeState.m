function cflag = ComputeState(P, x)
% This function computes the state of the heart, to decide whether it
% contracts or inflate. 

num = size(P);

Vol = zeros(1,num(3));
for i=(x-1):x
    Cx = mean(P(:,1,x));
    Cy = mean(P(:,2,x));
    % Compute the area
    for j=1:num(1)-1
        temp1 = sqrt((P(j,1,i)-Cx)^2 + (P(j,2,i)-Cy)^2)*sqrt((P(j,1,i)-P(j+1,1,i))^2 + (P(j,2,i)-P(j+1,2,i))^2);
        temp2 = (P(j,1,i)-Cx)*(P(j,1,i)-P(j+1,1,i)) + (P(j,2,i)-Cy)*(P(j,2,i)-P(j+1,2,i));
        Sine = sqrt(1-(temp2/temp1)^2);
        Vol(i) = Vol(i) + temp1*Sine/2;
    end
    Vol(i) = Vol(i) + sqrt((P(num(1),1,i)-Cx)^2 + (P(num(1),2,i)-Cy)^2)*sqrt((P(num(1),1,i)-P(num(1)-1,1,i))^2 + (P(num(1),2,i)-P(num(1)-1,2,i))^2)/2;
end

flag = (Vol(x)-Vol(x-1))/Vol(x-1);
if(flag > 0.05)
    cflag = -1;
else if(flag < -0.05)
        cflag = 1;
    else
        cflag = 0;
    end
end