close all
clear all
load HomeworkDATA

alpha = 0.15;
beta = 0.8;
eps = 10^(-5);

X0 = zeros(1,50);
[F_value,F_d,t_value] = Steepest_Descent_2norm(X0,A1,m1,n1,alpha,beta,eps);
figure(1)
plot(1:1:length(F_value),F_value);
s = ':2norm';
title(['Function Value Curve',s])
ylabel("Function Value");
xlabel('Epoch');
legend(strcat("\alpha:",string(alpha),";\beta:",string(beta)));



Log_Error = [];
for i=1:1:length(F_value)
    Log_Error(i) = log(F_value(i)-F_value(end));
end
figure(2)
plot(1:1:length(F_value),Log_Error);
title(['The Logarithmic Error Curve',s])
ylabel("Logarithmic Error");
xlabel('Epoch');
legend(strcat("\alpha:",string(alpha),";\beta:",string(beta)));

figure(3)
plot(1:1:length(t_value),t_value);
title(['The Step Length--Epoch Curve',s])
ylabel("t");
xlabel('Epoch');
legend(strcat("\alpha:",string(alpha),";\beta:",string(beta)));


    