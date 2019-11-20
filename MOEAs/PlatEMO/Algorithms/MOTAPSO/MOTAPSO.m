function MOTAPSO(Global)
% <algorithm> <M>
% pc --- 10 --- pc
% pm --- 10 --- pm
% w --- 0.7298 --- w

   %% Parameter definition
    m = Global.M;
    n = Global.N;
    D = Global.D;
    [pc,pm,w] = Global.ParameterSet(0.5,0.02,0.7098);
    M = n/4;
    %% Generate random population
    P = Global.Initialization();
    V = zeros(n,D);
    PB = P;
    Pp = P;
    GB = P(NDSort(P.objs,1) == 1);
    %% Optimization
    while Global.NotTermination(P)
        Ae = EnvironmentalSelection(P,M);
        [~,ApI] = sort(Ir(P,Pp),'descend');
        Ap = P(ApI(1:M));
        pk = (M:-1:1)/sum(M:-1:1);
        E = INDIVIDUAL;
        for i = 1:n
            E = [E,Breed_Exemplar(Ae.decs,Ap.decs,pm,pc,pk)];
            if i == 1
                E = E(2:end);
            end
            [P,V] = Select_learning_model(P,V,E,PB,GB,w,i);
        end
    end

N = 20;
D = 10;
t = 0;
Ae = [];
Ap = [];
Ao = [];
pc = 0.5;
pm = 0.02;
M = N/4;
w = 0.7298; 

V = zeros(N,D);
X = lower + (upper-lower) * rand(N,D);
PB = X;
Xp = X;
[~,GBI] = min(f(X,pi));
GB = X(GBI,:);



while t < MaxFEs
    t = t + 1;
    [~,AeI] = sort(f(X,pi));
    Ae = X(AeI(1:M),:);
    [~,ApI] = sort(Ir(X,Xp,pi),'descend');
    Xp = X;
    Ap = X(ApI(1:M),:);
    pk = (M:-1:1)/sum(M:-1:1);
    E = zeros(N,D);
    for i = 1:N
        E(i,:) = Breed_Exemplar(Ae,Ap,pm,pc,pk);
        [X,V] = Select_learning_model(X,V,E,PB,GB,i,pi,w);
        if length(Ao)<N && f(E(i,:),pi)<f(PB(i,:),pi)
            Ao = [Ao;E(i,:)];
        elseif length(Ao) >= N && f(E(i,:),pi)<f(PB(i,:),pi)
            ri = randperm(length(Ao),2);
            Ej1 = Ao(ri(1),:);
            Ej2 = Ao(ri(2),:);
            if f(Ej1,pi) > f(Ej2,pi)
                Ao(ri(1),:) = E(i,:);
            else
                Ao(ri(2),:) = E(i,:);
            end
        end
        if f(X(i,:),pi) < f(PB(i,:),pi)
            PB(i,:) = X(i,:);
        end
    end
    PB = Reuse_exemplars(Ao,PB,pi);
    [~,GBI] = min(f(X,pi));
    GB = X(GBI,:);
end

function ir =  Ir(P,Pp)
    ir = sum((Pp.objs - P.objs).^2,2)./(exp(sum((Pp.decs - P.decs).^2,2)));
end
end