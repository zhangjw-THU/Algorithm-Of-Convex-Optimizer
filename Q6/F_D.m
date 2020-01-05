function f_d = F_D(X,n)
%Gradient Of F
f_d = [];
for i = 1:1:n
    f_d(i) = 1 + log(X(i));
end
f_d = f_d';
end