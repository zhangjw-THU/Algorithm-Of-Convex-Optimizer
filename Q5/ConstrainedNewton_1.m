function [F_value ,X_point] = ConstrainedNewton_1(X_0,A,n,m,ETA,alpha,beta)

X = X_0;
F_value = [];
Error = 1;
% X_point = [];
j = 1;
while 1
    
    F_value(j)   = F(X,n);
    X_point(j,:) = X;
    j            = j+1;
    
    FH = F_H(X,n);
    FD = F_D(X,n);
    
    [d,w] = Elimination(A,FH,FD,n,m);
    
    Error = 0.5*(d'*FH*d);
    Error
    if Error < ETA
        break;
    end
    
    t = Backtracking_Line_Search(X,d,m,n,alpha,beta);
    X = X + t*d;
    
end
end