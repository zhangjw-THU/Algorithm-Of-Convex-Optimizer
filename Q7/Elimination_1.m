function [v,w] = Elimination_1(A,FH,FD,n,m)

g         = FD;
h         = zeros(m,1);

H_inv_A_t = Cholesky(FH,A');
H_inv_g   = Cholesky(FH,g);

Schur     = -1*(A*H_inv_A_t);
w         = Cholesky(-1*Schur,A*H_inv_g-h);
v         = Cholesky(FH,-A'*w-g);