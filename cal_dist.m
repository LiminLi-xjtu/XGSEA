


function regression = cal_dist( idneg,idpos,Xs,Xt )

 [~,nt] = size(Xt);
 Xs_neg = Xs(:,idneg);
 Xs_pos = Xs(:,idpos);

 mXs_neg = mean(Xs_neg,2);
 mXs_pos = mean(Xs_pos,2);
 MXs_neg = repmat(mXs_neg,[1,nt]);
 MXs_pos = repmat(mXs_pos,[1,nt]);
 delta11  = Xt-MXs_neg;
 delta12  = Xt-MXs_pos;
 for i = 1:size(delta11,2)
     dis11(i,1) = norm(delta11(:,i),2)^2;
     dis12(i,1) = norm(delta12(:,i),2)^2;
 end
 dis1 = [dis11,dis12];
 [~,reg1] = min(dis1,[],2);
 
 regression = reg1; 
 
end

