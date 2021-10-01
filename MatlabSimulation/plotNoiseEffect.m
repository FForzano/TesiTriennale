function plotNoiseEffect(N,p0,p1)
    Pe = [];
    n_th = [0:0.01:0.5];
    np_zero = 1.52;
    delta = 1E-08;
    index = 1;
    k=1;
    
    mu = np2mu(np_zero,setNoisyPACS(0,k,0),0,5,delta,N);
    
    for i = n_th
        Xi0 = setNoisyPACS(0,0,i);
        Xi1 = setNoisyPACS(mu,k,i);
        
        Pe(index) = MDEP(p0,Xi0,p1,Xi1,N);
        index = index+1;
    end
    
    figure;
    plot(n_th,Pe)
    set(gca, 'YScale', 'log')
    %set(gca, 'XScale', 'log')
    xlabel('$\bar{n}$','Interpreter','Latex')
    ylabel('$P_e$','Interpreter','Latex')
end