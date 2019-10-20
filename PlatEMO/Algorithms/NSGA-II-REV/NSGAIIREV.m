function NSGAIIREV(Global)
% <algorithm> <N>
% Nondominated sorting genetic algorithm II
% delta --- 0.5 --- delta
% k --- 0.5 --- k

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
    [delta,k] = Global.ParameterSet(0.5,0.5);
    [~,FrontNo,CrowdDis] = EnvironmentalSelection(Population,Global.N);

    %% Optimization
    while Global.NotTermination(Population)
        MatingPool = TournamentSelection(2,Global.N,FrontNo,-CrowdDis);
        if rand < delta
            Offspring = REV(Population,k);
        else
        	Offspring  = GA(Population(MatingPool));
        end
        [Population,FrontNo,CrowdDis] = EnvironmentalSelection([Population,Offspring],Global.N);
    end
end