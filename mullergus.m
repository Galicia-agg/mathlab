%Metodo de Muller
fprintf('Metodo de Muller \n');
i =input('Ingresa el numero de iteracion que vas a ser:');
x0=input('Ingrese x0:');
x1=input('Ingrese x1:');
x2=input('Ingrese x2:');
h0 = x1-x0;
h1 = x2-x1;

fprintf('Se Opera el la f(x)sustituyendo x0, x1 y x2 en la funcion\n');
fprintf('Luego de hacerlo manualemnte, ingrese los resultados\n');
fx0=input('Ingrese resultado de fx0:');
fx1=input('Ingrese resultado de fx1:');
fx2=input('Ingrese resultado de fx2:');
s0 = (fx1 - fx0)/(x1-x0);
s1 = (fx2 - fx1)/(x2-x1);

a = (s1-s0)/(h1+h0);
b = a*h1+s1;
c = fx2;
rcu1 = b + sqrt(b^2-4*a*c);
rcu2 = b - sqrt(b^2-4*a*c);
if (rcu1<=rcu2)
    x3 = x2+((-2*c)/rcu2);
else
    x3 = x2+((-2*c)/rcu1);
end
error = ((x3-x2)/x3)*100;
if (error < 0)
    errorapro = error*(-1);
else
    errorapro = error;
end
fprintf('\nEl resultado de h0 es:');
disp(h0);
fprintf('\nEl resultado de h1 es:');
disp(h1);
fprintf('\nEl resultado de s0 es:');
disp(s0);
fprintf('\nEl resultado de s1 es:');
disp(s1);
fprintf('\nIteracion No:');
disp(i);
fprintf('\nEl x3 es:');
disp(x3);
fprintf('\nError de aproximacion');
disp(errorapro);