theta = pi;
mu = 0.01;
% r = [0 0.01 0.1 0.2 0.5];
r = 0.1;
n_th = 0.2;
p0=0.5; p1=0.5;
k=1;

N = 10;

Xi = setNoisyPASS(mu,r,theta,k,n_th);

Xi_dm = [];

for n = [0:N]
    for m = [0:N]
        Xi_dm(n+1,m+1) = FRNoisyPASS(Xi,n,m);
    end
end

tr = trace(Xi_dm)
squaretr = trace(Xi_dm^2)

