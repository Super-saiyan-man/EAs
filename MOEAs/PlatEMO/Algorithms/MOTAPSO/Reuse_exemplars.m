function PB = Reuse_exemplars(Ao,PB,pi)
%REUSE_EXEMPLARS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    fPB = f(PB,pi);
    [~,PBi] = sort(fPB,'descend');
    PB = PB(PBi,:);
    if mod(length(Ao),2)==1
        Ao = setdiff(Ao,Ao(randperm(length(Ao),1),:),'rows');
    end
    group1 = randperm(length(Ao),floor(length(Ao)/2));
    group2 = setdiff(1:length(Ao),group1);
    for i = 1:floor(length(Ao)/2)
        if f(Ao(group1(i),:),pi) < f(Ao(group2(i),:),pi)
            E = Ao(group1(i),:);
        else
            E = Ao(group2(i),:);
        end
        if f(E,pi) < f(PB(i,:),pi)
            PB(i,:) = E;
       end
    end
end

