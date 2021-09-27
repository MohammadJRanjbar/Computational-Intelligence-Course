clear all 
close all 
clc 
Data=rand([1,12])*20;
Data = sort(Data);
k=3;
K_means(Data,k);

