
function pre_pval = XGSEA_D( mp,Xs,Xt )

    ns = size(Xs,2);
    nt = size(Xt,2);
    mp = log(mp./(1-mp));
    B = regress(mp',[ones(ns,1),Xs']);
    pre_pval = [ones(nt,1),Xt'] * B;
    pre_pval = 1./(1+exp(-pre_pval));
%     pre_pval = -log10(pre_pval);

end

