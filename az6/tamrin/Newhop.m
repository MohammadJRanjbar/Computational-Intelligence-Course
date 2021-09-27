clear all;
close all;
clc;

B=-1.*ones(64,1);
B(18)=1;
B(23)=1;
B(26)=1;
B(31)=1;
B(34:39)=1;
B(53)=1;

D=-1.*ones(64,1);
D(2:4)=1;
D(12)=1;
D(21)=1;
D(29)=1;
D(37)=1;
D(45)=1;
D(52)=1;
D(58:60)=1;

K=-1.*ones(64,1);
K(8)=1;
K(15)=1;
K(22)=1;
K(29)=1;
K(37)=1;
K(45)=1;
K(50:53)=1;
K(42)=1;

G=-1.*ones(64,1);
G(41)=1;
G(49:53)=1;
G(45)=1;
G(37)=1;
G(29)=1;
G(22)=1;
G(15)=1;
G(8)=1;
G(6)=1;
G(13)=1;

P=-1.*ones(64,1);
P(18)=1;
P(26)=1;
P(34:39)=1;
P(31)=1;
P(23)=1;
P(51:54)=1;
P(60:61)=1;



U=reshape(B,8,8) ;   
figure
imagesc(U')
title('B')


U=reshape(D,8,8);   
figure
imagesc(U');
title('D')


U=reshape(K,8,8);    
figure
imagesc(U')
title('K')


U=reshape(G,8,8) ;  
figure
imagesc(U')
title('G')


U=reshape(P,8,8)  ; 
figure
imagesc(U')
title('P')


%Great hopfild network

input = [B D K];
net = newhop(input);


%in help of newhop in matlab 
Ai = input;
[Y,Pf,Af] = net(3,[],Ai);


%data  with 20% noise
 D_noise =D;
 B_noise =B;
 K_noise =K;
 
 
 for i = 1:(64*20/100)
      x = floor(rand()*64 + 1);
      D_noise(x) = D_noise(x) * -1;
 end
 
 
 for i = 1:(64*20/100)
      x = floor(rand()*64 + 1);
      K_noise(x) = K_noise(x) * -1;
 end
 
 for i = 1:(64*70/100)
      x = floor(rand()*64 + 1);
      B_noise(x) = B_noise(x) * -1;
 end


input_noise=[K_noise B_noise D_noise]; 
%in help of newhop in matlab 
Ai = input_noise;
[Y,Pf,Af] = net(3,[],Ai);

figure
U= reshape(hardlim(Y(:,3)), 8, 8);
%imagesc(U');
title('K-Saved')

figure
U= reshape(hardlim(Y(:,1)), 8, 8);
%imagesc(U');
title('B-Saved')

figure
U = reshape(hardlim(Y(:,2)), 8, 8);
%imagesc(U');
title('D-Saved')

input_new=[P G];
%in help of newhop in matlab 
Ai = input_new;
[Y,Pf,Af] = net([2 5],[],Ai);

figure
U= reshape(hardlim(Y{1}(:,1)), 8, 8);
%imagesc(U');
title('P-Saved')

figure
U= reshape(hardlim(Y{2}(:,2)), 8, 8);
%imagesc(U');
title('G-Saved')

 
 