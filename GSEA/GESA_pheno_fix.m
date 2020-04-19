function [pval,esall] = GESA(gene_list,corr_value,gene_set,opts)



esall = cal_perm_es_pheno_fix(gene_list,corr_value,gene_set,opts.weight,opts.num_permutation);
pval = gsea_pval(esall(1),esall);


end