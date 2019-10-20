function GRLMOEA_V1_1_1(Global)
% <algorithm> <G>
% K --- 10 --- The number of the intervals on each objective
% F --- 0.5 --- The scale parameter
% Dis --- 1 --- The grid distance of neighbour
% alpha --- 0.5 --- learning rate
% gamma --- 0.5 --- Q learning discount
% epsilon --- 0.4 --- Epsilon value of exploration and exploitation
    %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;
    [K,F,Dis,alpha,gamma,epsilon] = Global.ParameterSet(10,0.5,1,0.5,0.5,0.4);
    %% Step 1 Initialization:
    P = Global.Initialization();
    Q = zeros([K*ones(1,D),3^D]);
%     x_star = min(P.decs);
%     x_nad = max(P.decs);
    x_star = Global.lower;
    x_nad = Global.upper;
    [G,d] = GS(P,x_star,x_nad,K);
    %% Step 2 Reproduction:
    while Global.NotTermination(P)
        %% Step 1: Generate new individual
        [isg,loi] = ISG(G);
        TP = INDIVIDUAL;
        for i = 1:n
            [xp,a] = GQ(P(i),P,Q,G,Dis,K,epsilon,F,d,isg,loi);
            r = GR(xp,Global.PF);
            Q = UpdateQ(P(i),a,P,G,r,K,Dis,Q,gamma,alpha);
            TP = [TP,xp];
        end
        TP = TP(2:end);
        [P,~,~] = EnvironmentalSelection([P,TP],Global.N);
    end
end