function [X,V] = Select_learning_model(X,V,E,PB,GB,i,pi,w)
%SELECT_LEARNING_MODEL 此处显示有关此函数的摘要
%   此处显示详细说明
    if f(E(i,:),pi)<f(GB,pi)
        V(i,:) = w * V(i,:) + rand * (E(i,:) - X(i,:));
    elseif f(E(i,:),pi)<f(PB(i,:),pi)
        V(i,:) = w * V(i,:) + rand * (E(i,:) - X(i,:)) + rand * (GB - X(i,:));
    else
        V(i,:) = w * V(i,:) + rand * (PB(i,:) - X(i,:));
    end
    X(i,:) = X(i,:) + V(i,:);
end

