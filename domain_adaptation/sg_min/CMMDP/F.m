function   [f f1 f2] = F(W)

global   Xs Xt sigma G L;
% G G1 G2 G3
[ps] = size(Xs,1);
[pt] = size(Xt,1);
p = ps + pt;
P = W(1:ps,:);
Q = W(ps+1:p,:);
Xsn = P'*Xs; 
Xtn = Q'*Xt; 
X = [Xsn Xtn];

K = gaussk(X',sigma);
f1 = sum(sum(K.*L));

f2 = trace(W'*G*W);
f = f1+f2;


end

