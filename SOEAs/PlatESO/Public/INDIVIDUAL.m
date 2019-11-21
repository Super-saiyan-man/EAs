classdef INDIVIDUAL < handle
    %INDIVIDUAL 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        dec;
        obj;
    end
    
    methods
        function obj = INDIVIDUAL(Decs)
            %INDIVIDUAL 构造此类的实例
            %   此处显示详细说明
            obj.dec = Decs;
        end
    end
end

