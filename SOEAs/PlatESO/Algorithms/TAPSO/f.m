function [y,upper,lower] = f(X,index)
%F �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    if index == 1
        y = sum(X.^2,2);
        upper = 100;
        lower = -100;
    end
end