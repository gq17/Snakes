function O = ContourIte(P, Q)

% This function is used to iterate the intitial contour at each round. The
% output is computed with the initial contour by the user and the contour
% from last round. 
% The initial contour by user could be far from the real one; And the
% contour from last round could be twisted. To avoid accumulating the
% error, we balance them.

% O = ContourIte(P, Q)

% Input
% P: the first contour drawn by user
% Q: the computed contour of last round

% Output
% O: the initial contour for current round

% By GUO Qiang 22/03/2016 at ENS 

[~, idxp] = min(P(:,2));
[~, idxq] = min(Q(:,2));

% Weight of the initial contour
Val = 0.6;

sizeP = size(P);
O = zeros(sizeP(1), sizeP(2));
% for i=1:sizeP(1)
%     O(i,1) = Val*P(mod(idxp+i, sizeP(1))+1, 1) + (1-Val)*Q(mod(idxq+i, sizeP(1))+1, 1);
%     O(i,2) = Val*P(mod(idxp+i, sizeP(1))+1, 2) + (1-Val)*Q(mod(idxq+i, sizeP(1))+1, 2);
% end

for i=1:sizeP(1)
    O(i,1) = Val*P(i, 1) + (1-Val)*Q(i, 1);
    O(i,2) = Val*P(i, 2) + (1-Val)*Q(i, 2);
end

