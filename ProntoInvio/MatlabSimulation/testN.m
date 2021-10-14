resolution = 0.1;
p0 = 0.5;
p1 = 0.5;


for N = [2:15:47]
    'ciclo' 
    (N-2)/15
    figure;
    plotAmplitudeMDEP(resolution,N,p0,0,p1,1,0.1);
end