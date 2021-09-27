% clc 
% clear all 
% close all
% x=[0 0 ; 1 1 ; 1 0 ; 0 1 ];
% y=[0 ; 1 ; 1 ; 0 ] ;
% W1=rand([2 2]);
% W2=rand([2 1]);
% B1=rand([1 2]);
% B2=rand([1 1]);
% 
% A1=x*W1;
% A1=A1+B1;
% Net1=sigmatrix(A1);
% A2=A1*W2;
% A2=A2+B2;
% OutP=sigmatrix(A2);
% Error=y-OutP;
% d_OutP = Error * Sig_dif(OutP)
%% 27/11/2017
%%Jannat Al-Saidi
%%Learning Machine
%%Exclusive-OR using back bropagation using one hidden layer 
%%Initialy to all set MATLAB
clear                                           
clc                                               
%%Input value for x1&x2
x1=[0 0 1 1];                              
x2=[0 1 0 1];                              
%% To initial the weights randomly 
w13=rand()-0.5; 
w14=rand()-0.5;
w23=rand-0.5;
w24=rand-0.5;
w35=rand-0.5;
w45=rand-0.5;
%%To initial the threshold values 
theta3= 0.8;
theta4=-0.1;
theta5=0.3;
%% Output value to arrival it
yt=[0 1 1 0];
%% To get learning rate from user
alpha=input('alpha = ');
%%Initial the error value 
e=1;                                 
%%Initial the epoch value 
epoch=1;
%%Definition the sigmoid function to use it in code 
sig=@(d)   1/(1+exp(-d));
der_sigmf=@(k)  sig(k)*(1-sig(k));
%%While loop to have a very small absolute value of error between the ...
%%output and output desired value
while abs(e)>=0.1           
for n=1:4
    %%
    y3=sig((x1(n)*w13+x2(n)*w23)-theta3);
    y4=sig((x1(n)*w14+x2(n)*w24)-theta4);
    y5(n)=sig((y3*w35+y4*w45)-theta5);
   
     %% new value of error 
    e=yt(n)-y5(n);
    
   %%find "delta" to know how must the weight and threshold "theta" change it's value to reduce
    %%the error
    
    s5= sig(y5(n))*(1-sig(y5(n)));
    delta_5=e*s5;
    delta_w35=alpha*y3*delta_5;
    delta_w45=alpha*y4*delta_5;
    delta_theta5=alpha*-1*delta_5;
    
     s3= y3*(1-y3);
      delta_3=w35*delta_5*s3;
     delta_w13=alpha*x1(n)*delta_3;
     delta_w23=alpha*x2(n)*delta_3;
     delta_theta3=alpha*-1*delta_3;
    
    
       s4= y4*(1-y4);
       delta_4=w45*delta_5*s4;
       delta_w14=alpha*x1(n)*delta_4;
      delta_w24=alpha*x2(n)*delta_4;
      delta_theta4=alpha*-1*delta_4;
     
    %%New values of weights
    w13=w13+delta_w13;
    w14=w14+delta_w14;
    w23=w23+delta_w23;
    w24=w24+delta_w24;
    %%New values of theshold
    theta3=theta3+delta_theta3;
    theta4=theta4+delta_theta4;
    theta5=theta5+delta_theta5;
    
end
%%NO. of epochs 
epoch=epoch+1
end


