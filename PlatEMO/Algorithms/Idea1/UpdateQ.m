function [Q] = UpdateQ(Q,G,P,NGX,R,rho,F)
%PDATEQ �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [len,sz] = size(G);
    for i = 1:len
        for j = 1:sz
            Q(j,G(i,j),NGX(i,j)) = (1-rho)*Q(j,G(i,j),NGX(i,j))+F*R(i);
        end
    end
end

