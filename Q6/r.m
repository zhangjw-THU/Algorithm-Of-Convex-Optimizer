function Value = r(X,V,A,b,n)

r_dual = F_D(X,n)+A'*V;
r_pri  = A*X-b;
Value  = [r_dual;r_pri];
