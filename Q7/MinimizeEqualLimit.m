function [x_next,k_Newton] = MinimizeEqualLimit(x,v,P,q,A,b,t,k)

m     = size(A,1);
n     = size(P,1);
ETA   = 10^(-8);
alpha = 0.3;
beta  = 0.7;
s     = 'Constrained Newton';
v0 = v;

if k == 1
    [F_value,X_point] = ConstrainedNewton_2(x,v0,P,q,A,b,t,n,m,ETA,alpha,beta);
else
    [F_value,X_point] = ConstrainedNewton_1(x,v0,P,q,A,b,t,n,m,ETA,alpha,beta);
end
k_Newton = size(X_point,1);
x_next = X_point(end,:)';