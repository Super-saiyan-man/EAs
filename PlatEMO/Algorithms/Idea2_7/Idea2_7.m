function Idea2_7(Global)
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
    s = 0;
    while Global.NotTermination(P)
%         alpha = 1 - Global.evaluated/Global.evaluation;
        if s==0
            Pb = Update1(P,Global,s);
            Pp = Update2(P,Global,s);
            s = 1;
        end
%         Pl = [PLS([Pb,Pp],alpha,Global),Pb,Pp];
        if rand<p
            Pl = [PLS([Pb,Pp],alpha,Global),Pb,Pp];
            NP = Pl;
        else
            NP = GA(P);
        end
        P = EnvironmentalSelection([P,NP],Global.N);
    end
end