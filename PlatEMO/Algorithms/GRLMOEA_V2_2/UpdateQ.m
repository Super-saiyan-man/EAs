function [Q] = UpdateQ(x,a,P,G,r,K,Dis,Q,gamma,alpha)
    % Get the grid of x
    GX = G(P==x,:);
%     index = (1:K)';
    for i = 1:length(GX)
        GXP = a(i);
%         GXP_GNI = index(abs(index - GXP)<=Dis);
        if sum(Q(i,GXP,:)) == 0
            aP = randperm(length(Q(i,GXP,:)),1);
        else
            [~,aP] = max(Q(i,GXP,:));
        end
%         aP = GXP_GNI(aP);
        Q(i,GX(i),a(i)) = Q(i,GX(i),a(i))+ alpha*(r(i)+gamma*Q(i,GXP,aP)-Q(i,GX(i),a(i)));
    end
end

