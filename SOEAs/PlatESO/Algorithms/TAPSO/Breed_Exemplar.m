function E = Breed_Exemplar(Ae,Ap,pm,pc,pk,upper,lower)
%BREED_EXEMPLAR �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [M,D] = size(Ae);
    r = rand(1,D);
    Xp1 = diag(Ae(randsample(1:M,D,1,pk),1:D))';
    Xp2 = diag(Ap(randsample(1:M,D,1,pk),1:D))';
    E = Xp2.*(r<pc)+Xp1.*(r>=pc);
    r = rand(1,D);
    tmp = lower + (upper-lower) * rand(1,D);
    E(r<pm) =tmp(r<pm);
end

