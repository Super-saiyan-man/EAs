function Pp = Update2(P,Global,Pp)
%UPDATE2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    Pp = [Pp,P(NDSort(P.objs,1) == 1)];
    len = Global.N;
    if length(Pp)>len
        Pp = EnvironmentalSelection(Pp,len);
    end
end

