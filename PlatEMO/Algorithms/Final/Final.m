function Final(Global)
% <algorithm> <I>

    %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;
    
    %% Step 1 Initialization:
    P = Global.Initialization();
    P_p = INDIVIDUAL;
    P_b = INDIVIDUAL;
    s = 0;
    while Global.NotTermination(P)
        alpha = 1 - Global.evaluated/Global.evaluation;
        p = 1 - alpha;
        P_b = Update1(P,Global,P_b);
        P_p = Update2(P,Global,P_p);
        if s == 0
            P_b = P_b(2:end);
            P_p = P_p(2:end);
            s = 1;
        end
        P_b = [P_b,GA(P_b)];
%         Pl = [PLS([Pb,Pp],alpha,Global),Pb,Pp];
        if rand<p
            NP = PLS(P_p,alpha,Global);
        else
            NP = GA(P);
        end
        P = EnvironmentalSelection([P,NP,P_b],Global.N);
    end
end