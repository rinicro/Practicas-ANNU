color=['r' 'g' 'b'];
ncols=size(x,2);
close all
figure(1)
for i=1:ncols
    subplot(ncols,1,i)
    plot(t,x(:,i),color(i))
end
pause(1)
if ncols == 2     
    figure(2)
    comet(x(:,1),x(:,2))
else
    figure(2)
    comet3(x(:,1),x(:,2),x(:,3))
end