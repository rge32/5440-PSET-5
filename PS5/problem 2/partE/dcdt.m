function [dcbydt] = dcdt(t,c)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%define the parameters
ror=1;
rr=100;
roa=100;
ra=5000;
da=30;

%define thee differential equations
dcbydt(1)=-da*c(1)+(roa+ra*c(1)^2)/(1+c(1)^2+c(2)^2);
dcbydt(2)= -c(2)+(ror+rr*c(1)^2)/(1+c(1)^2);
dcbydt=dcbydt';
end
