function [dx,dv] = Elimination(A,FH,FD,b,X,V,n,m)
% dx:Direction
% 
g         = FD;
h         = A*X-b;
H_inv_A_t = Cholesky(FH,A');
H_inv_g   = Cholesky(FH,g);
Schur     = -1*(A*H_inv_A_t);
w         = Cholesky(-1*Schur,h-A*H_inv_g);
dx        = Cholesky(FH,-A'*w-g);
dv        = w-V; 

