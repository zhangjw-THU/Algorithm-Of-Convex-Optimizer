function Gradient = dF(X,A,m,n)
% ���ݶ�
Gradient = [];
for index = 1:1:n
    Gradient(index) = dF_dXi(X,A,m,n,index);
end
