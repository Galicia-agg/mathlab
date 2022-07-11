%Metodo de Cramer
fprintf('Metodo de Cramer \n');
n=input('Ingrese el numero de variables: ');
A=input('Ingrese la matriz de coeficientes:');
b=input('Ingrese el vector respuesta: ');
x = zeros(n, 1);
for i = 1:n
    D=A;
    D(:,i) = b;
    x(i) =det(D)/det(A);
end
fprintf('El resultado es:');
fprintf('%10.4f',x);