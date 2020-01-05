function Value = F(X,A,m,n)
%Çóº¯ÊýÖµ
 item1 = 0;
 for i = 1:1:m
     if 1-dot(A(:,i)',X)<=0
         error("Error1£ºlog a positive value!");
     end
     item1 = item1 - log(1-dot(A(:,i)',X));
 end
 
 item2 = 0;
 for i = 1:1:n
     if abs(X(i))>=1
         error("Error:Xi value geq 1!");
     end
     item2 = item2 - log(1-X(i)*X(i));
 end
 
 Value = item1 + item2;
 