function Pb = Update1(P)
%UPDATE1` �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [~,index] = min(P.objs);
    Pb = P(index);
end