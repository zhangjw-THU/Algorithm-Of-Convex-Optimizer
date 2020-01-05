function t = Backtracking_Line_Search(X0,V0,dx,dv,A,b,m,n,alpha,beta)
% Linear Search
t = 1;

while 1
    X = X0+t*dx;
    flag = true;
    for i = 1:1:n
        if X(i)<=0
            flag = false;
            t = beta*t;
            break;
        end
    end
    if flag
        break
    end
end

while 1
    if norm(r(X0+t*dx,V0+t*dv,A,b,n)) <= (1-alpha*t)*norm(r(X0,V0,A,b,n)) 
        break;
    end
    t = beta*t;
end
