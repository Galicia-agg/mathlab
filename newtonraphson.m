function raiz = newtonraphson (def, x0, c)
syms x
f = sym(def);
df = diff(f);
fx = inline (char(f));
dfx = inline (char (df));
for k = 1:c
    x0 = x0-fx(x0)/dfx(x0);
    k = k+1;
    fprintf ('Resuldado');
    raiz = x0;
end
%if k>c
%    raiz = 'No Converge';
%else
%   raiz = x0;
%end