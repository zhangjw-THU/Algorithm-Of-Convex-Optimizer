function [F_value,X_point] = ConstrainedNewton_2(X_0,V_0,P,q,A,b,t,n,m,ETA,alpha,beta)

X = X_0;
V= V_0;

F_value = [];
Error = 1;
j = 1;
while 1
    
    F_value(j)   = F(X,P,q,n,t);
    X_point(j,:) = X;
    j            = j+1;
    
    FH = F_H(X,P,t,n);
    FD = F_D(X,P,q,t,n);
    
    [dx,dv] = Elimination_2(A,FH,FD,b,X,V,n,m);
    t_persteplength = Backtracking_Line_Search_2(X,P,q,t,V,dx,dv,A,b,m,n,alpha,beta);
    X = X + t_persteplength*dx;
    V = V + t_persteplength*dv;
    
    
    Error = norm(r(X,P,q,t,V,A,b,n));

    if (Error <= ETA) & norm(A*X-b,inf)<10^-11
        break;
    end
end
end