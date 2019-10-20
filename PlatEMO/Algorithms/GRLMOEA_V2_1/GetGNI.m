function[GNI] = GetGNI(x,K,Dis,P,G)
    GX = G(ismember(P,x),:);
    dm = zeros(K^length(x.dec),length(x.dec));
%     tmp = repmat((1:K),K^(length(x)-1),1);
    for i=1:length(x.dec)
        tmp = repmat(1:K,K^(length(x.dec)-i),1);
        dm(:,i) = repmat(tmp(:),K^(i-1),1);
    end
    % Allow to move to its own grid
    GNI = dm(max(abs(dm-GX),[],2)<=Dis,:);
end