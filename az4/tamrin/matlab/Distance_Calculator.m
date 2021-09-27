function Mask  = Distance_Calculator( Data , Centers )
Distance=20;
temp=20;
Mask=rand([1,length(Data)])*0;
for i=1:length(Data)
    for j=1:length(Centers)
            E=abs(Data(i)-Centers(j));
            if(Distance>E)
                Distance=E;
                temp=j;
            end;
           
end;
    Mask(i)=temp;
    Distance=20;
    end;
    
end
