A=1; a=10;
intervalo=[0,10]; 
N=10000;
x0=[0,0];
ws=[8,10,12];
bs=[0,1,15];
for j=1:3
    b=bs(j);
    for k=1:3
        w = ws(k);
        f=@(t,x) [x(2);A*cos(w*t)-a^2*x(1)-2*b*x(2)];
        [t,x] = mrk4(f,intervalo,x0,N);        
        graficas_comet;
        pause(2)
    end
end

