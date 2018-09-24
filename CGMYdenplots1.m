%Graphs related to changes of C

subplot(2,2,[1,2])
X=-10:0.01:10;
plot(X,cgmyden(X,1,1,1,1))
hold on
plot(X,cgmyden(X,2,1,1,1))
plot(X,cgmyden(X,4,1,1,1))
plot(X,cgmyden(X,6,1,1,1))
axis([-4 4 0 5])

subplot(2,2,3)
plot(X,cgmyden(X,1,1,1,1))
hold on
plot(X,cgmyden(X,2,1,1,1))
plot(X,cgmyden(X,4,1,1,1))
plot(X,cgmyden(X,6,1,1,1))
axis([-2 0 0 1])

subplot(2,2,4)
plot(X,cgmyden(X,1,1,1,1))
hold on
plot(X,cgmyden(X,2,1,1,1))
plot(X,cgmyden(X,4,1,1,1))
plot(X,cgmyden(X,6,1,1,1))
axis([-0.5 0.5 4^4 6^4])