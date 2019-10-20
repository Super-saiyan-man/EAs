function Score = getScore(P,PF)
    N = length(P);
    if N == 1
        Distance = min(pdist2(PF,P.obj),[],2);
        Score = mean(Distance);
    else
        Score = zeros(1,N);
        for i = 1:N
            Distance = min(pdist2(PF,P(i).obj),[],2);
            Score(i) = mean(Distance);  
        end
    end
end