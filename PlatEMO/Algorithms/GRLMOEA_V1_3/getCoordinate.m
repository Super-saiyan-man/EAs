function [coordinate] = getCoordinate(NS,index)
%GETCOORDINATE 此处显示有关此函数的摘要
%   此处显示详细说明
    coordinate = [];
    for i = 1:length(NS)
        tmp = index(i);
        coordinate = [coordinate,NS{i}(tmp)];
    end
end

