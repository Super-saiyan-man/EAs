function [Q] = UpdateQ(x,a,P,G,r,K,Dis,Q,gamma,alpha)
    % Get the grid of x
    GX = G(P==x,:);
    index = (1:K)';
    for i = 1:length(GX)
        GXP = a(i);
        GXP_GNI = index(abs(index - GXP)<=Dis);
        [~,aP] = max(Q(i,GXP,GXP_GNI));
        aP = GXP_GNI(aP);
        Q(i,GX(i),aP) = Q(i,GX(i),a(i))+ alpha*(r(i)+gamma*Q(i,GXP,aP)-Q(i,GX(i),a(i)));
    end
    
    
%     dv = a-GX;
%     % The next state when execute action a
%     GXP = GX+dv;
%     %% Have some problem
%     [~,aP] = max(Q(GXP(1),GXP(2),GXP(3),:));
%     dm = (1:3^(length(x.dec)));
%     update_index = dm(ismember(GNI,a,'rows'));     
%     Q(GX(1),GX(2),GX(3),update_index) = Q(GX(1),GX(2),GX(3),update_index) + alpha*(r + gamma*Q(GXP(1),GXP(2),GX(3),aP) - Q(GX(1),GX(2),GX(3),update_index));
end

