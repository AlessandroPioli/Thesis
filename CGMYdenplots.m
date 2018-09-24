%CGMY's density plots
hold off

figure
subplot(2,2,[1,2])
X=-10:0.01:10;
plot(X,cgmyden(X,1,1,1,1))
hold on
plot(X,cgmyden(X,0.5,1,1,1))
plot(X,cgmyden(X,2,1,1,1))
plot(X,cgmyden(X,4,1,1,1))
axis([-2.5 2.5 0 5])
legend(["C=1" "C=0.5" "C=2" "C=4"])

subplot(2,2,3)
X=-10:0.01:10;
plot(X,cgmyden(X,1,1,1,1))
hold on
plot(X,cgmyden(X,1,0.5,1,1))
plot(X,cgmyden(X,1,2,1,1))
plot(X,cgmyden(X,1,4,1,1))
axis([-1 1 0 4])
legend(["G=1" "G=0.5" "G=2" "G=4"])

subplot(2,2,4)
X=-10:0.01:10;
plot(X,cgmyden(X,1,1,1,1))
hold on
plot(X,cgmyden(X,1,1,0.5,1))
plot(X,cgmyden(X,1,1,2,1))
plot(X,cgmyden(X,1,1,4,1))
axis([-1 1 0 4])
legend(["M=1" "M=0.5" "M=2" "M=4"])
