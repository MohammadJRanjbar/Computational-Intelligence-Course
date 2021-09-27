close all;
clear all;
clc;
W=[0 1 1 -1;1 0 1 -1;1 1 0 -1;-1 -1 -1 0];
S1=[0 ;1 ;1 ;1];
T1=S1;
while(1)
    
    S2=sign(W*T1);
    
    if(T1==S2)
        break;
    end
    
    T1=S2;
    
end
vorodi = S1'
olgoo = S2'