s=[0:.005:20];
Vmax=1;
km= 3;
V=Vmax*s./(km+s);
n=2
V1=Vmax*s.^n./(km+s.^n);
figure 
plot (s,V,s,V1)
a=7