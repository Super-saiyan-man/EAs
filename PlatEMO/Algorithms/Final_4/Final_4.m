function Final_4(Global)
% <algorithm> <I>
% NE --- 50 --- The number of divisions in each objective
% NB --- 20 --- The number of divisions in each objective

    %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;
    [NB,NE] = Global.ParameterSet(20,50);
    
    %% Step 1 Initialization:
    P = Global.Initialization();
    Pb = INDIVIDUAL;
    Pe = INDIVIDUAL;
    s = 0;
    while Global.NotTermination(P)
        alpha = 1 - Global.evaluated/Global.evaluation;
        p = Global.evaluated/Global.evaluation;
        Pe = Update1(P,Global,Pe,NE);
        Pb = Update2(P,Global,Pb,NB);
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
%             NP = REV(P,Pb);
            NP = GA(P);
        end
        P = EnvironmentalSelection([P,NP,Pe,Pb],Global.N);
    end
end