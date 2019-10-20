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

    % The grid of solution x 
    GX = G(ismember(P,x),:);
%     for col = 1:length(x)
%         index = 1:K;
%         GNI = index((abs(index - GX(col))<=Dis));
%         GNQ = Q(col,GNI,:);
%         GNS = isg(GNI);
%         
%     end
    index = (1:K)';
    xp = zeros(1,length(x.dec));
    a = zeros(1,length(x.dec));
    for i = 1:length(x.dec)
        % Grid neighbour index
        GNI = index(abs(index - GX(i))<=Dis);
        % Grid neighbour q-value
        GNQ = Q(i,GX(i),GNI);
        % Grid neighbour solutions
        GNS = isg(GNI,i);
        % Grid neighbour solution's q-value
%         GNSQ = zeros(1,1,2*Dis+1);
%         for ios = 1:length(GNS)
%             s = cell2mat(GNS(ios));
%             tmp_GNQ = sum(Q(i,s,GNI),2);
%             GNSQ = GNSQ(1:length(tmp_GNQ))+tmp_GNQ;
%         end
%         H = GNQ(1:length(GNI))+GNSQ(1:length(GNI));
        H = GNQ(1:length(GNI));
        if rand>epsilon||sum(H(:))==0
            a(i) = GNI(randperm(length(GNQ),1));
        else
            [~,max_index] = max(H);
            a(i) = GNI(max_index,:);
        end
        % Get the direction vector
        dv = GX(i) - a(i);
        if dv == 0
            % Solutions in the same grid
            tmp_isg = isg(loi>=2);
            if isempty(tmp_isg)==1
                rs = randperm(length(P));
                xp(i) = x.dec(i)+F.*(P(rs(1)).dec(i)-P(rs(2)).dec(i));
            else
                sisg = cell2mat(tmp_isg(randi(length(tmp_isg))));
                xp(i) = x.dec(i)+F.*(P(sisg(1)).dec(i)-P(sisg(2)).dec(i));
            end
        else
            if length(GNS)>=2
                for t = 1:length(GNS)
                    if length(cell2mat(GNS(t)))>=2
                        ri = cell2mat(GNS(t));
                        break
                    end
                    if t == length(GNS)
                        tmp_isg = isg(loi>=2);
                        ri = tmp_isg(randperm(length(tmp_isg),1));
                        ri = cell2mat(ri);
                    end
                end
                xp(i) = x.dec(i)+F*dv.*(P(ri(1)).dec(i)-P(ri(2)).dec(i));
            else
                xp = x.dec+dv.*d;
            end
        end
    end
    lower = Global.lower(1);
    upper = Global.upper(1);
    l_index = xp<lower;
    u_index = xp>upper;
    xp(l_index) = min(upper,2*lower-xp(l_index));
    xp(u_index) = max(lower,2*upper-xp(u_index));
    xp = INDIVIDUAL(xp);
    
%     % Grid neighbour index
%     GNI = GetGNI(x,K,Dis,P,G);
%     % Grid neighbour solutions
%     a=ismember(G,GNI,'rows');
%     b=1:length(P);
%     GNS = b(a);
%     % Grid neighbour q-value
%     GNQ = GetGNQ(GX,Q);
%     % Grid neighbour solution's q-value
%     GNSQ = zeros([ones(1,length(x.dec)),3^length(GX)]);
%     for i = 1:length(GNS)
%         pos =  G(GNS(i),:);
%         %% Have some problem
%         tmpgnq = Q(pos(1),pos(2),pos(3),:);
%         GNSQ = GNSQ + tmpgnq;
%     end
%     H = GNQ(1:length(GNI))+GNSQ(1:length(GNI));
%     if rand>epsilon || sum(H(:))==0
%         index = randperm(length(GNI),1);
%         a = GNI(index,:);
%     else
%         [~,max_index] = max(H);
%         a = GNI(max_index,:);
%         a = a(1,:);
%     end
%     % Get the direction vector
%     dv = a-GX;
%     if sum(abs(dv),2)==0
%         % Solutions in the same grid
%         tmpisg = isg(loi>=2);
%         if isempty(tmpisg)==1
%             rs = randperm(length(P));
%             xp = x.dec+F.*(P(rs(1)).dec-P(rs(2)).dec);
%         else
%             sisg = cell2mat(tmpisg(randi(length(tmpisg))));
%             xp = x.dec+F.*(P(sisg(1)).dec-P(sisg(2)).dec);
%         end  
%     else
%         if length(GNS)>=2
%             rl = GNS(randperm(length(GNS),2));
%             xp = x.dec+F*dv.*(P(rl(1)).dec-P(rl(2)).dec);
%         else
%             xp = x.dec+dv.*d;
%         end
%     end
%     xp = INDIVIDUAL(xp);
end

