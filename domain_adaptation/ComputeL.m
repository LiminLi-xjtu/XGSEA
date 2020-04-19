function L = ComputeL(ys0,yt0)

ns = length(ys0);
nt = length(yt0);
n = ns+nt;
labels = unique(ys0);
C = length(labels);
V = zeros(n,C);
for i = 1:C
    Cs = find(ys0==labels(i));
    Ct = find(yt0==labels(i));
    V(Cs,i) = 1/length(Cs);
    V(ns+Ct,i) = -1/length(Ct);
end
L = V*V'; L = sparse(L);


end
