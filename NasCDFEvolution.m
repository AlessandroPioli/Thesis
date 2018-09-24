% Non-symmetric alpha stable CDF evolution with fixed paramter alpha = 0.5
% and moving parameter beta.
clear;
clc;
X=Nas2(0.5,-0.25,10^5);
ecdf(X);
hold on;
axis([-4 4 0 1]);
X=Nas2(0.5,-0.5,10^5);
ecdf(X);
X=Nas2(0.5,-0.75,10^5);
ecdf(X);
X=Nas2(0.5,-1,10^5);
ecdf(X);
X=Nas2(0.5,0,10^5);
ecdf(X);
X=Nas2(0.5,0.25,10^5);
ecdf(X);
axis([-4 4 0 1]);
X=Nas2(0.5,0.5,10^5);
ecdf(X);
X=Nas2(0.5,0.75,10^5);
ecdf(X);
X=Nas2(0.5,1,10^5);
ecdf(X);
hold off;