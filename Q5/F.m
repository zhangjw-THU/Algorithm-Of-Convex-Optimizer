function Value = F(X,n)

Value = 0;
for i = 1:1:n
    Value = Value + X(i)*log(X(i));
end