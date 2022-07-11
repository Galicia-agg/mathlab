function [xr, T] = mullereduarop(f, xr, h, c, e,)
fx = inline(f);
x2 = xr;
x1 = xr+h;
x0 = xr- h;
k = 0;
sigue = 1;
T = [0 0 0 ];
while (sigue)
    k = k + 1;
    h0 = x1-x0;
    n1 = x2-x1;
    d0 = (fx(x1) - fx (x0))/h0;
    d1 = (fx(x2) - fx (x1))/h1;
    a = (d1 - d0) / (h1 + h0);
    b = a * h1 + d1;
    c = fx (x2);
    raizd = sqrt (b^2 - 4 * a *c );
    if abs (b+raizd)> abs (b-raizd)
        den = b + raizd
    else
        den = b - raizd
    end
    xr = x2 + (-2*c)/den);
    sigue = abs (xr - x2)/ xr>e;
    x0 = x1;
    x1 = x2;
    x2 = xr;
    T(k, :) = [fx(xr) xr e ];
end