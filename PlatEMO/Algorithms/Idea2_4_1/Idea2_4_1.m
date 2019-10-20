function Idea2_4_1(Global)
% <algorithm> <I>
% alpha --- 0.5 --- alpha
% beta --- 1 --- beta
% p --- 0.5 --- p


    %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;
    
    %% Step 1 Initialization:
    [alpha,beta,p] = Global.ParameterSet(0.5,1,0.5);
    P = Global.Initialization();

    while Global.NotTermination(P)
        alpha = 1 - Global.evaluated/Global.evaluation;
        Pb = Update1(P);
        Pp = Update2(P,Global);
        Pl = [PLS(Pb,alpha,beta,Global),PLS(Pp,alpha,beta,Global),Pb,Pp];
        P = [P,Pl];
        if rand<p
            Pl = [PLS(Pb,alpha,beta,Global),PLS(Pp,alpha,beta,Global),Pb,Pp];
            NP = Pl;
        else
            NP = GA(P);
        end
        P = EnvironmentalSelection([P,NP],Global.N);
    end
end

