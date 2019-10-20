function Pb = Update1(P)
%UPDATE1` 此处显示有关此函数的摘要
%   此处显示详细说明
    [~,index] = min(P.objs);
    Pb = P(index);
end