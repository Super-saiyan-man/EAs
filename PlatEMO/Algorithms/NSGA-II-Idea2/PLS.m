function Pl = PLS(P,alpha,Global)
%PLS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    lower = min(P.decs,[],1);
    upper = max(P.decs,[],1);
    if length(P)>Global.N
        P = EnvironmentalSelection(P,Global.N);
    end
    [row,col] = size(P.decs);
    diff = (lower + (upper-lower).*rand([row,col])).*randsrc(row,col,[-1,1])*alpha;
    Pl = INDIVIDUAL(P.decs+diff);
end

