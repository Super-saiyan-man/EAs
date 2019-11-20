pi = 1;

MaxFEs = 5000;
%% Initialization

N = 100;
D = 2;
t = 0;
Ae = [];
Ap = [];
Ao = [];
pc = 0.5;
pm = 0.02;
M = N/4;
w = 0.7298; 

V = zeros(N,D);
[~,upper,lower] = f(zeros(1,D),pi);
X = lower + (upper-lower) * rand(N,D);
PB = X;
Xp = X;
[~,GBI] = min(f(X,pi));
GB = X(GBI,:);
%% experiment module
fave = zeros(MaxFEs,1);
fbest = zeros(MaxFEs,1);
%%
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
    fave(t) = mean(f(X,pi));
    fbest(t) = min(f(X,pi));
    disp(min(f(X,pi)));
end

plot(1:MaxFEs,fbest)

% scatter(X(:,1),X(:,2))

function ir =  Ir(X,Xp,pi)
    ir = (f(Xp,pi) - f(X,pi))./(exp(sum((Xp - X).^2,2)));
end