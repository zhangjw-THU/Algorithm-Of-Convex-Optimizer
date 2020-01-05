function nu_star = nu_star_KKTMathod(t,x_star,A,P,q,n)

b1 = t*F_D(x_star,P,q,t,n);
b2 = [];
for i=1:1:n
    b2(i,1) = -1/x_star(i);
end
b = -(b1+b2);
nu_star = inv(A*A')*A*b;
