function Value = F_goal(X,P,q)

Value = 0;
Value = Value + 0.5*dot(X',P*X)+dot(q',X);