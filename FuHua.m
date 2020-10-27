function [s,s1,s2,m1,m2]=FuHua(a,b,n)
	h=(b-a)/n;
    syms x;
    
%     fx=x/(4+x*x);  %2.(1)被积函数
    fx=(x)^(1/2);  %2.(3)被积函数

	s=vpa(int(fx,x,a,b),6);
    s1=0;
    for i=0:n-1 %梯形复杂化
        s1=s1+h/2*(subs(fx,{x},{a+i*h})+subs(fx,(x),{a+i*h+h}));
    end
    s1=vpa(s1,6);
    m1=double(vpa(s-s1,6));
    
    s2=0;
    for i=0:n-1  %Simpson复化
        s2=s2+h/6*(subs(fx,{x},{a+i*h})+4*subs(fx,{x},{a+(i+1/2)*h})...
            +subs(fx,{x},{a+(i+1)*h}));
    end
    s2=vpa(s2,6);
    m2=double(vpa(s-s2,6));
end