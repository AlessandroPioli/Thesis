function [X,t]=CPP(b,lambda,steps,T1,T2)
    if ~exist('T2','var')
      T2 = 1;
    end
    t=T1/steps:T1/steps:T1;
    N=poissrnd(lambda*T1,[1,T2]);
    J=normrnd(0,1,[1,sum(N)]);
    Jt=unifrnd(0,T1,[1,sum(N)]);
    c=cumsum(N);
    a={};
    a{1,1}=J(1:c(1));
    a{1,2}=Jt(1:c(1));
    for i=2:length(N)
        a{i,1}=J(c(i-1)+1:c(i));
        a{i,2}=Jt(c(i-1)+1:c(i));
    end
    X=b*t.*ones(T2,1);
    for i=1:T2
        d=length(a{i});
        for j=1:d
           k=find(a{i,1}(j).*(t>a{i,2}(j))); 
           X(i,k(1))=X(i,k(1))+a{i,1}(j);
        end
    end
    X=cumsum(X');
end