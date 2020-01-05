close all
clear all
format long
f = @(x,y)(1-x)^2+2*(y-x^2)^2;
f_dx = @(x,y)-2*(1-x)-8*x*(y-x^2);
f_dy = @(x,y)4*(y-x^2);

%% 最速下降方向
s = ':InfiniteNorm';
[X,Y,F,F_d]=Steepest_Descent_1norm(0,0);
xlb = 1:1:length(F_d);
figure(11)
plot(xlb,F_d)
xlabel('Epoch');
ylabel('Gradient Value');
title(['Gradient Descent Curve',s])

figure(12)
plot(xlb,F)
title(['Function Value Curve',s])
xlabel('Epoch');
ylabel('Function Value');

figure(13)
x1=-0.5:0.01:1.5;y1=x1;
[X1 Y1]=meshgrid(x1,y1);
nn=length(x1);
Z1=zeros(nn,nn);
for i=1:nn
    for j=1:nn
        Z1(i,j)=f(X1(i,j),Y1(i,j));
    end
end
hold on
contour(X1,Y1,Z1)
plot(X,Y,'-','linewidth',1)
title(['Trajectory',s])
xlabel('X1');
ylabel('X2');

% dlmwrite('Norm_Infinite.txt',[X(end),Y(end),F(end)]);
display('最优解：')
display('x1=')
X(end)
display('x2=')
Y(end)
display('最优值：')
F(end)
