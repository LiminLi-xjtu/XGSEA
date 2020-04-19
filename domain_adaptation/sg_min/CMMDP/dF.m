function df = dF(W)

global sigma Xs Xt L G fast; 
% G

[ps,ns] = size(Xs);
[pt,nt] = size(Xt);
n = ns+nt; p = ps+pt;
X = [Xs zeros(ps,nt); zeros(pt,ns) Xt];
Z = W'*X;

if 1

t1 = tic;
K = gaussk(Z',sigma);
R = K.*L/sigma;
RR = diag(sum(R,1)) - R;
df = -4* X*(RR*(X'*W))+2*G*W; 
time1 = toc(t1);

else
t2 = tic;
L1 = triu(L)- diag(diag(L));
[I J l] = find(L1);

if fast == 2
a = randperm(length(I));
b = a(1:round(0.01*length(I)));
I = I(b); J =J(b); l = l(b);
elseif fast == 3
    %random select  n/oldersize classes
    foldsize = 10;
    fold = round (n/foldsize);
    CS = crossvalind('kfold',n,fold);
    for i =1:fold
        V(find(CS==i),i) = 1;
    end
    TL = V*V';
    L2 = TL.*L1;
    [I J l] = find(L2);
end

k = gaussklist(Z(:,I),Z(:,J),sigma);
alpha1 = k.*l; alpha1 = alpha1';
T = X(:,I)-X(:,J);
alphac =  repmat(alpha1,p,1);
df = -4*T.*alphac*(T'*W)/sigma + 2*G*W;
time2 = toc(t2);


end



% 


end

