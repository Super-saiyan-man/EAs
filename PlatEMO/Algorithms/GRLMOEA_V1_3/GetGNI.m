function[GNI] = GetGNI(GX,K,Dis)
    NS = [];
    for i = 1:length(GX)
        NS = [NS,{max(GX(i)-Dis,1):min(GX(i)+Dis,K)}'];
    end
    U = cellfun(@length,NS);
    index = ones(1,length(NS));
    GNI = getCoordinate(NS,index);
    while ~all(U == index)
        index(end) = index(end) + 1;
        i = length(U);
        while index(i) > U(i)
            index(i) = index(i) - U(i);
            index(i - 1) = index(i - 1) + 1;
            i = i - 1;
        end
        GNI = [GNI;getCoordinate(NS,index)];
    end
end