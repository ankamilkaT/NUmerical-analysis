function [s,s1,s2,m1,m2]=FuHua(a,b,n)
	h=(b-a)/n;
    syms x;
    d=7;  %保留有效位数
    
    fx=x/(4+x*x);  %2.(1)被积函数
%     fx=(x)^(1/2);  %2.(3)被积函数
%     fx=sinx/x;  %方案1

	s=vpa(int(fx,x,a,b),d);
    s1=0;
    for i=0:n-1 %梯形复杂化
        s1=s1+h/2*(subs(fx,{x},{a+i*h})+subs(fx,(x),{a+i*h+h}));
    end 
    m1=roundn(double(s1-s),-d-1);
    s1=vpa(s1,d);
    
    s2=0;
    for i=0:n/2-1  %Simpson复化
        s2=s2+h/3*(subs(fx,{x},{a+2*i*h})+4*subs(fx,{x},{a+(2*i+1)*h})...
            +subs(fx,{x},{a+(2*i+2)*h}));
    end
    m2=roundn(double(s2-s),-d-1);
    s2=vpa(s2,d);
end
