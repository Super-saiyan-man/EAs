function Pl = PLS(P,alpha,Global)
%PLS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    lower = min(P.decs,[],1);
    upper = max(P.decs,[],1);
    [~,~,CrowdDis] = EnvironmentalSelection(P,length(P));
    [row,col] = size(P.decs);
    index = CrowdDis<mean(setdiff(rmmissing(CrowdDis),Inf));
    if sum(index)~=0
        NP = INDIVIDUAL(rand*(upper + lower) - P(index).decs);
    end
    m = (lower + (upper-lower).*rand([row,col])).*randsrc(row,col,[-1,1])*alpha;
    diff = m(0==index,:);
    if sum(index)~=0
        Pl = [INDIVIDUAL(P(0==index).decs+diff),NP];
    else
        Pl = INDIVIDUAL(P.decs+diff);
    end
end

