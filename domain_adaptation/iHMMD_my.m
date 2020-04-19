function [ Xsn, Xtn, flag, num_iter, time ,fn ,W, Z] = iHMMD_my(Y0,option)

global Xs Xt
[ps,ns] = size(Xs);
[pt,nt] = size(Xt);
% tic;
[fn,W,AW,obj,num_iter,flag,time] = sg_min(Y0,'prcg','euclidean',option.ftol,option.gtol);
% time = toc;

X = [Xs zeros(ps,nt); zeros(pt,ns) Xt];
Z = W'*X; 

% if option.post == 1
%    Z = Z./max(max(abs(Z))); 
% end

Xsn = Z(:,1:ns); Xtn = Z(:,ns+1:end);

end

