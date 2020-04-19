

function main_generating_Xdata

    clear

    load('./data/original_data/human_gene_sets','human_gene_sets_ID');
    load('./data/mouse_gene_sets');
    load('./data/original_data/HomologyData')

    %%%%% construct Xs, Xt and W
    Xs = constructXs(mouse_gene_sets_ID,mouse_homogene);
    a = find(sum(Xs,2));
    Xs = Xs(a,:);

    Xt = constructXt(human_gene_sets_ID,human_homogene);
    b = find(sum(Xt,2));
    Xt = Xt(b,:);

    K = constructW(mouse_gene_sets_ID,human_gene_sets_ID,mouse_homogene,human_homogene,G);


    save ./data/alldata_X Xs Xt K


end
