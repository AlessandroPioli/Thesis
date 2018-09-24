% MATLAB adaptation of Tankov's C++ algorithm.
function[X,Zt,dZ]=CGMY(C,G,M,Y,ex,n,T)    
    warning('off','all');
    A=(G-M)/2;
    B=(G+M)/2;
    % epsilon represents the truncation threshold
    epsilon=power(10,-ex); 
    K=C*2^(-Y/2)*sqrt(pi)/gamma(Y/2+0.5); 
    d=K*epsilon^(1-Y/2)/(1-Y/2) ; 
    lambda=2*K*epsilon^(-Y/2)/Y; 
    % The curly brackets indicate a multi dimensional array
    % This allows us to save trajectories of different dimension
    % using the same structure
    X={};
    for i =1:n
        tj=0 ;
        while tj(end)<T
            U2=rand(1,2*round(lambda*(T)));
            wt=-log(U2)/lambda;
            tj =[ tj tj(end)+cumsum(wt)];
        end
        tj=tj(tj<T);
        U1=rand(1,length(tj)-1);
        yj=[0,epsilon./(U1).^(2/Y)];
        U3=rand(size(yj));
        Zt=d*tj+cumsum(yj.*(f(yj,Y,A,B)>U3),2);
        dZ=[0,diff(Zt')'];
        X{i,1}=cumsum(A*dZ+sqrt(dZ).*randn(size(dZ)));
        X{i,2}=T/length(tj):T/length(tj):T;
    end
end
%This auxiliary functions help us replicate the rejection function
function out=f(t,Y,A,B)
    out=2^(Y/2)*gamma(Y/2+0.5)*exp(A^2*t/2-B^2*t/4).*...
        D(-Y,B*sqrt(t))/sqrt(pi);
end

function out=D(nu,z)
    out=2^(nu/2).*U(-nu/2,0.5,z.^2/2).*exp(-z.^2/4);
end

function out=U(a,b,z)
    out=zeros(size(z));
    cut =10;
    out(z<cut)=(pi/sin(pi*b))*(HYPERGEOM(a,b,z(z<cut))/(gamma( a-b+1)*...
        gamma(b))-z(z<cut).^(1-b).*HYPERGEOM(a-b+1,2-b,z(z<cut))/...
        (gamma(a)*gamma(2-b)));
    Z=z(z>=cut);
    temp=zeros(size(Z));
    for i=1:length(Z)
        fun=@(t) exp(-Z(i)*t).*t.^(a-1).*(1+ t).^(b-a-1);
        % The following line contains the weakest link of the 
        % computation, the numerical solution of the previously
        % stated integral
        temp(i)= quad(fun,0,1E6,1E-4)/gamma(a);
    end
    out(z>=cut)=temp ;
end

%Hypergeometric random variable generator
function out=HYPERGEOM(a,b,z,tol)
    if nargin<4
        tol=1E-3;
    end
    out=1;
    term=ones(size(z));
    n=1;
    while max(term)>tol || n<100
        term=term.*((a+n-1)*z/(n*(b+n-1)));
        out=out+term ;
        n=n+1;
    end
end