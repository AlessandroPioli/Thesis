function [Z,t] = Nas(alpha,beta,steps,T1,T2)
   % Non symmetric alpha stable distribution algorithm found in Tankov
   % paper about Tilted/Tempered stable distributions.
   if ~exist('T2','var')
      T2 = 1;
    end
   t=T1/steps:T1/steps:T1;
   V=unifrnd(-pi/2,pi/2,[T2,steps]);
   W=exprnd(1,[T2,steps]);
   Bab=atan(beta*tan(pi*alpha/2))/alpha;
   Sab=(1+beta^2*tan(pi*alpha/2)^2)^(1/(2*alpha));
   Z=(T1/steps)^(1/alpha)*Sab*sin(alpha*(V+Bab))./(cos(V).^(1/alpha))...
       .*(cos(V-alpha*(V+Bab))./W).^((1-alpha)/alpha).*(alpha~=1)+2/pi...
       *((pi/2+beta*V).*tan(V)-beta*log((W.*cos(V))./...
       (pi/2+beta*V))).*(alpha==1);
   Z=cumsum(Z,2);
end
