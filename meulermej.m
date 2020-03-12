function [t,x]=meulermej(f,intervalo,x0,N)
h=(intervalo(2)-intervalo(1))/N;
t=intervalo(1):h:intervalo(2);
x(:,1)=x0;
for i=1:N
    F1=f(t(i),x(:,i));
    F2=f(t(i),x(:,i)+h*F1);
    x(:,i+1)=x(:,i)+h/2*(F1+F2);
end
t=t';
x=x';