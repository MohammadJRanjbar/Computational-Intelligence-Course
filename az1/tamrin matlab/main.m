 clear all 
 close all 
 clc 
 x = input(' Matrix :\n');
 [m,n]= size(x);
 Result=0;
    for i=1:m
        for j=1:n
            Output=Tanh(x(i,j));
            Result=Result+Output;
        end;
    end;
    Result