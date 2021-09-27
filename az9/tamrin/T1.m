clear all 
close all 
clc
U=0:0.01:1;
A=gaussmf(U,[3 10]);
B=gaussmf(U,[5 20]);
S(A,B);
 