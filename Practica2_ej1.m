% Rubén Ruperto Díaz
% ANNU Practica 2 Ej 1.I

% PVI: m*x''(t)=-k*x(t), t in [0,T]
% x(0)=x_0, x'(0)=v_0

% Reducimos la ec. a primer orden por medio del cambio de var. 
% y(t) = (x(t) , x'(t))

% y'(t) = (x'(t), x''(t)) = (y_2(t) , (-k/m)*y_1(t))
% y(0) = (x_0, v_0)

% Consideramos k=m=1, T=10, x_0=1, v_0=0

% DATOS
f=@(t,y) [y(2);-y(1)]
% METODO DE RESOLUCION
[t,x]=ode45(f,[0,10],[1,0])
% REPRESENTACION GRAFICA
figure(1)
subplot(2,1,1)
plot(t,x(:,1))
subplot(2,1,2)
plot(t,x(:,2))
figure(2)
plot(x(:,1),x(:,2))

% ANNU Practica 2 Ej 1.II

% PVI: x'' + a(x^2-b)x' + x = 0, t in [0,T]
% x(0)=x_0, x'(0)=v_0
% Consideramos a=b=1, T=10, x_0=0.1, v_0=0.2

% Reducimos la ec: y'=(y_2(t),-a*(y_1(t)^2-b)*y_2(t) - y_1(t))
% y(0) = (x_0, v_0)

% DATOS
f=@(t,y) [y(2);-(y(1)^2-1)*y(2)-y(1)]
% METODO DE RESOLUCION
[t,x]=ode45(f,[0,10],[0.1,0.2])
% REPRESENTACION GRAFICA
figure(1)
subplot(2,1,1)
plot(t,x(:,1))
subplot(2,1,2)
plot(t,x(:,2))
figure(2)
plot(x(:,1),x(:,2))



