axis([-10 10 -10 10])
hold on
clc
clear all
xy = [];
n = 0;
% Loop, picking up the points.
%disp('Left mouse button to select points.')
%disp('Right mouse button to select last point.')

but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'b*')
    n = n+1;
    xy(:,n) = [xi;yi];
    plot(xy(1,:),xy(2,:),'b-.','LineWidth',1.5);
  
end
ii=n;
xy1 = [xy xy(:,1)];
q2=plot(xy1(1,:),xy1(2,:),'b-','LineWidth',1.5);
%plot(xy1(1,:),xy1(2,:),'b-','LineWidth',1.5,'buttondownfcn',{@Mouse_Callback,'move'});
%moveit2(q2);

op=[];
pp=0;
k=0;
a=-1;
nott=1;
while nott==1
    [xxi,yyi,nott] = ginput(1);
    plot(xxi,yyi,'g*')
    pp = pp+1;
    op(:,pp) = [xxi;yyi];
    plot(op(1,:),op(2,:),'g-.','LineWidth',1.5);
    a=a+1;
    
   
end
m=pp;
xyy1 = [op op(:,1)];
q1=plot(xyy1(1,:),xyy1(2,:),'g-.','LineWidth',1.5);
%moveit2(q1);

%[xii,yii,but] = ginput(1);
%    plot(xii,yii,'cyan*')
xcr1=xyy1(1,:);
ycr1=xyy1(2,:);
for i = 1:ii
    for j = 1:pp
        k = k+ 1;
        i;
        j;
        a= ((xy1(2,i)-xyy1(2,j)).*(xyy1(1,j+1)-xyy1(1,j))-(xy1(1,i)-xyy1(1,j)).*(xyy1(2,j+1)-xyy1(2,j)));
        b=((xy1(1,i+1)-xy1(1,i)).*(xyy1(2,j+1)-xyy1(2,j)))-((xy1(2,i+1)-xy1(2,i)).*(xyy1(1,j+1)-xyy1(1,j)));
        u=a/b;
        s=(u.*(xy1(1,i+1)-xy1(1,i))+(xy1(1,i)-xyy1(1,j)))/(xyy1(1,j+1)-xyy1(1,j));
        %a1= ((xy1(1,i+1)-xy1(1,i)).*(xyy1(2,j)-xy1(2,i)))+((xy1(2,j+1)-xy1(2,j).*(xy1(1,i)-xyy1(1,j))));
      %  b1=((xyy1(1,j+1)-xyy1(1,j)).*(xy1(2,i+1)-xy1(2,i))-((xyy1(2,j+1)-xyy1(2,j)).*(xy1(1,i+1)-xy1(1,i))))
        %u1=a1/b1
        
        if u>0&&u<1&&s>0&&s<1
            %px=u.*xy1(1,i+1)+(1-u).*xy1(1,i)
            %py=u.*xy1(2,i+1)+(1-u).*xy1(2,i)
            pxx=u.*xy1(1,i+1)+(1-u).*xy1(1,i);
            pyy=u.*xy1(2,i+1)+(1-u).*xy1(2,i);
            %pxx=u1.*xyy1(1,j+1)+(1-u1).*xyy1(1,j)
            %pyy=u1.*xyy1(2,j+1)+(1-u1).*xyy1(2,j)
            h1=plot(pxx,pyy,'ko');
            set(h1, 'markerfacecolor', get(h1, 'color'));
           

        end
        % j=1; i
     end
end



