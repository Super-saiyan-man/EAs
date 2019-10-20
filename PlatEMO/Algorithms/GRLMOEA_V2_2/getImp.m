function Imp = getImp(P,Global,nSel,nPer,PF)
%GETIMP Get the importance of each dimension in the decision variable
%   Input: P the population

    [N,D] = size(P.decs);
    Imp = zeros(1,D);
    Samples = P(randperm(N,nSel)).decs;
    for i = 1:D
        Decs = repmat(Samples,nPer,1);
        Decs(:,i) = unifrnd(Global.lower(i),Global.upper(i),size(Decs,1),1);
        newPop = INDIVIDUAL(Decs);
        Imp(i) = sum(getScore(newPop,PF));
    end
    Imp = Imp/sum(Imp);
end

