function [t,x]=mmilne4bdf5(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);

% Paso 1, 2
    % Inicializamos valores de x y f mediante Runge-Kutta orden 4
[~,x_ini]=mrk4(f,[t(1),t(5)],x0,4);
x(:,1:5)=x_ini(1:5,:)';
F(:,1)=f(t(2),x(:,2));
F(:,2)=f(t(3),x(:,3));
F(:,3)=f(t(4),x(:,4));
F(:,4)=f(t(5),x(:,5));

% Paso 3
for i=1:N-5
    % Paso 3.1 (predicción)
        % Metodo Milne explícito de 4 pasos para calcular x(:,i+5)
    x(:,i+5)=x(:,i+1)+4*h/3*(2*F(:,4)-F(:,3)+2*F(:,2));
    
% Paso 3.2 - evaluación
        % En este momento tenemos F(:,1)=f(t(i+1),x(:,i+1)), 
        % F(:,2)=f(t(i+2),x(:,i+2)), F(:,3)=f(t(i+3),x(:,i+3)) 
        % y F(:,4)=f(t(i+4),x(:,i+4))  calculados correctamente
    F(:,5)=f(t(i+5),x(:,i+5));
    
    % Paso 3.2 - corrección
        % Metodo BDF de 5 pasos
    x(:,i+5)=1/137*(60*h*F(:,5)+300*x(:,i+4)-300*x(:,i+3)+200*x(:,i+2)-75*x(:,i+1)+12*x(:,i));
    
    % Paso 3.3 (evaluación)
        % Actualizamos F para la siguiente iteración (no es necesario en la
        % última iteración)  
    F(:,1)=F(:,2);
    F(:,2)=F(:,3);
    F(:,3)=F(:,4);
    F(:,4)=f(t(i+5),x(:,i+5));
end
% Paso 4 (última iteración separada)
i=N-4;
% Paso 4.1 (predicción)
x(:,i+5)=x(:,i+1)+4*h/3*(2*F(:,4)-F(:,3)+2*F(:,2));
% Paso 4.2 - evaluación
F(:,5)=f(t(i+5),x(:,i+5));
% Paso 4.2 - corrección
x(:,i+5)=1/137*(60*h*F(:,5)+300*x(:,i+4)-300*x(:,i+3)+200*x(:,i+2)-75*x(:,i+1)+12*x(:,i));

t=t';
x=x';