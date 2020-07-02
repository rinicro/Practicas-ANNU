clear all;
% Datos
m=50;
f=@(t,x) -m*(x-cos(t)); 
intervalo=[0,1]; 
x0=0; 
N=24; 
sol=@(t) m^2/(1+m^2)*(cos(t)-exp(-m*t)+(sin(t)/m));

% Método Euler implícito (despejando x_i+1)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);
x(:,1)=x0;
for i=1:N
    x(:,i+1)=(x(:,i)+h*m*cos(t(i+1)))/(1+h*m);
end
t=t';
x1=x';

x2 = sol(t);

% Grafica
color=['r' 'g' 'b'];
ncols=size(x1,2);
figure(1)
for i=1:ncols
    subplot(ncols,1,i)
    plot(t,x1(:,i),color(1))
    hold on
    plot(t,x2(:,i),color(3))
end
hold off

pause(1)
diferencia=x2-x1;
figure(2)
for i=1:ncols
    subplot(ncols,1,i)
    plot(t,diferencia(:,i),color(2))
end

pause(1)
m=max(max(abs(diferencia)));
figure(4)
plot([0 1],[m m],color(2))
legend(sprintf("La diferencia máxima es: %f",m))