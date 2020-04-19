
%es: m*1 
%esnull: m*B
function pval = gsea_pval(es,esnull)

% cond = [es>=0 es<0];
% choice = [ ];
m = length(es);

for i = 1:m
    if es(i)>=0
        pval(i) = length(find(esnull(i,:)>=es(i)))/length(find(esnull(i,:)>=0));
    elseif es(i)<0
        pval(i) = length(find(esnull(i,:)<=es(i)))/length(find(esnull(i,:)<=0));
    end
end

pval = pval';

end