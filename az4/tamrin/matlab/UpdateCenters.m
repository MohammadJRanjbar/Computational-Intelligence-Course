function Centers = UpdateCenters( Centers , Mask , Data )
    for j = 1:length(Centers) 
        
        temp1=0;
        Sum=0;
        for i=1:length(Data)
            if Mask(i)==j
                temp1=temp1+1;
                Sum=Data(i)+Sum;
            end;
        end;
        Centers(j)=Sum/temp1;
    end;
end

