function [NP,R] = NewP(P,alpha,beta,G,Q,PF)
%NEWP 此处显示有关此函数的摘要
%   此处显示详细说明
    NP = [];
    len = length(P);
    R = zeros(1,len);
    for i=1:len
        tmpP = P;
        x = zeros(1,length(P(i).dec));
        for j = 1:length(P(i).dec)
            si = cell2mat(ISG(G(:,j)));
            p = si(randperm(numel(si),2));
            x(j) = P(i).dec(j) + (max(Q(j,G(i,j),:))-G(i,j))*(P(p(1)).dec(j)-P(p(2)).dec(j));
        end
        x = INDIVIDUAL(x);
        tmpP(i) = x;
        R(i) = GR(tmpP,PF);
        NP = [NP;x];
    end
    NP = NP';
end