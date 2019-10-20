function [r] = GR(x,xp,PF)
%     [y, ~, ~, best_value] = f(xp, PF);
    r = zeros(1,length(x.dec));
    index = (1:length(x.dec));
%         tmp_x = INDIVIDUAL(x.dec.*(i ~= index)+xp.dec.*(i == index));
        
    r = repmat(1/mean(sum((PF - x.obj).^2,2)),1,length(x.dec));
end

