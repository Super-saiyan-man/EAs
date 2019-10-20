function Pl = PLS(P,alpha,Global)
%PLS 此处显示有关此函数的摘要
%   此处显示详细说明
    lower = min(P.decs,[],1);
    upper = max(P.decs,[],1);
    if length(P)>Global.N
        P = EnvironmentalSelection(P,Global.N);
    end
    [row,col] = size(P.decs);
    diff = (lower + (upper-lower).*rand([row,col])).*randsrc(row,col,[-1,1])*alpha;
    Pl = INDIVIDUAL(P.decs+diff);
end

