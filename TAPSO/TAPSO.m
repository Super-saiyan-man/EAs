pi = 1;
[~,upper,lower] = f(0,pi);
MaxFEs = 10000;
%% Initialization

N = 100;
D = 10;
t = 0;
Ae = [];
Ap = [];
Ao = [];
pc = 0.5;
pm = 0.02;

V = zeros(N,D);
X = lower + (upper-lower) * rand(N,D);
PB = X;
Xp = X;
[~,GBI] = min(f(X,pi));
GB = X(GBI,:);
%%
while t <= MaxFEs
    
    t = t + 1;
    [~,AeI] = sort(f(X,pi));
    Ae = X(AeI,:);
    [~,ApI] = sort(Ir(X,Xp,pi),'descend');
    Ap = X(ApI,:);
end

function ir =  Ir(X,Xp,pi)
    ir = (f(Xp,pi) - f(X,pi))/(exp(abs(Xp - X)));
end