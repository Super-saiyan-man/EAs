function[GNQ] = GetGNQ(GX,Q)
    %% Have some problem
    GNQ = Q(GX(1),GX(2),GX(3),:);
%     for i = 1:length(GNI)
%         GNQ = [GNQ;Q(GNI(i,1),GNI(i,2),:)];
%     end
end