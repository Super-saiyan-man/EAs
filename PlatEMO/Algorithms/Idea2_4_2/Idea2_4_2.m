function Idea2_4(Global)
% <algorithm> <I>
% alpha --- 0.5 --- alpha
% p --- 0.5 --- p


    %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;
    
    %% Step 1 Initialization:
    [alpha,p] = Global.ParameterSet(0.5,0.5);
    P = Global.Initialization();

    while Global.NotTermination(P)
        alpha = 1 - Global.evaluated/Global.evaluation;
        Pb = Update1(P);
        Pp = Update2(P,Global);
        Pl = [PLS(Pb,alpha,Global),PLS(Pp,alpha,Global),Pb,Pp];
        P = [P,Pl];
        if rand<p
            Pl = [PLS(Pb,alpha,Global),PLS(Pp,alpha,Global),Pb,Pp];
            NP = Pl;
        else
            MatingPool = TournamentSelection(2,Global.N,FrontNo,-CrowdDis);
            NP = GA(P(MatingPool));
        end
        [P,FrontNo,CrowdDis] = EnvironmentalSelection([P,NP],Global.N);
    end
end

