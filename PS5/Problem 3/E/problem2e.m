clear;
%parameter definitions
a=10; %value of parameter alpha
for n=[1,2]
        n
        syms u v
        eqn1= 0==a/(1+v^n)-u;
        eqn2= 0==a/(1+u^n)-v;
        %solve for steady state values
        [solu, solv] = vpasolve([eqn1,eqn2],[u,v],[0 8;0 8]);
       %compute eignevalues by creating Jacobian matrix
        us=double(solu);
        vs=double(solv);
        offdag=-n*a*vs^(n-1)/(1+vs^n)^2;
        jacobian=[-1,offdag;offdag,-1];
        eigenvalues=eig(jacobian)
end 
