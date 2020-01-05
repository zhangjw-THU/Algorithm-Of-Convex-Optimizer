close all
clear all
load A.mat
load b.mat
load lambda.mat
load mu.mat
load P.mat
load q.mat
load x_0.mat


m       = size(x_0,1);
n       = size(x_0,1);
R_pri_error  = 10^(-10);
R_dual_error = 10^(-10);
Mu_agency_error     = 10^(-10);

nu      = mu;
X      = x_0;
Mu     = 10;
lambda = lambda;

alpha = 0.3;
beta  = 0.7;

j = 1;
log_mu_agency = [];
log_r         = [];


while 1
    t = Mu*m/Mu_agency(X,lambda);
    log_mu_agency(j) = log(Mu_agency(X,lambda));
    
    [y_pd,x_pd,lambda_pd,nu_pd] = SearchDirection(X,P,q,lambda,nu,A,b,t);
    
    dot(F_D(X,P,q),x_pd);
    
    step_length = Linear_Search(X,P,q,lambda,nu,beta,alpha,x_pd,lambda_pd,nu_pd,A,b,t);
    
    X      = X      + step_length*x_pd;
    lambda = lambda + step_length*lambda_pd;
    nu     = nu     + step_length*nu_pd;
    
    norm(F_Rdual(X,P,q,lambda,nu,A))
    if (norm(F_Rpri(A,X,b)) <= R_pri_error) && (norm(F_Rdual(X,P,q,lambda,nu,A))<=R_dual_error) && (Mu_agency(X,lambda)<=Mu_agency_error)
        break
    end
    
    log_r(j) = log(sqrt(norm(norm(F_Rpri(A,X,b)))^2+norm(norm(F_Rpri(A,X,b)))^2));
    j = j+1;
end
p_star  = F(X,P,q);
% plot
figure(1)
k_Newton = [1:1:length(log_mu_agency)];
plot(k_Newton,log_mu_agency,'-','linewidth',2);
title('Logarithmic Mu Aency');
xlabel('k');
ylabel('log(mu)');

% plot
figure(2)
k_Newton = [1:1:length(log_r)];
plot(k_Newton,log_r,'-','linewidth',2);
title('Logarithmic Dual Gap');
xlabel('k');
ylabel('log(r..)');




