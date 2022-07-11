
%Metodo de Muller
clc
syms x
fprintf('Metodo de Muller \n');
funcion = input('Ingrese la funcion f(x): ');   %Recibe cualquir tipo de funcion
x0=input('Ingrese x0:');        %Guarda el valor de x0 
x1=input('Ingrese x1:');        %Guarda el valor de x1
x2=input('Ingrese x2:');        %Guarda el valor de x2
i =input('Ingresa el numero de iteracion que vas a ser:');  %Recibe e numero de iteraciones que se desea
fxi = inline(funcion);                                      %Guarda la funcion original para posterior ser evaluado con el valor de xi
fprintf('\n');
EstAnteriorMuller = x2;                                     %La Estimacion Anterioor en la Primera iteracion es = 0, para el metodo de Muller

fprintf('===============================================================================\n');
for j = 0: i
    
    fprintf('Iteracion =   %2d \n', j);
    fprintf('===============================================================================\n');
    fprintf('x0 =  %8.12f \n', x0);     %Imprime en pantalla el Valor de X0 en la iteracion que se encuentra
    fprintf('x1 =  %8.12f \n', x1);     %Imprime en pantalla el Valor de X1 en la iteracion que se encuentra
    fprintf('x2 =  %8.12f \n', x2);     %Imprime en pantalla el Valor de X2 en la iteracion que se encuentra
    
    fx0 = fxi(x0);       % Se evalua la funcion con el Valor de x0
    fx1 = fxi(x1);       % Se evalua la funcion con el Valor de x1
    fx2 = fxi(x2);       % Se evalua la funcion con el Valor de x2
    fprintf('fx0 =  %8.12f \n', fx0);
    fprintf('fx1 =  %8.12f \n', fx1);
    fprintf('fx2 =  %8.12f \n', fx2);
    
        
    h0 = x1-x0;         %Calcula el valor de h0
    h1 = x2-x1;         %Calcula el valor de h1
    fprintf('h0 =  %8.12f \n', h0);
    fprintf('h1 =  %8.12f \n', h1);
    
    
    s0 = (fx1 - fx0)/(h0);      %Calcula el Valor de alfa sub cero
    s1 = (fx2 - fx1)/(h1);      %Calcular el valor de alfa sub uno
    fprintf('s0 =  %8.12f \n', s0);
    fprintf('s1 =  %8.12f \n', s1);
    
    a = (s1-s0)/(h0+h1);        %Calcula el valor de A
    b = s1+a*h1;                %Calcula el valor de B
    c = fx2;                    %Calcula el valor de C
    fprintf('a =  %8.12f \n', a);
    fprintf('b =  %8.12f \n', b);
    fprintf('c =  %8.12f \n', c);
    
    raizd=sqrt(b^2-4*a);        %Calcular la parte de la rais cuadrada de la formula de la raiz cuadratica
    fprintf('raiz =  %8.12f \n', raizd);
    if abs(b+raizd)>abs(b-raizd)    %Verifica el valor a utilizar en la forma de la raiz cudratica para la formula x3
        RaizCuadratica=b+raizd; 
    else
        RaizCuadratica=b-raizd;
        fprintf('raiiz Cuadratica completa positiva =  %8.12f \n', RaizCuadratica);
        fprintf('raiiz Cuadratica completa negativa =  %8.12f \n', RaizCuadratica);
    end
    %Divide la fomular de Muller en Variables llamadas pasos, para
    %comprender mejor el script
    PrimerPaso = x2;
    SegundoPaso = (-2*c);
    TercerPaso = RaizCuadratica;
   
    x3 = PrimerPaso + (SegundoPaso/TercerPaso);      %Calcula el Valor de X3, que sera nuestra nueva estimacion
    fprintf('x3 =  %8.12f \n',x3);
    MullerError = ((x3-EstAnteriorMuller)/x3)*100;   %Calcula el Eror de Aproximacion del Metodo de Muller
    fprintf('Error Aproximado =  %8.12f ', abs(MullerError)); disp('%');  fprintf('\n');
    fprintf('===============================================================================\n');
    
    %Asigna a la variables el nuevo valor que es cambiado al momento de
    %pasar a la siguiente Interacion
    x0 = x1;
    x1 = x2;
    x2 = x3;
    EstAnteriorMuller = x3;
end




