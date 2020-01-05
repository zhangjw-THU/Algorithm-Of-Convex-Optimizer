function H = F_H(X,P,t,n)
%% Hession of f
H_P = t*P;
H_phe = zeros(n);
for i =1:1:n
    H_phe(i,i) = 1/(X(i)*X(i));
end
H = H_P+H_phe;
end
