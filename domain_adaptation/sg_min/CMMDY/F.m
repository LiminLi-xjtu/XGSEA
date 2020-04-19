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
% f = computef(Xsn,Xtn,sigma);
% t1 = tic;
% L1 = triu(L)- diag(diag(L));
% [I J l] = find(L1);
% k = gaussklist(X(:,I),X(:,J),sigma);
% f1 = 2*k'*l + sum(diag(L));
% time1 = toc(t1);

t2 = tic;
K = gaussk(X',sigma);
f1 = sum(sum(K.*L));
time2 = toc(t2);


f2 = trace(W'*G*W);
f = f1+f2;

% f2 = trace(W'*G1*W);
% f3 = trace(W'*G2*W);
% 
% f = f1 + f2 +f3;
% L(1:n,1:n) = -1/(ns*nt);
% L(1:ns,1:ns) = 1/ns^2;
% L(ns+1:n,ns+1:n) = 1/nt^2;
% 
% P = W(1:ps,:);
% Q = W(ps+1:p,:);
% 
% X = [P'*Xs Q'*Xt]; % d*(ns+nt);
% K = gaussk(X',sigma);
% f =trace(K*L);


% f2 = trace(W'*G1*W);
% f3 = trace(W'*G2*W);
% f4 = trace(W'*G3*W);
% f5 = -lambda*trace(K);

% f = f1+f2+f3+f4;




% f = trace(K*L)-lambda*trace(K) + trace(W'*G*W);
%Df_W = gradientf(W,K);

end
% 
% function K = Kfun(W)
% global ps p Xs Xt sigma
% P = W(1:ps,:);
% Q = W(ps+1:p,:);
% 
% X = [P'*Xs Q'*Xt]; % d*(ns+nt);
% K = gaussk(X',sigma);
% 
% end

function fval = computef(Xsn,Xtn,sigma)

ns = size(Xsn,2);
nt = size(Xtn,2);
n = ns+nt;
L(1:n,1:n) = -1/(ns*nt);
L(1:ns,1:ns) = 1/ns^2;
L(ns+1:n,ns+1:n) = 1/nt^2;

X = [Xsn Xtn];
K = gaussk(X',sigma);
fval =trace(K*L);

end