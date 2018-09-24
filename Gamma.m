%Gamma random variable generator.
function res = Gamma(alpha,beta)
    if alpha <1
       while true
           U=unifrnd(0,1);
           V=unifrnd(0,1);
           X=U^(1/alpha);
           Y=V^(1/(1-alpha));
           if(X+Y>1)
               break;
           end
       end
       E=exprnd(1);
       res=((X*E)/(X+Y))/beta;
       return
    else
        while true
            b=alpha-1;
            c=3*alpha-3/4;
            U=unifrnd(0,1);
            V=unifrnd(0,1);
            W=U*(1-U);
            Y=sqrt(c/W)*(U-1/2);
            X=b+Y;
            Z=64*W^3*V^3;
            if X>0
                Z=64*W^3*V^2;
                if(Z<=1-(2*Y^2)/X)
                    res=X/beta; 
                    break;
                elseif(log(Z)<=2*(b*log(X/b)-Y))
                    res=X/beta;
                    break;
                end 
            end
        end
    end
end