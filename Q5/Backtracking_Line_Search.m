function t = Backtracking_Line_Search(X0,d,m,n,alpha,beta)
t = 1;

while 1
    X = X0+t*d;
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
    if F(X0 + t*d,n) < F(X0,n) + alpha*t*dot(F_D(X0,n),d)
        break;
    end
    t = beta*t;
end
