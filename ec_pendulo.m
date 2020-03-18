m=1; g=9.8; F=0; L=1;  
intervalo=[0,10]; 
N=1000;
betas=[0,0.25,1.5];
inis=[[1,0];[0,1]];

for j=1:2
    x0=inis(j,:);
    for k=1:3
        b = betas(k);
        f=@(t,x) [x(2);1/(m*L)*(F-2*L*b*x(2)-m*g*sin(x(1)))];
        [t,x] = mrk4(f,intervalo,x0,N);        
        graficas;
        pause(3)
    end
end

