function[t,x]=mab2(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);
[~,x_ini]=meuler(f,[t(1),t(2)],x0,1);
x(:,1)=x_ini(1,:);
x(:,2)=x_ini(2,:);
for i=1:N-1
    x(:,i+2)=x(:,i+1)+h/2*(3*f(t(i+1),x(:,i+1))-f(t(i),x(:,i)));
end
t=t';
x=x';