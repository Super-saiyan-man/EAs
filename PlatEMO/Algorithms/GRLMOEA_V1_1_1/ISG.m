function [isg,loi] = ISG(G)
%ISG �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

