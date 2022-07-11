%Metodo de Newton Rapson 
clc
syms x
fprintf('Metodo de Newton Rapson \n'); 
funcion = input('Ingrese la funcion f(x): ');       % Recibe cualquir tipo de funcion
xi = input('Ingrese el valor de Xi: ');             % Guarda el Valor de X 
n = input('Ingrese el valor de numero de Iteraciones: ');   % Es el numero de Veces que se quiere iterar
%Error = input('Ingres el error de Aproximacion Normalmente empieza en 0: ');
fprintf('\n');
fprintf('-------------|---------------------|------------------------\n');
fprintf('Iteracion    |     Estimacion      |      Error aprox      |\n');
fprintf('-------------|---------------------|------------------------\n');
fxi = inline(funcion);      %Guarda la funcion original para posterior ser evaluado con el valor de xi
%exp(-x)-x

EstAnterior = 0;            %La Estimacion Anterior en la Primera iteracion es = 0
for i = 1: n
    
    if i == 1
        z = diff(funcion,i); %deriva la funcion 
        fd = inline(z);% Guarda la funcion deriva como una funcion
    end
    
    funvalu = fxi(xi);%se Valua la funcion Original con el valor de Xi
    derivalu = fd(xi);%se Valua la funcion Derivada con el valor que tiene xi
    Estimacion = xi-(funvalu/derivalu);% Calcula la Estimacion
    Error = ((Estimacion-EstAnterior)/Estimacion)*100; %Calcula el Eror de Aproximacion
    fprintf('    %2d       |    %12.9f     |    %12.8f       |\n', i, Estimacion, Error);
    fprintf('-------------|---------------------|------------------------\n');
    EstAnterior = Estimacion; %Asigna la nueva Estimacion a la Variable de EstAnterior
    xi = Estimacion;%Asigna el nuevo valor de xi
end