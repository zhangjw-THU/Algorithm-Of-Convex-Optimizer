function t_persteplength = Backtracking_Line_Search_2(X0,P,q,t,V0,dx,dv,A,b,m,n,alpha,beta)
% Linear Search
t_persteplength = 1;

while 1
    X = X0+t_persteplength*dx;
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
    if norm(r(X0+t_persteplength*dx,P,q,t,V0+t_persteplength*dv,A,b,n)) <= (1-alpha*t_persteplength)*norm(r(X0,P,q,t,V0,A,b,n)) 
        break;
    end
    t_persteplength = beta*t_persteplength;
end
end