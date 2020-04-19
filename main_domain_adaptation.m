

function main_domain_adaptation

    clear;

    global Xs Xt G L sigma;

    load ./data/alldata_X

    %%%%%%%%%%%%%%%%%%%%%%%% QR decomposition on Xs and Xt

    Xs = normalize(Xs,1);
    Xt = normalize(Xt,1);

    [~,Xs] = qr(Xs,0);
    [~,Xt] = qr(Xt,0);

    [ps,ns] = size(Xs);
    [pt,nt] = size(Xt);

    %%%%%%%%%%%%%%%%%%%%%%%%%%% set options

    option.dim = 5; %[5,10,20,30,40,50]
    option.ftol = 1e-6;
    option.gtol = 1;
    option.Rangelambda = 1e-2; %[1e-2,1e-1,1,1e1,1e2];
    option.fast = 0;


    %%%%%%%%%%%%%%%%%%%% compute G_ori

    G_ori = ComputeG(Xs,Xt,K);

    %%%%%%%%%%%%%%%%%%%%%%%%%compute L

    L = ComputeL(ones(ns,1),ones(nt,1));

    %%%%%%%%%%%%%%%%% compute sigma

    if ps == pt
        D = dist2(Xs',Xt');
        sigma = median(D(D~=0));
    else
        D1 = dist2(Xs',Xs');
        D2 = dist2(Xt',Xt');
        sigma1 = median(D1(D1~=0));
        sigma2 = median(D2(D2~=0));
        sigma = mean([sigma1 sigma2]);
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% initialization

    Y0 = [eye(ps,option.dim); eye(pt,option.dim)]/sqrt(2);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% compute Xsn Xtn

    lambda = option.Rangelambda;
    G = lambda*G_ori;
    [Xsn, Xtn] = iHMMD_my(Y0,option);


    save('res_main_domain','Xsn', 'Xtn');


end

























