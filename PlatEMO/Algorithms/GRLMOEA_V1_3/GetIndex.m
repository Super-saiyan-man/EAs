function [index] = GetIndex(GNI,a)
%TC �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    column = 1:length(GNI);
    index = column(ismember(GNI,a,'rows'))+length(a);
end

