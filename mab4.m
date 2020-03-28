function[t,x]=mab4(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);
[~,x_ini]=mrk3(f,[t(1),t(4)],x0,3);
x(:,1:4)=x_ini(1:4,:)';
for i=1:N-3
    x(:,i+4)=x(:,i+3)+h/24*(55*f(t(i+3),x(:,i+3))-59*f(t(i+2),x(:,i+2))+37*f(t(i+1),x(:,i+1))-9*f(t(i),x(:,i)));
end
t=t';
x=x';