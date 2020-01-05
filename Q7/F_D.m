function fd = F_D(X,P,q,t,n)

fd_P = t*(P*X+q);
fd_phe = zeros(n,1);

for i = 1:1:n
    fd_phe(i) = -1/X(i);
end
fd = fd_P+fd_phe;
end