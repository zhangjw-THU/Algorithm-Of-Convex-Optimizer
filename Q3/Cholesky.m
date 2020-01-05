function D = Cholesky(H,df)

L_t = chol(H);
L = L_t';
w = -1*(inv(L)*df);
D = inv(L_t)*w;

