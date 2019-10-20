function [isg,loi] = ISG(G)
%ISG 此处显示有关此函数的摘要
%   此处显示详细说明
    isg = {};
    index = 1:length(G);
    loi = [];
    for i = 1:length(G)
        tmp = [];
        tmp = [tmp,index(ismember(G,G(i,:),'rows'))];
        loi = [loi;length(tmp)];
        isg = [isg;tmp];
    end
end

