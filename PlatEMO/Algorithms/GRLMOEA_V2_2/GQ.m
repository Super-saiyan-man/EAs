function [xp,a] = GQ(x,P,Q,G,Dis,K,epsilon,F,d,isg,loi,Global)
%GQ Algorithm 1: Grid-based Q learning
%   Input : 
%   x: the current solution
%   Population: the current population; 
%   Q: Q table in Q-learning
%   G: The grid system
%   Dis: The distance of one movement
%   K: The number of the intervals on each objective
%   Output: A new individual

    xp = zeros(1,length(x.dec));
    a = zeros(1,length(x.dec));
    % The grid of solution x 
    GX = G(ismember(P,x),:);
    % Generate the solution sequentially
    for index = 1:Global.D
        QX = Q(index,GX(index),:);
        if rand > epsilon || sum(QX) == 0
            NG = randperm(K,1);
        else
            [~,NG] = max(QX);
        end
        a(index) = NG;
        if loi(NG,index) >= 2
            p = cell2mat(isg(NG,index));
        else
            ps = isg(loi(:,index)>=2,index);
            p = cell2mat(ps(randperm(length(ps),1)));
        end
        p1 = P(p(1)).dec;
        p2 = P(p(2)).dec;
        diff = p1(index) - p2(index);
        xp(index) = diff + (NG - GX(index))*d(index);
    end
    xp = INDIVIDUAL(xp);
end

