function [F_value,F_d,t_value] = Steepest_Descent_2norm(X0,A,m,n,alpha,beta,eps)

    e = norm(dF(X0,A,m,n));
    F_value = F(X0,A,m,n);
    F_d = e;
    X = X0;
    j = 1;
    t_value = [];
    while e>eps

        D = -dF(X,A,m,n);
        t = Backtracking_Line_Search(X,A,m,n,D,alpha,beta);
        X = X + t*D;
        
        j = j+1;
        t_value(j-1) = t;
        F_value(j) = F(X,A,m,n);
        e = norm(dF(X,A,m,n));
        F_d(j) = e;
        e
    end
end
 