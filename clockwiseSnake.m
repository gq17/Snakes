function Q = clockwiseSnake(P)
% This function would make the snake clockwise. It is different from the
% MakeContourClockwise2D, it's more powerful in fact. it will correct the
% points wich are irregular(forming twists) in the snakes. This function is
% created to use the last snake as the initialization for current round.

%
% Input&Output
% P: the original snake
% Q: the clockwised snake

% By GUO Qiang 24/03/2016 at ENS

num = size(P, 1);

avgX = mean(P(:,1));
avgY = mean(P(:,2));
for i=1:num-1
    if((avgY*P(i,1) - P(i,2)*avgX)==0)
        continue;
    end
    a = (avgY-P(i,2))/(avgY*P(i,1) - P(i,2)*avgX);
    b = (P(i,1)-avgX)/(avgY*P(i,1) - P(i,2)*avgX);
    if(a*P(i+1,1)+b*P(i+1,2) < 1)
        temp = P(i,1);
        P(i,1) = P(i+1,1);
        P(i+1,1) = temp;
        temp = P(i,2);
        P(i,2) = P(i+1,2);
        P(i+1,2) = temp;
    end
end

Q = P;