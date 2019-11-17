function Idea2_8(Global)
% <algorithm> <I>



    %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;
    
    %% Step 1 Initialization:
%     [alpha,p] = Global.ParameterSet(0.5,0.5);
    P = Global.Initialization();
    Pp = INDIVIDUAL;
    Pb = INDIVIDUAL;
    s = 0;
    while Global.NotTermination(P)
        alpha = 1 - Global.evaluated/Global.evaluation;
        p = 1 - alpha;
        Pb = Update1(P,Global,Pb);
        Pp = Update2(P,Global,Pp);
        if s == 0
            Pb = Pb(2:end);
            Pp = Pp(2:end);
            s = 1;
        end
        Pb = [Pb,GA(Pb)];
%         Pl = [PLS([Pb,Pp],alpha,Global),Pb,Pp];
        if rand<p
            Pl = PLS(Pp,alpha,Global);
            NP = Pl;
        else
            NP = GA(P);
        end
        if length(NP)>Global.N
        	NP = EnvironmentalSelection(NP,Global.N);
        end
        P = EnvironmentalSelection([P,NP,Pb],Global.N);
    end
end