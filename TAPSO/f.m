function [fx,upper,lower] = f(X,index)
%F �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    if index == 1
        fx = sum(X.^2,2);
        upper = 5.12;
        lower = -5.12;
    end
end

