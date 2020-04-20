function [x,y,s] = interpt(a1,a2,b1,b2)
ax = a1(1) - a2(1);
ay = a2(2) - a1(2);
ca = ax*a1(2)+ay*a1(1);

bx = b1(1) - b2(1);
by = b2(2) - b1(2);
cb = bx*b1(2)+by*b1(1);

det = ax*by-ay*bx;
y = (by*ca-ay*cb)/det;
x = (ax*cb-bx*ca)/det;
if( min(a1(1),a2(1))<=x && x<=max(a1(1),a2(1)) && (min(a1(2),a2(2))<=y && y<=max(a1(2),a2(2))) && (min(b1(1),b2(1))<=x && x<=max(b1(1),b2(1))) && (min(b1(2),b2(2))<=y && y<=max(b1(2),b2(2))) )
    s=1;
else
    s=0;
end
    
end