function A = sigmatrix_dif(x)

    [m,n]= size(x);
    result1=0;
    for i=1:m
          
         for j = 1:n   
             
         InP =    x(i,j) ;
         
             x(i,j) =Sig_dif (InP);       

                   end;                 
      end;  
      
A=x;
end

