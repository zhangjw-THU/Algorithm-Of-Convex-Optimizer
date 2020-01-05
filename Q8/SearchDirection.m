function [y_pd,x_pd,lambda_pd,nu_pd] = SearchDirection(X,P,q,lambda,nu,A,b,t)

Dr11 = P;
Dr12 = Df(X)';
Dr13 = A';
Dr1  = cat(2,cat(2,Dr11,Dr12),Dr13);


Dr21 = -diag(lambda)*Df(X);
Dr22 = -diag(-X);
Dr23 = zeros(size(Dr22,1),size(Dr13,2));
Dr2  = cat(2,cat(2,Dr21,Dr22),Dr23);

Dr31 = A;
Dr32 = zeros(size(Dr31,1),size(Dr22,2));
Dr33 = zeros(size(Dr31,1),size(Dr13,2));
Dr3  = cat(2,cat(2,Dr31,Dr32),Dr33);

Dr = cat(1,cat(1,Dr1,Dr2),Dr3);
r_dual = F_Rdual(X,P,q,lambda,nu,A);
r_cent = F_Rcent(lambda,X,t);
r_pri  = F_Rpri(A,X,b);

Rt = cat(1,cat(1,r_dual,r_cent),r_pri);

y_pd      = -inv(Dr)*Rt;

x_pd      = y_pd(1:size(X),:);
lambda_pd = y_pd(size(X)+1:size(X)+size(lambda),:);
nu_pd    = y_pd(size(X)+size(lambda)+1:end,:);

end

