function dxdy = dF_2_dxdy(X,A,m,n,i,j)

if i==j
    value = (2+2*X(i)*X(i))/(1-X(i)*X(i))^2;
    for k=1:1:m
        value = value + A(i,k)*A(i,k)/(1 - dot(A(:,k)',X))^2;
    end
    dxdy = value;
else
    value = 0;
    for k=1:1:m
        value = value + A(j,k)*A(i,k)/(1-dot(A(:,k)',X))^2;
    end
    dxdy = value;
end

end