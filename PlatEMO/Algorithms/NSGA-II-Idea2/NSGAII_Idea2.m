function NSGAII_Idea2(Global)
% <algorithm> <N>
% alpha --- 0.5 --- alpha
% Nondominated sorting genetic algorithm II

%------------------------------- Reference --------------------------------
% K. Deb, A. Pratap, S. Agarwal, and T. Meyarivan, A fast and elitist
% multiobjective genetic algorithm: NSGA-II, IEEE Transactions on
% Evolutionary Computation, 2002, 6(2): 182-197.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    %% Generate random population
    Population = Global.Initialization();
    [~,FrontNo,CrowdDis] = EnvironmentalSelection(Population,Global.N);
    
    alpha = Global.ParameterSet(0.5);
    Pb = Update1(Population);
    Pp = Update2(Population,Global);
    Pl = [PLS(Pb,alpha,Global),PLS(Pp,alpha,Global),Pb,Pp];

    %% Optimization
    while Global.NotTermination(Population)
        MatingPool = TournamentSelection(2,Global.N,FrontNo,-CrowdDis);
        Offspring  = GA(Population(MatingPool));
        [Population,FrontNo,CrowdDis] = EnvironmentalSelection([Population,Offspring,Pl],Global.N);
        Pb = Update1(Population);
        Pp = Update2(Population,Global);
        Pl = [PLS(Pb,alpha,Global),PLS(Pp,alpha,Global),Pb,Pp];
    end
end