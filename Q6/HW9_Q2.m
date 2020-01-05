clear all;
close all;
load x_1.mat;
load A_m=30_n=100.mat;
load b.mat
v_0   = zeros(size(A,1),1);
m     = 30;
n     = 100;
ETA   = 10^(-10);
alpha = 0.3;
beta  = 0.7;
s     = 'Constrained Newton';


[F_value,X_point] = ConstrainedNewton_2(x_1,v_0,A,b,n,m,ETA,alpha,beta);
display("X^*:");
X_point(end,:)
display("p^*");
F_value(end)

%%
Log_Error = [];
for i=1:1:length(F_value)-1
    Log_Error(i) = log(F(X_point(i,:)-X_point(end,:),n));
end
figure(1)
plot(1:1:length(Log_Error),Log_Error,'-*','linewidth',1);
title(['The Logarithmic Error Curve of ',s])
ylabel("Logarithmic Error");
xlabel('Epoch');
legend(strcat("\alpha:",string(alpha),";\beta:",string(beta)));

%% 
Log_Error = [];
for i=1:1:length(F_value)-1
    Log_Error(i) = log(abs(F_value(i)-F_value(end)));
end
figure(2)
plot(1:1:length(Log_Error),Log_Error,'-*','linewidth',1);
title(['The Logarithmic Error Curve of ',s])
ylabel("Logarithmic Error");
xlabel('Epoch');
legend(strcat("\alpha:",string(alpha),";\beta:",string(beta)));

    
