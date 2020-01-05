function H = F_H(X,n)
%% Hession of f
H = zeros(n);
for i =1:1:n
    H(i,i) = 1/X(i);
end
end
