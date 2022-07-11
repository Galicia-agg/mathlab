%Metodo de Newton Rapson Normal y Modificado
clc
syms x
fprintf('Metodo de Newton Rapson \n'); 
funcion = input('Ingrese la funcion f(x): ');   %recibe cualquir tipo de funcion
xi = input('Ingrese el valor de Xi: ');% Guarda el Valor de X
ValorVerdadero = input ('Ingrese el valor verdadero en caso el problema lo indique: ');%Guarda el valor verdadero que indique el problema
n = input('Ingrese el valor de numero de Iteraciones: '); % Es el numero de Veces que se quiere iterar
%Error = input('Ingres el error de Aproximacion Normalmente empieza en 0: ');
fprintf('\n');
fprintf('--|---------------------|-----------------------|-----------------------|-----------------------|-----------------------|------------------------\n');
fprintf('I |M. de Newton Raphson |      Error aprox      |   Error Truncamiento  |M.Newton Raphson Modif |      Error aprox      |   Error Truncamiento  |\n');
fprintf('--|---------------------|-----------------------|-----------------------|-----------------------|-----------------------|------------------------\n');
fxi = inline(funcion);%Guarda la funcion original para posterior ser evaluado con el valor de xi
EstAnteriorMNRN = xi; %La Estimacion Anterioor en la Primera iteracion es = 0, para el metodo de Newton Raphson Normal
EstAnteriorMNRF = xi; %La Estimacion Anterioor en la Primera iteracion es = 0, para el Metodo de Newton Raphson Modificado
xi1 = xi;
xi2 = xi;
        z = diff(funcion,1); %deriva la funcion, por primera vez 
        d1 = inline(z);% Guarda la primera deriva de la funcion
       
        a = diff(funcion,2);%deriva la funcion por segunda vez
        d2 = inline(a);% Guarda la segunda deriva de la funcion
        
        %x^3-5*x^2+7*x-3

for i = 1: n
    
    funvalu1 = fxi(xi1);%Valua la funcion Original con el valor de Xi1
    d1valuada1 = d1(xi1);%evalua y guarda la funcion Derivada por primera vez con el valor que tiene xi1
    MNRNormal = xi1-(funvalu1/d1valuada1);% Calcula la Estimacion del Metodo de Newton Rapson Normal
    MNRNError = ((MNRNormal-EstAnteriorMNRN)/MNRNormal)*100; %Calcula el Error de Aproximacion del metodo de Newton Raphson Normal
    if ValorVerdadero ~= 0
    MNRNErrorTrunca = ((ValorVerdadero-MNRNormal)/ValorVerdadero)*100;%Calcular el Error de Truncamiento del Metodo de Newton Raphson Normal
    else
    MNRNErrorTrunca = 0;
    end
        
    funvalu2 = fxi(xi2);%se Valua la funcion Original con el valor de Xi2
    d1valuada2 = d1(xi2);%evalua y guarda la funcion Derivada por primera vez con el valor que tiene xi2
    d2valuada2 = d2(xi2);%evalua y guarda la funcion Derivada por segunda vez con el valor que tiene xi2
    MNRModificado = xi2-((funvalu2*d1valuada2)/((d1valuada2)^2-funvalu2*d2valuada2));% Calcula la Estimacion del Metodo de Newton Raphson Modificado
    MNRMError = ((MNRModificado-EstAnteriorMNRF)/MNRModificado)*100; %Calcula el Eror de Aproximacion del Metodo de Newton Raphson Modificado
    if ValorVerdadero ~= 0
        MNRMErrorTrunca = ((ValorVerdadero-MNRModificado)/ValorVerdadero)*100;%Calcular el Error de Truncamiento del Metodo de Newton Raphson Modificado
    else
        MNRMErrorTrunca = 0;
    end
    
    fprintf('%2d|    %12.9f     |    %12.8f       |  %12.8f         |  %12.9f         |  %12.8f         |  %12.8f         |\n', i, MNRNormal, MNRNError, MNRNErrorTrunca, MNRModificado, MNRMError, MNRMErrorTrunca);
    fprintf('--|---------------------|-----------------------|-----------------------|-----------------------|-----------------------|------------------------\n');
    
    EstAnteriorMNRN = MNRNormal; %Asigna la nueva Estimacion a la Variable de Estimacion anterior del Metodo de Newton Raphson Normal
    EstAnteriorMNRF = MNRModificado; %Asigna la nueva Estimacion a la Variable de Estimacion anteriro del Metodo de Newton Raphson Modificado
    xi1 = MNRNormal;%Asigna el nuevo valor de xi1 la cual es la estimacion encontrada de MNRN
    xi2 = MNRModificado;%Asigna el nuevo valor de xi2 el cual es la estimacion encontrada de MNRM
end
