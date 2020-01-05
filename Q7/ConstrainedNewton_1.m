function [F_value ,X_point] = ConstrainedNewton_1(X_0,V_0,P,q,A,b,t,n,m,ETA,alpha,beta)

X = X_0;
F_value = [];
Error = 1;
% X_point = [];
j = 1;
while 1
    
    F_value(j)   = F(X,P,q,n,t);
    X_point(j,:) = X;
    j            = j+1;
    
    FH = F_H(X,P,t,n);
    FD = F_D(X,P,q,t,n);
    
    [d,w] = Elimination_1(A,FH,FD,n,m);
    
    Error = 0.5*(d'*FH*d);
    Error
    if Error < ETA
        break;
    end
    
    t_persteplength = Backtracking_Line_Search_1(X,P,q,t,d,m,n,alpha,beta);
    X = X + t_persteplength*d;
    
end
end