function PB = Reuse_exemplars(Ao,PB,pi)
%REUSE_EXEMPLARS 此处显示有关此函数的摘要
%   此处显示详细说明
    fPB = f(PB,pi);
    [~,PBi] = sort(fPB,'descend');
    PB = PB(PBi,:);
    group1 = randperm(length(Ao),length(Ao)/2);
    group2 = setdiff(1:length(Ao),group1);
    for i = 1:length(Ao)/2
        if f(Ao(group1(i),:),pi) < f(Ao(group2(i),:),pi)
            E = Ao(group1(i),:);
        else
            E = Ao(group2(i),:);
        end
        if f(E,pi) < f(PB(i,:))
            PB(i,:) = E;
        end
    end
end

