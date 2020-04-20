clc
clear all
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
    plot(xi,yi,'r*','LineWidth',1.5)
    n = n+1;
    xy(:,n) = [xi;yi];
    plot(xy(1,:),xy(2,:),'g-','LineWidth',1.5);
    
end
xy = [xy xy(:,1)];
plot(xy(1,:),xy(2,:),'g-','LineWidth',1.5);
hold off
xcr=xy(1,:);
ycr=xy(2,:);

area = 1/2*sum(xcr.*ycr([2:end,1])-ycr.*xcr([2:end,1]));
%fprintf('Area of polygon is: %.2f\n', area)
txt = ['Area of polygon is ',num2str(area)];
text(4,9,txt)
%pa = @polyarea
%for verification
%area2 = pa(xcr,ycr);
%fprintf('Area of preverified polygon is: %.2f\n', area2)