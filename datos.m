%2.1
%f=@(t,x) [x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0=[0,4]; N=1000;
%k=1; m=1; f=@(t,x) [x(2);-(k/m)*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000;
%a=1; b=1; f=@(t,x) [x(2);-(x(1)^2-1)*x(2)-x(1)]; intervalo=[0,10]; x0=[0.1,0.2]; N=1000;
%2.11
%f=@(t,x) [-0.1*x(1)+2*x(2);-2*x(1)-0.1*x(2)]; intervalo=[0,10]; x0=[0,1]; N=1000; sol=@(t) [exp(-0.1*t).*sin(2*t) exp(-0.1*t).*cos(2*t)];
%f=@(t,x) [x(2);cos(3*t)-2*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000; sol=@(t) ([8/7*cos(sqrt(2)*t)-1/7*cos(3*t) -8/7*sin(sqrt(2)*t)*sqrt(2)+3/7*sin(3*t)]);
%2.14 Ec. pendulo
%m=1; g=9.8; F=0; L=1; b=0.25; f=@(t,x) [x(2);1/(m*L)*(F-2*L*b*x(2)-m*g*sin(x(1)))]; intervalo=[0,10]; x0=[1,0]; N=1000;
%2.15 Depredador-presa 1
%a=1; b=1; c=1; d=1; f=@(t,x) [a*x(1)-b*x(1)*x(2);-c*x(2)+d*x(1)*x(2)]; intervalo=[0,10]; x0=[10,2]; N=1000; 
%a=3; b=0.2; c=0.6; d=5; f=@(t,x) [a*x(1)-b*x(1)*x(2);-c*x(2)+d*x(1)*x(2)]; intervalo=[0,10]; x0=[10,2]; N=1000; 
%2.15 Depredador-presa 2
%a=1; b=1; c=1; d=1; e=0.4; f=0.02; f=@(t,x) [a*x(1)-b*x(1)*x(2)-e*x(1)^2;-c*x(2)+d*x(1)*x(2)-f*x(2)^2]; intervalo=[0,100]; x0=[10,2]; N=10000; 
%2.15 Van der Pol
a=1; b=-0.2; f=@(t,x) [x(2);-(x(1)^2-1)*x(2)-x(1)]; intervalo=[0,10]; x0=[0.1,0.2]; N=1000;
%2.15 Duffing
%a=0; f=@(t,x) [x(2);x(1)-a*x(2)-x(1)^3]; intervalo=[0,100]; x0=[0.5,0.5]; N=10000;
%2.15 Lorenz
%s=10; b=8/3; r=99.65; f=@(t,x) [s*(x(2)-x(1));r*x(1)-x(2)-x(1)*x(3);x(1)*x(2)-b*x(3)]; intervalo=[0,10]; x0=[0,5,75]; N=10000;
%2.16 Oscilador armónico forzado
%b=0; A=1; a=10; w=12; f=@(t,x) [x(2);A*cos(w*t)-a^2*x(1)-2*b*x(2)]; intervalo=[0,10]; x0=[0,0]; N=10000;
%b=1; A=1; a=10; w=9.8995; f=@(t,x) [x(2);A*cos(w*t)-a^2*x(1)-2*b*x(2)]; intervalo=[0,10]; x0=[0,0]; N=10000;



