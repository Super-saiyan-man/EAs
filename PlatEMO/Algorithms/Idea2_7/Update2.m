function Pp = Update2(P,Global,s)
%UPDATE2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    if s == 0
        Pp = P(NDSort(P.objs,1) == 1);
    else
        Pp = [Pp,P(NDSort(P.objs,1) == 1)];
    end
    len = Global.N/2;
    if length(Pp)>len
        Pp = EnvironmentalSelection(Pp,len);
    end
end

