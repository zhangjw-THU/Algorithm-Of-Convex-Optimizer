function Value = r(X,P,q,t,V,A,b,n)

r_dual = F_D(X,P,q,t,n)+A'*V;
r_pri  = A*X-b;
Value  = [r_dual;r_pri];
