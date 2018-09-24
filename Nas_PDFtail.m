% Alpha-Stable tail behaviour
X=-4:0.1:4;
plot(X,stblpdf(X,0.5,0,1,0));
hold on
plot(X,stblpdf(X,1,0,1,0));
plot(X,stblpdf(X,1.5,0,1,0));
% alpha=2 has the same pdf as N(0,1/sqrt(2))
plot(X,stblpdf(X,2,0,1,0)); 
axis([2 4 0 0.1])
hold off