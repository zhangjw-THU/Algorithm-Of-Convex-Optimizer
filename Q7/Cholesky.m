function Solution = Cholesky(H,g)

L_t      = chol(H);
L        = L_t';
w        = inv(L)*g;
Solution = inv(L_t)*w;