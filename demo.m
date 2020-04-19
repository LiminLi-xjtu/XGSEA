
%%%%%%%%% Attation
% please add all the subfolders in XGSEA folder to path of your matlab

%%%%%%%%% generating mouse gene sets

main_generate_mouse_gene_sets

%%%%%%%%% STEP1: calculate enrichment scores and p-values for mouse gene sets

main_GSEA

%%%%%%%%%% conduct Xs,Xt and W

main_generating_Xdata

%%%%%%%% STEP2: run domain adaptation on Xs Xt W

main_domain_adaptation

%%%%%%% STEP3: run regression model

[pre_pv1,pre_pv2,pre_pv3] = main_regression;




