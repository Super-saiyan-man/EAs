function [GI] = ISG(G)
%ISG �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    index = 1:length(G);
    GIS = {};
    len = zeros(1,length(G));
    for i = 1:length(G)
        tmp = index(ismember(G,G(i)));
        len(i) = length(tmp);
        GIS = [GIS;tmp];
    end
    ai = index(len >= 2);
    si = randperm(numel(ai),1);
    GI = GIS(si);
end

