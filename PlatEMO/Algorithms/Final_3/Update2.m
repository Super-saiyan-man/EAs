function Pb = Update2(P,Global,Pb)
%UPDATE2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    Pb = [Pb,P(NDSort(P.objs,1) == 1)];
    len = Global.N;
    if length(Pb)>len
        Pb = EnvironmentalSelection(Pb,len);
    end
end

