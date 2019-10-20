function [r] = GR(x,xp,PF,Imp)

    r = Imp.*getScore(xp,PF);
end

