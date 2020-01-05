function Gradient_dXi = dF_dXi(X,A,m,n,index)
%ÇóÆ«µ¼Êý
item = 0;
for i = 1:1:m
    item = item + A(index,i)/(1-dot(A(:,i)',X));
end

item = item +2*X(index)/(1-X(index)*X(index));

Gradient_dXi = item;
