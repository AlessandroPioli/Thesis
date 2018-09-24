%Graphs related to changes of Y
hold off

subplot(2,2,[1,2])
X=-10:0.01:10;
plot(X,cgmyden(X,1,1,1,0.5))
hold on
plot(X,cgmyden(X,1,1,1,1))
plot(X,cgmyden(X,1,1,1,1.5))
plot(X,cgmyden(X,1,1,1,2))
axis([-1.5 1.5 0 10])
legend("Y=0.5","Y=1","Y=1.5","Y=2")

subplot(2,2,3)
plot(X,cgmyden(X,1,1,1,0.5))
hold on
plot(X,cgmyden(X,1,1,1,1))
plot(X,cgmyden(X,1,1,1,1.5))
plot(X,cgmyden(X,1,1,1,2))
axis([-1.5 -0.5 0 2])
legend("Y=0.5","Y=1","Y=1.5","Y=2")
subplot(2,2,4)
plot(X,cgmyden(X,1,1,1,0.5))
hold on
plot(X,cgmyden(X,1,1,1,1))
plot(X,cgmyden(X,1,1,1,1.5))
plot(X,cgmyden(X,1,1,1,2))
axis([0.5 1.5 0 2])
legend("Y=0.5","Y=1","Y=1.5","Y=2")
