function Centers = K_means( Data , k )
Centers=rand([1,k])*20;
Centers = sort(Centers);
    for j=1:200
        Ce=Centers;
        Mask=Distance_Calculator(Data,Centers);
        Centers=UpdateCenters( Centers , Mask , Data );
        if(isequal(Ce,Centers))
            break;
        end;
    end;
end

