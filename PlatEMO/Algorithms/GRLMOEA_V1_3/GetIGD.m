function [outputArg1,outputArg2] = GetIGD(inputArg1,PF)
%GETIGD 此处显示有关此函数的摘要
%   此处显示详细说明
    Distance = min(pdist2(PF,PopObj),[],2);
    Score    = mean(Distance);
end

