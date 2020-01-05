function [F_value ,X_point] = ConstrainedNewton_2(X_0,V_0,A,b,n,m,ETA,alpha,beta)
X       = X_0;
V       = V_0;
F_value = [];
Error   = 1;
j = 1;
while 1
    
    F_value(j)   = F(X,n);
    X_point(j,:) = X;
    j            = j+1;
    
    FH = F_H(X,n);
    FD = F_D(X,n);
    
    [dx,dv] = Elimination(A,FH,FD,b,X,V,n,m);
    
    t = Backtracking_Line_Search(X,V,dx,dv,A,b,m,n,alpha,beta);
    X = X + t*dx;
    V = V + t*dv;
    
    Error = norm(r(X,V,A,b,n));
    Error
    if (Error <= ETA) & norm(A*X-b,inf)<10^-14
        break;
    end
    
end
end