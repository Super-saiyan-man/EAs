function Pp = Update2(P,Global)
%UPDATE2 此处显示有关此函数的摘要
%   此处显示详细说明
    Pp = P(NDSort(P.objs,1) == 1);
    if length(Pp)>Global.N/2
        Pp = EnvironmentalSelection(Pp,Global.N/2);
    end
end

