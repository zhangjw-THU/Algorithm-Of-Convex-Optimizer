function step_length = Linear_Search(X0,P,q,lambda,nu,beta,alpha,x_pd,lambda_pd,nu_pd,A,b,t)

step_length = 1;
s_max_set = [];
for i = 1:1:length(lambda)
    if lambda_pd(i)<0
        s_max_set(i) = -lambda(i)/lambda_pd(i);
    else
        s_max_set(i) = 1;
    end
end

step_length = 0.99*min(step_length,min(s_max_set));

while 1
    X = X0 + step_length*x_pd;
    flag = true;
    for i = 1:1:length(X0)
        if X(i)<=0
            flag = false;
            step_length = beta*step_length;
            break;
        end
    end
    if flag
        break
    end
end

while 1
    if norm(Rt(X0+step_length*x_pd , P,q, lambda+step_length*lambda_pd, nu+step_length*nu_pd, A,b,t)) <= (1-alpha*step_length)*norm(Rt(X0,P,q,lambda,nu,A,b,t)) 
        break;
    end
    step_length = beta*step_length;
end

end