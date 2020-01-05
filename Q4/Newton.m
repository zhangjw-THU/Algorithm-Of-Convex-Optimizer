function [F_value,F_d,t_value] = Newton(X0,A,m,n,alpha,beta,eps)

    e = norm(dF(X0,A,m,n));
    F_value = F(X0,A,m,n);
    F_d = e;
    X = X0;
    j = 1;
    t_value = [];
    while (e>eps)
        f_dvalue = dF(X,A,m,n);
        
        H = dF_2(X,A,m,n);
        D_row = Cholesky(H,f_dvalue');
        D = D_row';
        
        t = Backtracking_Line_Search(X,A,m,n,D,alpha,beta);
        X = X + t*D;
        
		j = j+1;
        t_value(j-1) = t;
        F_value(j) = F(X,A,m,n);
        e = norm(dF(X,A,m,n))
        F_d(j) = e;
        
    end
end
 