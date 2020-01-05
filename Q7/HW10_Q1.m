close all
clear all
load A.mat
load b.mat
load lambda.mat
load mu.mat
load P.mat
load q.mat
load x_0.mat

nu      = mu;
m       = size(x_0,1);
n       = size(x_0,1);
EPSILON = 10^(-10);

mu         = [10,50,100,200];
k_Newton_1 = [];
log_n_t_1  = [];
k_Newton_2 = [];
log_n_t_2  = [];
k_Newton_3 = [];
log_n_t_3  = [];
k_Newton_4 = [];
log_n_t_4  = [];

x_star      = [];
lambad_star = [];
nu_star     = [];
p_star      = [];

for i = 1:1:length(mu)
    MU = mu(i);
    t  = 2;
    k  = 0 +1;
    x  = [];
    x(:,k) = x_0;
      
    k_Newton_index = 1;
    
    while 1
        [x(:,k+1), k_Newton_temp]= MinimizeEqualLimit(x(:,k),nu,P,q,A,b,t,k);
        if i==1
            log_n_t_1(k_Newton_index:k_Newton_index+k_Newton_temp)  = log(n/t);
            k_Newton_1(k_Newton_index:k_Newton_index+k_Newton_temp) = k_Newton_index:1:k_Newton_index+k_Newton_temp;
            k_Newton_index                                          = k_Newton_temp + k_Newton_index;
        elseif i==2
            log_n_t_2(k_Newton_index:k_Newton_index+k_Newton_temp)  = log(n/t);
            k_Newton_2(k_Newton_index:k_Newton_index+k_Newton_temp) = k_Newton_index:1:k_Newton_index+k_Newton_temp;
            k_Newton_index                                          = k_Newton_temp + k_Newton_index;
        elseif i==3
            log_n_t_3(k_Newton_index:k_Newton_index+k_Newton_temp)  = log(n/t);
            k_Newton_3(k_Newton_index:k_Newton_index+k_Newton_temp) = k_Newton_index:1:k_Newton_index+k_Newton_temp;
            k_Newton_index                                          = k_Newton_temp + k_Newton_index;
        elseif i==4
            log_n_t_4(k_Newton_index:k_Newton_index+k_Newton_temp)  = log(n/t);
            k_Newton_4(k_Newton_index:k_Newton_index+k_Newton_temp) = k_Newton_index:1:k_Newton_index+k_Newton_temp;
            k_Newton_index                                          = k_Newton_temp + k_Newton_index;
        end
        m/t
        
        if (m/t)<EPSILON
            break;
        else
            t = MU*t;
            k = k+1;
        end
    end
    x_star(:,i) = x(:,end);
    p_star(i) = F_goal(x(:,end),P,q);
    for i_tmp = 1:1:m
        lambad_star(i_tmp,i) = 1/(t*x(i_tmp,end));
    end
    
    nu_star(:,i) = nu_star_KKTMathod(t,x_star(:,i),A,P,q,n)/t;
end


% plot
figure(1)
plot(k_Newton_1,log_n_t_1,k_Newton_2,log_n_t_2,k_Newton_3,log_n_t_3,k_Newton_4,log_n_t_4,'-','linewidth',1);
title('Logarithmic Dual Gap');
xlabel('k');
ylabel('log(n/t)');
legend(strcat("\mu:",string(mu(1))),strcat("\mu:",string(mu(2))),strcat("\mu:",string(mu(3))),strcat("\mu:",string(mu(4))));







 