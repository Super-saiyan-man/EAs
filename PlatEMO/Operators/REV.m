function Offspring = REV(Population,k)
%REV �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    Offspring = INDIVIDUAL(k*(min(Population.decs) + max(Population.decs)) - Population.decs);
end