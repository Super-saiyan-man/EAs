function Offspring = REV(Population,k)
%REV 此处显示有关此函数的摘要
%   此处显示详细说明
    Offspring = INDIVIDUAL(k*(min(Population.decs) + max(Population.decs)) - Population.decs);
end