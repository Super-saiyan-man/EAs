function [Q] = UpdateQ(x,a,P,G,r,K,Dis,Q,gamma,alpha,GNI)
    coordinates = Q(:,1:length(x.dec));
    % Get the grid of x
    GX = G(P==x,:);
    % The next state when execute action a
    GXP = a;
    GNIP = GetGNI(GXP,K,Dis);
    QP = Q(ismember(Q(:,1:length(GX)),GXP,'rows'),length(GX)+1:end);
    if sum(QP) == 0
        index = randperm(length(GNIP), 1);
    else
        [~,index] = max(QP);
    end
    aP = GNIP(index,:);
%     index = GetIndex(GX,GNI,a,Q);
%     XN = GXPQ;
    %% Have some problem
%     [~,aP] = max(Q(GXP(1),GXP(2),GXP(3),:));
%     dm = (1:3^(length(x.dec)));
%     update_index = dm(ismember(GNI,a,'rows'));   
    Q(ismember(coordinates,GX,'rows'),GetIndex(GNI,a)) = Q(ismember(coordinates,GX,'rows'),GetIndex(GNI,a))+alpha*(r+gamma*Q(ismember(coordinates,GXP,'rows'),GetIndex(GNIP,aP))-Q(ismember(coordinates,GX,'rows'),GetIndex(GNI,a)));
%     Q(GX(1),GX(2),GX(3),update_index) = Q(GX(1),GX(2),GX(3),update_index) + alpha*(r + gamma*Q(GXP(1),GXP(2),GX(3),aP) - Q(GX(1),GX(2),GX(3),update_index));
end

