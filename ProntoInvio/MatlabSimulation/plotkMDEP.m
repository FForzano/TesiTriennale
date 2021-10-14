function plotkMDEP(N,p0,p1,n_th)
    
    symbols = ['o' 's' '^' 'd'];
    
    delta = 1E-10;
    figure;
    mu = 0;
    
    hold on;

    for k = [0:3]
        Pe = [];

        % Pe = NaN per indici minori di k
        if k ~= 0
            for j = [1:k]
                Pe(j) = NaN;
            end
        end
        
        for np = [k:20]
            Xi0 = setNoisyPACS(0,0,n_th);
            
            mu = np2mu(np,setNoisyPACS(0,k,n_th),0,5,delta,N);
            Xi1 = setNoisyPACS(mu,k,n_th);
            
            Pe(np+1) = MDEP(p0,Xi0,p1,Xi1,N);
            %Pe(np+1) = DEPnoNoisy(p0,Xi0,p1,Xi1);
        end
        
        plot([0:0.5:10],Pe,strcat('-',symbols(k+1)));
    end
    
        xlabel('$\bar{n}_p$','Interpreter','Latex')
        ylabel('$P_e$','Interpreter','Latex')
        set(gca, 'YScale', 'log')
        legend('k = 0', 'k = 1', 'k = 2', 'k = 3')
end
