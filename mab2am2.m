function [t,x]=mab2am2(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);

% Paso 1, 2
    % Inicializamos valores de x y f mediante Euler mejorado
[~,x_ini]=meulermej(f,[t(1),t(2)],x0,1);
x(:,1:2)=x_ini(1:2,:)';
F(:,1)=f(t(1),x(:,1));
F(:,2)=f(t(2),x(:,2));

% Paso 3
for i=1:N-2
    % Paso 3.1 (predicci�n)
        % Metodo Adams�Bashforth de 2 pasos
    x(:,i+2)=x(:,i+1)+h/2*(3*F(:,2)-F(:,1));
    
    % Paso 3.2 - evaluaci�n
        % En este momento tenemos F(:,1)=f(t(i),x(:,i)), 
        % F(:,2)=f(t(i+1),x(:,i+1)) calculados correctamente
    F(:,3)=f(t(i+2),x(:,i+2));
    
    % Paso 3.2 - correcci�n
        % Metodo Adams�Moulton de 2 pasos
    x(:,i+2)=x(:,i+1)+h/12*(5*F(:,3)+8*F(:,2)-F(:,1));
    
    % Paso 3.3 (evaluaci�n)
        % Actualizamos F para la siguiente iteraci�n (no es necesario en la
        % �ltima iteraci�n con i=N-1)  
    F(:,1)=F(:,2);
    F(:,2)=f(t(i+2),x(:,i+2));
end
% Paso 4 (�ltima iteraci�n i=N-1 separada)
i=N-1;
% Paso 4.1 (predicci�n)
x(:,i+2)=x(:,i+1)+h/2*(3*F(:,2)-F(:,1));    
% Paso 4.2 - evaluaci�n
F(:,3)=f(t(i+2),x(:,i+2));    
% Paso 4.2 - correcci�n
x(:,i+2)=x(:,i+1)+h/12*(5*F(:,3)+8*F(:,2)-F(:,1));

t=t';
x=x';
