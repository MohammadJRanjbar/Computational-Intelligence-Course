function [ A , B ] = sigmatrix(A)

    [m,n]= size(A);
    result1=0;
    result2=0;
    for i=1:m
          
         for j = 1:n   
             
         InP =    x(i,j) ;
         
             OutP1 =sigmoid (InP);       
             OutP2=Sig (OutP1);
             result1=OutP1+result1;  
             result2=OutP2+result2;
                   end;                 
      end;  
      
A=result1
B=result2
end

