function Pe = Update1(P,Global,Pe)
%UPDATE1` �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [~,index] = min(P.objs);
    Pe = [Pe,P(index)];
    len = Global.N/5;
    if length(Pe)>len
        Pe = EnvironmentalSelection(Pe,len);
    end
end