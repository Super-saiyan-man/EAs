function [P,V] = Select_learning_model(P,V,E,PB,GB,w,i)
%SELECT_LEARNING_MODEL 此处显示有关此函数的摘要
%   此处显示详细说明
    if f(E(i,:),pi)<f(GB,pi)
        V(i,:) = w * V(i,:) + rand(1,length(P(1,:))) .* (E(i,:) - P(i,:));
    elseif f(E(i,:),pi)<f(PB(i,:),pi)
        V(i,:) = w * V(i,:) + rand(1,length(P(1,:))) .* (E(i,:) - P(i,:)) + rand(1,length(P(1,:))) .* (GB - P(i,:));
    else
        V(i,:) = w * V(i,:) + rand(1,length(P(1,:))) .* (PB(i,:) - P(i,:));
    end
    P(i,:) = P(i,:) + V(i,:);
end

