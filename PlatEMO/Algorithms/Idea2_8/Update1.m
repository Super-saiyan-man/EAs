function Pb = Update1(P,Global,Pb)
%UPDATE1` �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [~,index] = min(P.objs);
    Pb = [Pb,P(index)];
    len = Global.N/5;
    if length(Pb)>len
        Pb = EnvironmentalSelection(Pb,len);
    end
end