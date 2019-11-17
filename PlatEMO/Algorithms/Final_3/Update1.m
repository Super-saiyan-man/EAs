function Pe = Update1(P,Global,Pe)
%UPDATE1` 此处显示有关此函数的摘要
%   此处显示详细说明
    [~,index] = min(P.objs);
    Pe = [Pe,P(index)];
    len = Global.N/5;
    if length(Pe)>len
        Pe = EnvironmentalSelection(Pe,len);
    end
end