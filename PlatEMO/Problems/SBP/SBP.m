classdef SBP < PROBLEM
% <problem> <Shared-Bike problem>
% The multi-point distance minimization problem
% lower --- 1 --- Lower bound of decision variables
% upper ---  20 --- Upper bound of decision variables

    methods
       %% Initialization
        function obj = SBP()
            [lower, upper] = obj.Global.ParameterSet(1,20);
            if isempty(obj.Global.M)
                obj.Global.M = 3;
            end
            if isempty(obj.Global.D)
                obj.Global.D = obj.Global.M + 9;
            end   
            obj.Global.lower    = zeros(1,obj.Global.D) + lower;
            obj.Global.upper    = zeros(1,obj.Global.D) + upper;
            obj.Global.encoding = 'real';
        end
        %% Calculate objective values
        function PopObj = CalObj(obj,PopDec)
            PopDec = floor(PopDec);
            PopObj(:,1) = Q;
            PopObj(:,2) = S;
           
        end
        
        function PopDec = Repair(PopDec)
            
        end
    end

end