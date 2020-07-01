function [t,x]=mab3am3(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);

% Paso 1, 2
    % Inicializamos valores de x y f mediante Runge-Kutta orden 3
[~,x_ini]=mrk3(f,[t(1),t(3)],x0,2);
x(:,1:3)=x_ini(1:3,:)';
F(:,1)=f(t(1),x(:,1));
F(:,2)=f(t(2),x(:,2));
F(:,3)=f(t(3),x(:,3));

% Paso 3
for i=1:N-3
    % Paso 3.1 (predicción)
        % Metodo Adams–Bashforth de 3 pasos
    x(:,i+3)=x(:,i+2)+h/12*(23*F(:,3)-16*F(:,2)+5*F(:,1));
    
    % Paso 3.2 - evaluación
        % En este momento tenemos F(:,1)=f(t(i),x(:,i)), 
        % F(:,2)=f(t(i+1),x(:,i+1)) y F(:,3)=f(t(i+2),x(:,i+2)) 
        % calculados correctamente
    F(:,4)=f(t(i+3),x(:,i+3));
    
    % Paso 3.2 - corrección
        % Metodo Adams–Moulton de 3 pasos
    x(:,i+3)=x(:,i+2)+h/24*(9*F(:,4)+19*F(:,3)-5*F(:,2)+F(:,1));
    
    % Paso 3.3 (evaluación)
        % Actualizamos F para la siguiente iteración (no es necesario en la
        % última iteración con i=N-2)  
    F(:,1)=F(:,2);
    F(:,2)=F(:,3);
    F(:,3)=f(t(i+3),x(:,i+3));
end
% Paso 4 (última iteración i=N-2 separada)
i=N-2;
% Paso 4.1 (predicción)
x(:,i+3)=x(:,i+2)+h/12*(23*F(:,3)-16*F(:,2)+5*F(:,1));   
% Paso 4.2 - evaluación
F(:,4)=f(t(i+3),x(:,i+3)); 
% Paso 4.2 - corrección
x(:,i+3)=x(:,i+2)+h/24*(9*F(:,4)+19*F(:,3)-5*F(:,2)+F(:,1));

t=t';
x=x';
