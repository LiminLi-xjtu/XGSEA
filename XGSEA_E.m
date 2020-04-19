

function [ Pre_linear,Pre_linear_es ] = XGSEA_E( mes, Xsn, Xtn)


    ns = size(Xsn,2);
    nt = size(Xtn,2);
    %%%%%%%%%%%%%%%%%%%%%%%%%%% predict ES for human
    
    for k = 1:size(mes,2)
        B = regress(mes(:,k),[ones(ns,1),Xsn']);
        Pre_linear_es(:,k) = [ones(nt,1),Xtn'] * B;     
    end
     
    %%%%%%%%%%%%%%%%%%%%%%%%%% compute p_value for human
  
    Pre_linear = gsea_pval(Pre_linear_es(:,1),Pre_linear_es);   
%   Pre_linear = -log10(Pre_linear);
     

end

