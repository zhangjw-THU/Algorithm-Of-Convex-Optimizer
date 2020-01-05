function t = Backtracking_Line_Search(X0,A,m,n,dX,alpha,beta)
%»ØËÝÖ±ÏßËÑË÷

t = 1;

while 1
    X = X0 + t*dX;
    flag = true;
    for i =1:1:m
        if 1-dot(A(:,i)',X)<=0
            flag = false;
            t = beta*t;
            break;
        end
    end
    if flag
        break;
    end
end

while 1
    X = X0 + t*dX;
    flag = true;
    for i = 1:1:n
        if abs(X(i))>=1
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
    if F(X0 + t*dX,A,m,n) < F(X0,A,m,n) + alpha*t*dot(dF(X0,A,m,n),dX)
        break;
    end
    t = beta*t;
end
