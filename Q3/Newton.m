function [X,Y,F,F_d] = Newton(x0,y0)
    %1·¶Êý
    f = @(x,y)(1-x)^2+2*(y-x^2)^2;
    f_dx = @(x,y)-2*(1-x)-8*x*(y-x^2);
    f_dy = @(x,y)4*(y-x^2);
    
    f2_dx2 = @(x,y)2-8*y+24*x*x;
    f2_dxdy = @(x,y)-8*x;
    f2_dy2 = @(x,y)4;

    eps = 10^(-10);
    
    e = norm([abs(f_dx(x0,y0)),abs(f_dy(x0,y0))]);
    X = x0;
    Y = y0;
    F = f(x0,y0);
    F_d = e;
    syms a real
    n=1;
	
    while (e>eps)%&&(n<100)
        e
        n = n+1;
        f_dvalue = [f_dx(x0,y0);f_dy(x0,y0)];
        f_dLfsz = norm([f_dx(x0,y0),f_dy(x0,y0)],inf);
        H = [f2_dx2(x0,y0),f2_dxdy(x0,y0);
            f2_dxdy(x0,y0),f2_dy2(x0,y0)];
        H_inv = inv(H);
%         D=-[dot(H_inv(1,:),f_dvalue),dot(H_inv(2,:),f_dvalue)];
        D = Cholesky(H,f_dvalue);
		
        f1 = f(x0 + a*D(1),y0 + a*D(2));
        a0 = Precise_Linear_Search(f1,-10,10,10^(-12));
        a0 = double(a0);
		
        x0 = x0 + a0*D(1);
        y0 = y0 + a0*D(2);
		
        X(:,n)=x0;
        Y(:,n)=y0;
		
        F(n) = f(x0,y0);
		
        e = norm([abs(f_dx(x0,y0)),abs(f_dy(x0,y0))]);
        F_d(n) = e;
            
    end
end
 