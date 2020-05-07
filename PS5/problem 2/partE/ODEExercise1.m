clear all
close all

%c(1)is ca and c(2) is cr 

trange=[0,30];
c0=[1,10];
[t,c]=ode45(@dcdt,trange,c0);
ca=c(:,1);
cr=c(:,2);
figure; plot(t,[ca,cr]);xlabel('t');ylabel('c');
legend('ca','cr')
