function Out = predict( X,W,Centers,sig )
G=zeros(5,1);
    f1 = Gaussian(X,Centers(1),sig);
    f2 = Gaussian(X,Centers(2),sig);
    f3 = Gaussian(X,Centers(3),sig);
    f4 = Gaussian(X,Centers(4),sig);
    G(1,1)=1;
    G(2,1)=f1;
    G(3,1)=f2;
    G(4,1)=f3;
    G(5,1)=f4;
Out=transpose(W)*G
end

