function [outputArg1,outputArg2] = GetIGD(inputArg1,PF)
%GETIGD �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    Distance = min(pdist2(PF,PopObj),[],2);
    Score    = mean(Distance);
end

