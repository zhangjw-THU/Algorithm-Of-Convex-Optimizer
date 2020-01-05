function t_persteplength = Backtracking_Line_Search_1(X0,P,q,t,d,m,n,alpha,beta)
t_persteplength = 1;

while 1
    X = X0+t_persteplength*d;
    flag = true;
    for i = 1:1:n
        if X(i)<=0
            flag = false;
            t_persteplength = beta*t_persteplength;
            break;
        end
    end
    if flag
        break
    end
end

while 1
    if F(X0 + t_persteplength*d,P,q,n,t) < F(X0,P,q,n,t) + alpha*t_persteplength*dot(F_D(X0,P,q,t,n),d)
        break;
    end
    t_persteplength = beta*t_persteplength;
end
