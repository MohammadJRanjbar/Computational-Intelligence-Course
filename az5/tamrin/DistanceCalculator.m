function sig = DistanceCalculator( Centers,n )
D=0;
for i=1:n
    for j=1:n
        Distance=abs(Centers(i)-Centers(j));
        if(Distance>D)
            D=Distance;
        end;
    end;
end;
sig=D/(n*sqrt(2));
end

