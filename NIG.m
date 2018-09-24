% Normal Inverse Gaussian process generator.
function [X,t] = NIG(k,sigma,theta,steps,T1,T2)
    tic
    if ~exist('T2','var')
      T2 = 1;
    end
    S=IG((T1/steps),(T1/steps)^2/k,steps,T2);
    N=normrnd(0,1,[T2,steps]);
    X=sigma*N.*sqrt(S)+theta*S;
    X=cumsum(X,2);
    t=T1/steps:T1/steps:T1;
    toc
    return
end