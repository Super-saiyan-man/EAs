function Pb = Update1(P,Global,s)
%UPDATE1` �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [~,index] = min(P.objs);
    if s == 0
        Pb = P(index);
    else
        Pb = [Pb,P(index)];
    end
    len = Global.N/2;
    if length(Pb)>len
        Pp = EnvironmentalSelection(Pp,len);
    end
end