function Final_5(Global)
% <algorithm> <I>

    %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;
    
    %% Step 1 Initialization:
    P = Global.Initialization();
    Pb = INDIVIDUAL;
    Pe = INDIVIDUAL;
    s = 0;
    while Global.NotTermination(P)
        alpha = 1 - Global.evaluated/Global.evaluation;
        p = 1 - alpha;
        Pe = Update1(P,Global,Pe);
        Pb = Update2(P,Global,Pb);
        if s == 0
            Pe = Pe(2:end);
            Pb = Pb(2:end);
            s = 1;
        end
        Pe = unique(Pe);
        Pb = unique(Pb);
        Pe = [Pe,GA(Pe)];
%         Pl = [PLS([Pb,Pp],alpha,Global),Pb,Pp];
        if rand<p
            NP = PLS(Pb,alpha,Global);
        else
            NP = GA(P);
        end
        P = EnvironmentalSelection([P,NP,Pe,Pb],Global.N);
    end
end