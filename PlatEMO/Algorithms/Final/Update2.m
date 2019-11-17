function Pp = Update2(P,Global,Pp)
%UPDATE2 此处显示有关此函数的摘要
%   此处显示详细说明
    Pp = [Pp,P(NDSort(P.objs,1) == 1)];
    len = Global.N;
    if length(Pp)>len
        Pp = EnvironmentalSelection(Pp,len);
    end
end

