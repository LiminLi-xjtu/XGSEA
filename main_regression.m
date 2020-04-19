
function [pre_pv1,pre_pv2,pre_pv3] = main_regression

 
    clear;
    load res_main_domain.mat Xsn Xtn
    load ./data/emb_mouse_gsea mpval MES

    %%%%% run regression on XGSEA_D
    pre_pv1  = XGSEA_D( mpval, Xsn, Xtn);


    %%%%% run regression on XGSEA_E
    pre_pv2  = XGSEA_E( MES, Xsn, Xtn);


    %%%%% run regression on XGSEA_Epm
    pre_pv3  = XGSEA_Epm( MES, Xsn, Xtn);

end



