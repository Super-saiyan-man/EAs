function [coordinate] = getCoordinate(NS,index)
%GETCOORDINATE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    coordinate = [];
    for i = 1:length(NS)
        tmp = index(i);
        coordinate = [coordinate,NS{i}(tmp)];
    end
end

