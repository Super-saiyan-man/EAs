function [index] = GetIndex(GNI,a)
%TC 此处显示有关此函数的摘要
%   此处显示详细说明
    column = 1:length(GNI);
    index = column(ismember(GNI,a,'rows'))+length(a);
end

