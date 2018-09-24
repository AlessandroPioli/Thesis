function [X,t] = VGG(beta,mu,sigma,steps,T1,T2)
    % Simulate the subordinated Brownian Motion as explained in Glasserman
    if ~exist('T2','var')
      T2 = 1;
    end
    Y=gamrnd((T1/steps)/beta,beta,[T2,steps]);
    Z=normrnd(0,1,[T2,steps]);
    X=mu*Y+sigma*sqrt(Y).*Z;
    X=cumsum(X,2);
    t=T1/steps:T1/steps:T1;
    return
end