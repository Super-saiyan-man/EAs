function Z = ZS(Objs,K)
%ZS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    sigma = 1e-11;
    Objs = Objs(:,2);
    d = (max(Objs)-min(Objs)+2*sigma)/K;
    Z = ceil((Objs-min(Objs)+sigma)./d);
end

