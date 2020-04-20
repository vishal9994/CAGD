
clc
clear all
axis([0 10 0 10])
hold on
n=input('Enter no. of points  ');
n1=n-1;
if w==1
    axis([0 100 0 100])
    [p]=ginput(n);
end
but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'r*','LineWidth',1.5)
    n = n+1;
    p(:,n) = [xi;yi];
    
end
    
for    i=0:1:n1
sigma(i+1)=factorial(n1)/(factorial(i)*factorial(n1-i));  % for calculating (x!/(y!(x-y)!)) values 
end
l=[];
UB=[];
for u=0:0.002:1
for d=1:n
UB(d)=sigma(d)*((1-u)^(n-d))*(u^(d-1));
end
l=cat(1,l,UB);                                      %catenation 
end
P=l*p;
line(P(:,1),P(:,2))
line(p(:,1),p(:,2))
