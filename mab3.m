function[t,x]=mab3(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);
[~,x_ini]=meulermej(f,[t(1),t(3)],x0,2);
x(:,1:3)=x_ini(1:3,:)';
for i=1:N-2
    x(:,i+3)=x(:,i+2)+h/12*(23*f(t(i+2),x(:,i+2))-16*f(t(i+1),x(:,i+1))+5*f(t(i),x(:,i)));
end
t=t';
x=x';