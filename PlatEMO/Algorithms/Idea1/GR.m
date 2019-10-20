function [r] = GR(xp,PF)
%     [y, ~, ~, best_value] = f(xp, PF);
    Distance = min(pdist2(PF,xp.objs),[],2);
    r = mean(Distance);
%     r = 1/min(sum((PF - xp.obj).^2,2));
end

