function [F_value,F_d,t_value] = Steepest_Descent_1norm(X0,A,m,n,alpha,beta,eps)

    e = norm(dF(X0,A,m,n));
    F_value = F(X0,A,m,n);
    F_d = e;
    X = X0;
    j = 1;
    t_value = [];
    while (e>eps)
        e
        f_dvalue = dF(X,A,m,n);
        f_dLfsz = norm(abs(f_dvalue),inf);
        D=zeros(1,length(X));
        for i=1:1:n
            if abs(f_dvalue(i)) == f_dLfsz
                D(i) = sign(-f_dvalue(i));
                break;
            end
        end
        t = Backtracking_Line_Search(X,A,m,n,D,alpha,beta);
        X = X + t*D;
        
		j = j+1;
        t_value(j-1) = t;
        F_value(j) = F(X,A,m,n);
        e = norm(dF(X,A,m,n));
        F_d(j) = e;
        
    end
end
 