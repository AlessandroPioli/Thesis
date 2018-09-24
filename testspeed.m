et=zeros(1,100);
for i=1:100
    tic;
    [X]=CGMY(1,2,1,1.1,3,1,10^3);
    et(i)=toc;
end
