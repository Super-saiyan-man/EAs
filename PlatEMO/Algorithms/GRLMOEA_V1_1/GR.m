function [r] = GR(xp,PF)
%     [y, ~, ~, best_value] = f(xp, PF);
    r = 1/min(sum((PF - xp.obj).^2,2));
end

