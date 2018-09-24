% Kou model simulator.
function [X,t] = Kou(alpha,beta,mu,sigma,lambda,q,steps,T1,T2)
    Z=normrnd(0,1,[T2,steps]);
    N=poissrnd(lambda,[T2,steps]);
    K=binornd(N,q,[T2,steps]);
    R1=gamrnd(K*alpha,beta,[T2,steps]);
    R2=gamrnd((N-K)*alpha,beta,[T2,steps]);
    if(beta==0)
        M=0;
    else
        M=R1-R2;
    end
    X=mu+sigma*Z+M;
    X=cumsum(X,2);
    t=T1/steps:T1/steps:T1;
end