function [t,x]=mab4am4(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);

% Paso 1, 2
    % Inicializamos valores de x y f mediante Runge-Kutta orden 4
[~,x_ini]=mrk4(f,[t(1),t(4)],x0,3);
x(:,1:4)=x_ini(1:4,:)';
F(:,1)=f(t(1),x(:,1));
F(:,2)=f(t(2),x(:,2));
F(:,3)=f(t(3),x(:,3));
F(:,4)=f(t(4),x(:,4));

% Paso 3
for i=1:N-4
    % Paso 3.1 (predicción)
        % Metodo Adams–Bashforth de 4 pasos
    x(:,i+4)=x(:,i+3)+h/24*(55*F(:,4)-59*F(:,3)+37*F(:,2)-9*F(:,1));
    
    % Paso 3.2 - evaluación
        % En este momento tenemos F(:,1)=f(t(i),x(:,i)), 
        % F(:,2)=f(t(i+1),x(:,i+1)), F(:,3)=f(t(i+2),x(:,i+2)) 
        % y F(:,4)=f(t(i+3),x(:,i+3))  calculados correctamente
    F(:,5)=f(t(i+4),x(:,i+4));
    
    % Paso 3.2 - corrección
        % Metodo Adams–Moulton de 4 pasos
    x(:,i+4)=x(:,i+3)+h/720*(251*F(:,5)+646*F(:,4)-264*F(:,3)+106*F(:,2)-19*F(:,1));
    
    % Paso 3.3 (evaluación)
        % Actualizamos F para la siguiente iteración (no es necesario en la
        % última iteración con i=N-3)  
    F(:,1)=F(:,2);
    F(:,2)=F(:,3);
    F(:,3)=F(:,4);
    F(:,4)=f(t(i+4),x(:,i+4));
end
% Paso 4 (última iteración i=N-3 separada)
i=N-3;
% Paso 4.1 (predicción)
x(:,i+4)=x(:,i+3)+h/24*(55*F(:,4)-59*F(:,3)+37*F(:,2)-9*F(:,1));
% Paso 4.2 - evaluación
F(:,5)=f(t(i+4),x(:,i+4));
% Paso 4.2 - corrección
x(:,i+4)=x(:,i+3)+h/720*(251*F(:,5)+646*F(:,4)-264*F(:,3)+106*F(:,2)-19*F(:,1));

t=t';
x=x';
