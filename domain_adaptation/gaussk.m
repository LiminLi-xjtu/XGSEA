
function [S]=gaussk(E,sigma)
n=size(E,1);
X=sum(E.^2,2);
D= repmat(X,1,n)+repmat(X',n,1)-2*E*transpose(E);
%sigma = sum(sum(A))/(n^2);
if nargin ==1
sigma = median(reshape(D,n*n,1));
end

S = exp(-D/(sigma));
end