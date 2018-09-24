% Merton's model simulator.
function [X,t,G,Gp,Jt] = Merton(b,lambda,mu,delta,sigma,steps,T1,T2)
    %mu is the jumps mean and delta is the jumps standard deviation.
    if ~exist('T2','var')
      T2 = 1;
    end
    % Notice vectorial simuation, that allow us to avoid loops.
    G=normrnd(0,sqrt((T1/steps)*sigma),[T2,steps]);
    Np=poissrnd(lambda*T1,[T2,1]);
    Jt=unifrnd(0,T1,[T2,max(Np)]);
    Gp=normrnd(mu,sqrt(T1/steps)*delta,[T2,max(Np)]);
    for i=1:T2
        if Np(i)~=max(Np)
            for j=Np(i)+1:max(Np)
                Gp(i,j)=0;
            end
        end
    end
    t=T1/steps:T1/steps:T1;
    X=zeros(T2,steps);
    X(:,1)=b*t(1).*ones(T2,1)+G(:,1)+sum(Gp.*(Jt<t(1)),2);
    for i=2:steps
        X(:,i)=X(:,i-1)+b*t(i).*ones(T2,1)+G(:,i)+...
            sum(Gp.*(t(i-1)<Jt & Jt<t(i)),2);
    end
end