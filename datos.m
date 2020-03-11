%f=@(t,x) [x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0=[0,4]; N=1000;
%k=1; m=1; f=@(t,x) [x(2);-(k/m)*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000;
%a=1; b=1; f=@(t,x) [x(2);-(x(1)^2-1)*x(2)-x(1)]; intervalo=[0,10]; x0=[0.1,0.2]; N=1000;
f=@(t,x) [-0.1*x(1)+2*x(2);-2*x(1)-0.1*x(2)]; intervalo=[0,10]; x0=[0,1]; N=1000; sol=@(t) [exp(-0.1*t).*sin(2*t) exp(-0.1*t).*cos(2*t)];
%f=@(t,x) [x(2);cos(3*t)-2*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000; sol=@(t) ([8/7*cos(sqrt(2)*t)-1/7*cos(3*t) -8/7*sin(sqrt(2)*t)*sqrt(2)+3/7*sin(3*t)]);

