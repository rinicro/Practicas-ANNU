function comp2solexac(met)
datos
[t,x1] = met(f,intervalo,x0,N);
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
if ncols == 2     
    figure(3)
    plot(x1(:,1),x1(:,2),color(1))
    hold on
    plot(x2(:,1),x2(:,2),color(3))
else
    figure(3)
    plot3(x1(:,1),x1(:,2),x1(:,3),color(1))
    hold on
    plot3(x2(:,1),x2(:,2),x2(:,3),color(3))
end
hold off

pause(1)
m=max(max(abs(diferencia)));
figure(4)
plot([0 1],[m m],color(2))
legend(sprintf("La diferencia máxima es: %f",m))