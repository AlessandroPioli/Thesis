X = 0:0.01:3; %range of x to compute the theoretical pdf
lambda=1;mu=1;
% Plot of the PDF of the Inverse Gaussian distribution with different
% parameters as reported on wikipedia.

fx_theory = (lambda./(2*pi*X.^3)).^(1/2).*exp(-lambda*(X-mu).^2./(2*mu^2*X));
plot(X,fx_theory,'blue','Linewidth',1.5); %plot computed theoretical PDF
hold on;
lambda=0.2;mu=1;
fx_theory = (lambda./(2*pi*X.^3)).^(1/2).*exp(-lambda*(X-mu).^2./(2*mu^2*X));
plot(X,fx_theory,'green','Linewidth',1.5); %plot computed theoretical PDF
lambda=3;mu=1;
fx_theory = (lambda./(2*pi*X.^3)).^(1/2).*exp(-lambda*(X-mu).^2./(2*mu^2*X));
plot(X,fx_theory,'red','Linewidth',1.5); %plot computed theoretical PDF
lambda=1;mu=3;
fx_theory = (lambda./(2*pi*X.^3)).^(1/2).*exp(-lambda*(X-mu).^2./(2*mu^2*X));
plot(X,fx_theory,'Linewidth',1.5); %plot computed theoretical PDF
lambda=0.2;mu=3;
fx_theory = (lambda./(2*pi*X.^3)).^(1/2).*exp(-lambda*(X-mu).^2./(2*mu^2*X));
plot(X,fx_theory,'Linewidth',1.5); %plot computed theoretical PDF
