function H = dF_2(X,A,m,n)
% «“hessionæÿ’Û
for i = 1:1:n
    for j = 1:1:n
        H(i,j) = dF_2_dxdy(X,A,m,n,i,j);
%         H(i,j) = dtemp;
%         H(j,i) = dtemp;
    end
end