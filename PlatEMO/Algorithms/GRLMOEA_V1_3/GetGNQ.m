function[GNQ,Q] = GetGNQ(GX,Q)
    %% Have some problem
    coordinates = Q(:,1:length(GX));
    check = ismember(coordinates,GX,'rows');
    if sum(check) == 0
        Q = [Q;[GX,zeros(1,3^length(GX))]];
    end
    coordinates = Q(:,1:length(GX));
    index = ismember(coordinates,GX,'rows');
    GNQ = Q(index,length(GX)+1:end);
%     for i = 1:length(GNI)
%         GNQ = [GNQ;Q(GNI(i,1),GNI(i,2),:)];
%     end
end