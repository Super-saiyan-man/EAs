function Idea3(Global)
% <algorithm> <A>

    %% Parameter setting

    %% Generate the sampling points and random population
    Population = Global.Initialization();

    %% Optimization
    while Global.NotTermination(Population)
        NP = GA(EnvironmentalSelection(Population,Global.N));
        Population = [Population,NP];
    end
end