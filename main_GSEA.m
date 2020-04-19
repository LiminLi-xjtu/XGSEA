
function main_GSEA

    clear;
    % load Homology graph G
    load ./data/original_data/HomologyData mouse_homogene;

    % load mouse data
    load ./data/original_data/emb_mouse_exp mouse_expgene mouse_exp mouse_y;
    [~,IB,mousegene_list] = intersect(upper(mouse_expgene),mouse_homogene);
    mouse_exp = mouse_exp(IB,:);


    % load human_gene_sets
    load ./data/mouse_gene_sets mouse_gene_sets_ID;

    % conduct GSEA
    opts.weight = 1;
    opts.num_permutation = 10000;
    opts.sigma = 1;
    opts1 = opts; opts2 = opts;
    opts1.sigma = 0.5; opts2.sigma = 2;

    mouse_corr_value = shufflecorr(mouse_exp,mouse_y,opts.num_permutation);


    B = opts.num_permutation;

    for i = 1:length(mouse_gene_sets_ID)
        i
    try
        [mpval(i),MES(i,1:B+1)] = GESA_pheno_fix(mousegene_list,mouse_corr_value,mouse_gene_sets_ID{i},opts);
    end

    end

    save('./data/emb_mouse_gsea', 'mpval', 'MES','opts','-v7.3');

end