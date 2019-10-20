function GRLMOEA_V2_1(Global)
% <algorithm> <G>
% K --- 100 --- The number of the intervals on each objective
% F --- 0.5 --- The scale parameter
% Dis --- 1 --- The grid distance of neighbour
% alpha --- 0.5 --- learning rate
% gamma --- 0.5 --- Q learning discount
% epsilon --- 0.4 --- Epsilon value of exploration and exploitation
    %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;
    [K,F,Dis,alpha,gamma,epsilon] = Global.ParameterSet(100,0.5,1,0.5,0.5,0.4);
    %% Step 1 Initialization:
    P = Global.Initialization();
    Q = zeros(D,K,K);
%     x_star = min(P.decs);
%     x_nad = max(P.decs);
    x_lower = Global.lower;
    x_upper = Global.upper;
    [G,d] = GS(P,x_lower,x_upper,K);
    %% Step 2 Reproduction:
    while Global.NotTermination(P)
        %% Step 1: Generate new individual
        [isg,loi] = ISG(G);
        TP = INDIVIDUAL;
        for i = 1:n
            [xp,a] = GQ(P(i),P,Q,G,Dis,K,epsilon,F,d,isg,loi,Global);
            r = GR(P(i),xp,Global.PF);
            Q = UpdateQ(P(i),a,P,G,r,K,Dis,Q,gamma,alpha);
            TP = [TP,xp];
        end
        TP = TP(2:end);
        [P,~,~] = EnvironmentalSelection([P,TP],Global.N);
        [G,d] = GS(P,x_lower,x_upper,K);
        G(G>K) = K;
    end
end