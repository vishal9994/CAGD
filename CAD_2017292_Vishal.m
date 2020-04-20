clc
clear all
axis([0 10 0 10]) %WORKSPACE
hold on
xy = []; %Initializing the empty matrix
n = 0;


% Loop, picking up the points for drawing polygon
but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'r*','LineWidth',1.5)%point Spec for the drawn polygon
    n = n+1;
    xy(:,n) = [xi;yi];
    plot(xy(1,:),xy(2,:),'g-','LineWidth',1.5); %Line Spec for the drawn polygon   
end

xy1 = [xy xy(:,1)];%Making first point as the last point and closing the polygon
plot(xy1(1,:),xy1(2,:),'g-','LineWidth',1.5); %Plotting the whole polygon



% Input Point for checking
[xii,yii,but] = ginput(1);
    plot(xii,yii,'black*','LineWidth',1.5)
    hold off
    

    
%Applying parametric equation and finding coordinates

num=0;
aa=[];
for i=1:n-1
   t=(yii-xy1(2,i))/(xy1(2,i+1)-xy1(2,i)); %Finding value of t
   if (t<1)&&(t>0)                         %Limits for a valid t
        num=num+1;                         
        aa(num)=t*(xy1(1,i+1)-xy1(1,i))+xy1(1,i); %Storing x coordinates
   end     
end


aa=[aa xii];         %Storing the selected point as last coordinate
ab=sort(aa);         %Sorting the matrix
index=find(ab==xii);     %Finding psition of selected point in matrix
if rem(index,2)==0       %Checking if odd or even
    txt = [ 'INSIDE ']; %FOr Inside even
    text(4,9,txt)
else
    txt = ['OUTSIDE'];  %FOr Outside odd
text(4,9,txt)
end
