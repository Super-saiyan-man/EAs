function Pb = Update1(P,Global,Pb)
%UPDATE1` 此处显示有关此函数的摘要
%   此处显示详细说明
    [~,index] = min(P.objs);
    Pb = [Pb,P(index)];
    len = Global.N/5;
    if length(Pb)>len
        Pb = EnvironmentalSelection(Pb,len);
    end
end