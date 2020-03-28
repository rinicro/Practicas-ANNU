function[t,x]=mab5(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);
[~,x_ini]=mrk4(f,[t(1),t(5)],x0,4);
x(:,1:5)=x_ini(1:5,:)';
for i=1:N-4
    x(:,i+5)=x(:,i+4)+h/720*(1901*f(t(i+4),x(:,i+4))-2774*f(t(i+3),x(:,i+3))+2616*f(t(i+2),x(:,i+2))-1274*f(t(i+1),x(:,i+1))+251*f(t(i),x(:,i)));
end
t=t';
x=x';