clc 
clear all 
close all 
X=linspace(-3,3,100);
X=transpose(X);
n=4;
b=ones(100,1);
[idx,Centers] = kmeans(X,n);
sig = DistanceCalculator(Centers,n);
G=zeros(100,5);
for i =1:100
    f1 = Gaussian(X(i,1),Centers(1),sig);
    f2 = Gaussian(X(i,1),Centers(2),sig);
    f3 = Gaussian(X(i,1),Centers(3),sig);
    f4 = Gaussian(X(i,1),Centers(4),sig);
    G(i,1)=1;
    G(i,2)=f1;
    G(i,3)=f2;
    G(i,4)=f3;
    G(i,5)=f4;
end;
V=sin(X);
V1=V+0.05*randn(size(V));
A = G;
W = inv((transpose(A)*A))* transpose(A)*V1;
Output=predict( pi , W ,Centers,sig );
