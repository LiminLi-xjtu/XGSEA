

function [ Pre_linear,Pre_linear_es] = XGSEA_Epm( mes, Xsn, Xtn)

 nt = size(Xsn,2);


    for k = 1:size(mes,2)
        
        %%%%% train regression model on poditive and negative E scrors
        %%%%% respectively
        idng = find(mes(:,k)<0);
        nng = length(idng);
        idpo = setdiff(1:nt,idng);
        npo = length(idpo);
        Bng = regress(mes(idng,k),[ones(nng,1),Xsn(:,idng)']);
        Bpo = regress(mes(idpo,k),[ones(npo,1),Xsn(:,idpo)']);
        
        
        %%%%% predict ES for human by the closet one
        reg = cal_dist( idng,idpo,Xsn,Xtn );
        reg_neg = find(reg==1); ntng = length(reg_neg);
        reg_pos = find(reg==2); ntpo = length(reg_pos);
        Xtn_neg = Xtn(:,reg_neg);           
        Xtn_pos = Xtn(:,reg_pos);
        Pre_es_ng = [ones(ntng,1),Xtn_neg'] * Bng;
        Pre_es_po = [ones(ntpo,1),Xtn_pos'] * Bpo;
        Pre_linear_es(reg_neg,k) = Pre_es_ng;
        Pre_linear_es(reg_pos,k) = Pre_es_po;           
                   
    end        

    %%%%% compute p_value for human
    
    Pre_linear = gsea_pval(Pre_linear_es(:,1),Pre_linear_es);
%     Pre_linear = -log10(Pre_linear);


end

