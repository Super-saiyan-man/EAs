function Pp = Update2(P,Global)
%UPDATE2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    Pp = P(NDSort(P.objs,1) == 1);
    if length(Pp)>Global.N/2
        Pp = EnvironmentalSelection(Pp,Global.N/2);
    end
end

