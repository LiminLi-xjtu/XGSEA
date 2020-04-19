%X: p by n
%normalized each feature, such that each feature has zero mean and norm 1
function X = normalize(X,center)
[p,n] = size(X);
if center == 1
   xbar = mean(X,2);
   X = X - repmat(xbar,1,n);    
end
l = sqrt(sum(X.*X,2));
id = find(l);
d = 1./l;
X(id,:) = X(id,:).*repmat(d(id),1,n);

end