function E = cal_perm_es_pheno_fix(gene_list,corr_value,gene_set,weight,num_permutation)

B = num_permutation;

N = length(gene_list);

[corr_value,I] = sort(corr_value,'descend');
corr_value = abs(corr_value).^weight;

tag_indicator = ismember(gene_list,gene_set);
tag_indicator = tag_indicator(I);


N_hit = sum(tag_indicator,1);
sum_corr_hit = sum(corr_value.*tag_indicator,1);

notag_indicator = 1- tag_indicator;
N_miss = N - N_hit;

norm_tag = repmat(1./sum_corr_hit,N,1);
norm_notag = repmat(1./N_miss,N,1);

RES = cumsum(norm_tag.* (tag_indicator.*corr_value)-norm_notag.*notag_indicator);
max_ES = max(RES,[],1);
min_ES = min(RES,[],1);
a = [max_ES' min_ES'];
id1 = find(abs(a(:,1)) >=abs(a(:,2)));
id2 = setdiff(1:B+1,id1);
E(id1) = a(id1,1); E(id2) = a(id2,2);


end
