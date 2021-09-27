function Pn = normalize( P )
[m,n]=size(P);
for i=1:m
    for j=1:n
        if (P(i,j)==255)
            Pn(i,j)=1;
        else
            Pn(i,j)=-1;
    end
    end
end
end

