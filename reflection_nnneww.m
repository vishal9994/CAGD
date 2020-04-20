clc
clear all
%axis([0 10 0 10])  %WORKSPACE
hold on
xy = [];
n = 0;
nn=0;
butt=1;
%SELECTING POINTS FROM THE GUI
for i = 1:2
    [xi,yi,butt] = ginput(1);
    plot(xi,yi,'black*')
    n = n+1;
    xy(:,n) = [xi;yi];
end

%PLOTTING THE LINE
plot(xy(1,:),xy(2,:),'magenta-','LineWidth',1.5);

but = 1;
while but == 1
    [xii,yii,but] = ginput(1);
    plot(xii,yii,'r*','LineWidth',1.5)
    nn = nn+1;
    xy1(:,nn) = [xii;yii];
    plot(xy1(1,:),xy1(2,:),'g-','LineWidth',1.5);
    
end
xy1 = [xy1 xy1(:,1)];
plot(xy1(1,:),xy1(2,:),'g-','LineWidth',1.5);

xcr=xy1(1,:);
ycr=xy1(2,:);

%SELECT THE POINTS TO BE REFLECTED
%[xii,yii,but] = ginput(1);
%    plot(xii,yii,'bo')
    
%STORING THE DATA
a=xy(1,2)-xy(1,1);
b=xy(2,1)-xy(2,2);
c=xy(1,1).*(-b)-xy(2,1).*a;
m1=-b/a;
m=atan(m1)*180/3.14;
mn=(90-m)*3.14/180;
d=-m1.*xy(1,1)+xy(2,1);
%REFLECTED POINTS COORDINATES
 %point1= (xcr.*(a.^2-b.^2)-2.*b.*(a.*ycr+c))/(a.^2+b.^2);
 %point2= (ycr.*(-a.^2+b.^2)-2.*a.*(b.*xcr+c))/(a.^2+b.^2);
 %plot(point1,point2,'-ro');
 
 T1=[1 0 0 0;
    0 1 0 -d;
    0 0 1 0;
    0 0 0 1];

TR=[cos(mn) -sin(mn) 0 0;
    sin(mn) cos(mn) 0 0;
    0 0 1 0;
    0 0 0 1];

R=[-1 0 0 0;
   0 1 0 0;
   0 0 1 0;
   0 0 0 1];
xy1(3,:)=1;
xy1(4,:)=0;
%xy1(:,5)=[];
result=inv(T1)*inv(TR)*R*TR*T1*xy1;
xr=[result(1,:)];
xy2=[result(2,:)];
plot(xr,xy2,'-m*')
hold off


 
hold off