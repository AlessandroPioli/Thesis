%Inverse Gaussian random variable generator.
function res = IG(mu,lambda,N1,N2)
    if ~exist('N1','var')
      N1 = 1;
    end
    if ~exist('N2','var')
      N2 = 1;
    end
    if(mu>0 && lambda>0)
        % Vectorial random variable generator for Normal and Uniform
        % variates, allow us to avoid loops.
        N=normrnd(0,1,[N2,N1]);
        Y=N.^2;
        X1=mu+(mu^2.*Y)/(2*lambda)-(mu)/(2*lambda)*sqrt(4*mu*lambda.*Y+mu^2.*Y.^2);
        U=unifrnd(0,1,[N2,N1]);
        res=X1.*(U<=mu./(mu+X1))+(mu^2./X1).*(U>mu./(mu+X1));
        return
    else
        res="Error";
    end
end