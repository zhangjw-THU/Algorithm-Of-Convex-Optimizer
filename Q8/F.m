function Value = F(X,P,q)
Value =  0.5*dot(X',P*X)+dot(q',X);
end