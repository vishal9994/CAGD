clc
clear all
axis([-10 10 -10 10])  %WORKSPACE
hold on
xy = [];
n = 0;

%SELECTING POINTS FROM THE GUI
for i = 1:2
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'black*')
    n = n+1;
    xy(:,n) = [xi;yi];
end

%PLOTTING THE LINE
plot(xy(1,:),xy(2,:),'magenta-','LineWidth',1.5);

%SELECT THE POINTS TO BE REFLECTED
[xii,yii,but] = ginput(1);
    plot(xii,yii,'bo')
    
%STORING THE DATA
a=xy(1,2)-xy(1,1);
b=xy(2,1)-xy(2,2);
c=xy(1,1).*(-b)-xy(2,1).*a;

%REFLECTED POINTS COORDINATES
 point1= (xii.*(a.^2-b.^2)-2.*b.*(a.*yii+c))/(a.^2+b.^2);
 point2= (yii.*(-a.^2+b.^2)-2.*a.*(b.*xii+c))/(a.^2+b.^2);
 plot(point1,point2,'ro');
 
hold off