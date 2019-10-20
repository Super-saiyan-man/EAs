function [xp,a] = GQ(x,P,Q,G,Dis,K,epsilon,F,d,isg,loi)
%GQ Algorithm 1: Grid-based Q learning
%   Input : 
%   x: the current solution
%   Population: the current population; 
%   Q: Q table in Q-learning
%   G: The grid system
%   Dis: The distance of one movement
%   K: The number of the intervals on each objective
%   Output: A new individual

% The grid of solution x 
    index = ismember(P,x);
    tmp = G(index,:);
    GX = tmp(1,:);
    % Grid neighbour index
    GNI = GetGNI(x,K,Dis,P,G);
    % Grid neighbour solutions
    a=ismember(G,GNI,'rows');
    b=1:length(P);
    GNS = b(a);
    % Grid neighbour q-value
    GNQ = GetGNQ(GX,Q);
    % Grid neighbour solution's q-value
    GNSQ = zeros([ones(1,length(x.dec)),3^length(GX)]);
    for i = 1:length(GNS)
        pos =  G(GNS(i),:);
        %% Have some problem
        tmpgnq = Q(pos(1),pos(2),pos(3),:);
        GNSQ = GNSQ + tmpgnq;
    end
    H = GNQ(1:length(GNI))+GNSQ(1:length(GNI));
    if rand>epsilon || sum(H(:))==0
        index = randperm(length(GNI),1);
        a = GNI(index,:);
    else
        [~,max_index] = max(H);
        a = GNI(max_index,:);
        a = a(1,:);
    end
    % Get the direction vector
    dv = a-GX;
    if sum(abs(dv),2)==0
        % Solutions in the same grid
        tmpisg = isg(loi>=2);
        if isempty(tmpisg)==1
            rs = randperm(length(P));
            xp = x.dec+F.*(P(rs(1)).dec-P(rs(2)).dec);
        else
            sisg = cell2mat(tmpisg(randi(length(tmpisg))));
            xp = x.dec+F.*(P(sisg(1)).dec-P(sisg(2)).dec);
        end  
    else
        if length(GNS)>=2
            rl = GNS(randperm(length(GNS),2));
            xp = x.dec+F*dv.*(P(rl(1)).dec-P(rl(2)).dec);
        else
            xp = x.dec+dv.*d;
        end
    end
    xp = INDIVIDUAL(xp);
end

