function [X,t] = BM(mu,sigma,steps,T1,T2)
    if ~exist('T2','var')
      T2 = 1;
    end
    if sigma > 0
        Z=normrnd(0,1,[T2,steps]);
        X=mu*(T1/steps)+sqrt((T1/steps))*sigma.*Z;
        X=cumsum(X,2);
        t=T1/steps:T1/steps:T1;
        return
    else
        X = "Error";
        return
    end
end