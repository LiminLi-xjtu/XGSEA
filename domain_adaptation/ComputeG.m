function G = ComputeG(Xs,Xt,K)
[ps,ns] = size(Xs);
[pt,nt] = size(Xt);

X = [Xs zeros(ps,nt); zeros(pt,ns) Xt];
% D = diag(1./sqrt(sum(K,2)));
% L = D*W*D;
D = diag(sum(K,2));
L = D-K;
G = X*L*X';
G = G/norm(G,'fro');
end