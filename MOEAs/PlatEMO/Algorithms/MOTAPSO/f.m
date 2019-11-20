function [fx,upper,lower] = f(X,index)
%F 此处显示有关此函数的摘要
%   此处显示详细说明
    if index == 1
        fx = sum(X.^2,2);
        upper = 5.12;
        lower = -5.12;
    end
end

