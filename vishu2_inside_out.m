axis([0 10 0 10])
hold on
xy = [];
n = 0;
% Loop, picking up the points.
disp('Left mouse button to select points.')
disp('Right mouse button to select last point.')
but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'ro')
    n = n+1;
    xy(:,n) = [xi;yi];
    plot(xy(1,:),xy(2,:),'b-.','LineWidth',1.5);
  
end
xy1 = [xy xy(:,1)];
plot(xy1(1,:),xy1(2,:),'b-.','LineWidth',1.5);

[xii,yii,but] = ginput(1);
    plot(xii,yii,'cyan*')
xcr=xy1(1,:);
ycr=xy1(2,:);

%OLD AREA
area = 1/2*sum(xcr.*ycr([2:end,1])-ycr.*xcr([2:end,1]));
fprintf('Area of polygon is: %.2f\n', area)
txt = ['Area of old polygon is ',num2str(area)];
text(0,9,txt)

%NEW AREA
xy1 = [xy xy(:,1)];
xcr2=xy(1,:);
ycr2=xy(2,:);
xcr2=[xcr2 xii]
ycr2=[ycr2 yii];
xcr2=[xcr2 xcr2(:,1)]
%ycr2=[ycr2 ycr2(:,1)]


%area2 = 1/2*sum(xcr2.*ycr2([2:end,1])-ycr2.*xcr2([2:end,1]));
%txt2 = ['Area of new polygon is ',num2str(area2)];
%text(0,6,txt2)
%if (area < area2)
%    disp('Outside')
%    text(0,9,'Outside')
%else (area >= area2)
%    disp('Inside')
%    text(0,9,'Inside')
%end


