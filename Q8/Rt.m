function value = Rt(X,P,q,lambda,nu,A,b,t)
r_dual = F_Rdual(X,P,q,lambda,nu,A);
r_cent = F_Rcent(lambda,X,t);
r_pri  = F_Rpri(A,X,b);

value = cat(1,cat(1,r_dual,r_cent),r_pri);
end