function [isg,loi] = ISG(G)
%ISG �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    isg = {};
    index = 1:length(G);
    loi = zeros(length(G),length(G(1,:)));
    for i = 1:length(G(1,:))
        tmp_isg = {};
        for j =1:length(G)
            tmp = [];
            tmp = [tmp,index(ismember(G(:,i),G(j,i)))];
            loi(j,i) = length(tmp);
            tmp_isg = [tmp_isg;tmp];
        end
        isg = [isg,tmp_isg];
    end
end

