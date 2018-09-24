% CDF plot for the symmetric alpha stable distribution with different alpha
% parameters.
clear;
clc;
X=Nas2(0.25,0,10^5);
ecdf(X);
hold on;
axis([-4 4 0 1]);
X=Nas2(0.5,0,10^5);
ecdf(X);
X=Nas2(0.75,0,10^5);
ecdf(X);
X=Nas2(1,0,10^5);
ecdf(X);
X=Nas2(1.25,0,10^5);
ecdf(X);
X=Nas2(1.5,0,10^5);
ecdf(X);
X=Nas2(1.75,0,10^5);
ecdf(X);
X=Nas2(2,0,10^5);
ecdf(X);
hold off;