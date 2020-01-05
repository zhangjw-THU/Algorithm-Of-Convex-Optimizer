function Rdual = F_Rdual(X,P,q,lambda,nu,A)
Rdual = F_D(X,P,q)+Df(X)'*lambda + A'*nu;
end
