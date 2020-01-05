function Value = F(X,P,q,n,t)

Value = 0;
Value = Value + t*(0.5*dot(X',P*X)+dot(q',X));

for i = 1:1:n
    Value = Value -log(X(i));
end