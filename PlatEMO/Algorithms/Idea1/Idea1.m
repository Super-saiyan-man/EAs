function Idea1(Global)
% <algorithm> <I>
% Idea1
% alpha --- 0.05 --- Information generate vector
% beta --- 0.05 --- Information volatilize vector
% rho --- 0.1 --- pheromone evaporation coefficient
% F --- 0.1 --- Scale vector
% K --- 10 --- The number of the intervals on each objective
    %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;

    [alpha,beta,rho,F,K] = Global.ParameterSet(0.05,0.05,0.1,0.1,10);
    %% Step 1 Initialization:
    P = Global.Initialization();
    x_star = Global.lower;
    x_nad = Global.upper;
    [G,d] = GS(P,x_star,x_nad,K);
    Q = ones(D,K,K);
    PF = Global.PF;
    %% Step 2 Reproduction:
    while Global.NotTermination(P)
        [NP,R] = NewP(P,alpha,beta,G,Q,PF);
        NGX = GS(NP,x_star,x_nad,K);
        Q = UpdateQ(Q,G,P,NGX,R,rho,F);
        TP = [P,NP]; 
        [P,~,~] = EnvironmentalSelection(TP,Global.N);
    end
end