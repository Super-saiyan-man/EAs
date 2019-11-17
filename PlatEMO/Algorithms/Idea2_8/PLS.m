function Pl = PLS(P,alpha,Global)
%PLS 此处显示有关此函数的摘要
%   此处显示详细说明
    lower = min(P.decs,[],1);
    upper = max(P.decs,[],1);
    if length(P)>Global.N
        [P,~,CrowdDis] = EnvironmentalSelection(P,Global.N);
    else
        [~,~,CrowdDis] = EnvironmentalSelection(P,length(P));
    end
    [row,col] = size(P.decs);
    index = CrowdDis<mean(setdiff(CrowdDis,Inf));
    if sum(index)~=0
%         NP = Global.Initialization(sum(index));
%         NP = INDIVIDUAL(rand*(upper + lower) - P(index).decs);
        NP_rev = INDIVIDUAL(rand*(upper + lower) - P(index).decs);
        NP_ini = Global.Initialization(sum(index));
        NP = EnvironmentalSelection([NP_rev,NP_ini],sum(index));
    end
    
    m = (lower + (upper-lower).*rand([row,col])).*randsrc(row,col,[-1,1])*alpha;
    diff = m(0==index,:);
    if sum(index)~=0
        Pl = [INDIVIDUAL(P(0==index).decs+diff),NP];
    else
        Pl = INDIVIDUAL(P.decs+diff);
    end
end

