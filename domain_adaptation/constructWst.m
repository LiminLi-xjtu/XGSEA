function W = constructWst3(mouse_sets,human_sets,G)

[m,n] = size(G);

X = zeros(m,1);
Y = zeros(n,1);

for i = 1: length(mouse_sets)
    mlen(i) = length(mouse_sets{i});
    X(mouse_sets{i},i) = 1;
end

for i = 1: length(human_sets)
    hlen(i) = length(human_sets{i});
    Y(human_sets{i},i) = 1;
end


A = X'*G;
A(find(A>1)) = 1;
W1 = A*(Y.*repmat(1./hlen,n,1));

B = Y'*G';
B(find(B>1)) = 1;
W2 = B*(X.*repmat(1./mlen,m,1));
W2 = W2';

W = min(W1,W2);

end