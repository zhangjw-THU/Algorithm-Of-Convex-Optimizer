function Rcent = F_Rcent(lambda,X,t)

Rcent = -diag(lambda)*(-X)-(1/t)*ones(size(lambda,1),1);

end