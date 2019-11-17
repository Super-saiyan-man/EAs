function Pb = Update1(P,Global,s)
%UPDATE1` 此处显示有关此函数的摘要
%   此处显示详细说明
    [~,index] = min(P.objs);
    if s == 0
        Pb = P(index);
    else
        Pb = [Pb,P(index)];
    end
    len = Global.N/2;
    if length(Pb)>len
        Pp = EnvironmentalSelection(Pp,len);
    end
end