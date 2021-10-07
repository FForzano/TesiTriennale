function plotkMDEP_BPSK(N,p0,p1,n_th)
    
    symbols = ['o' 's' '^' 'd'];
    colors = ['r','g','b','m'];
    
    delta = 1E-10;
    figure;
    mu = 0;
    
    hold on;

    for k = [0:3]
        Pe_OOK = [];
        Pe_BPSK = [];

        % Pe = NaN per indici minori di k
        if k ~= 0
            for j = [1:k]
                Pe_OOK(j) = NaN;
                Pe_BPSK(j) = NaN;
            end
        end
        
        for np = [k:10]
            Xi1_OOK = setNoisyPACS(0,k,n_th);
            Xi1_BPSK = setNoisyPACS(0,k,n_th);
            
            Xi1_OOK.mu = np2mu(np/2,Xi1_OOK,0,5,delta,N);
            Xi1_BPSK.mu = np2mu(np,Xi1_BPSK,0,5,delta,N);
            
            Xi0_OOK = setNoisyPACS(0,0,n_th);
            Xi0_BPSK = setNoisyPACS(-Xi1_BPSK.mu,k,n_th);
            
            Pe_OOK(np+1) = MDEP(p0,Xi0_OOK,p1,Xi1_OOK,N);
            Pe_BPSK(np+1) = MDEP(p0,Xi0_BPSK,p1,Xi1_BPSK,N);

        end
        
        for j = [1:k]
            Pe_BPSK(2*j) = NaN;
        end
        
        plot([0:10],Pe_OOK,strcat(colors(k+1),'--',symbols(k+1)));
        plot([0:10],Pe_BPSK,strcat(colors(k+1),'-',symbols(k+1)));
    end
    
        xlabel('$\bar{E}$','Interpreter','Latex')
        ylabel('$P_e$','Interpreter','Latex')
        set(gca, 'YScale', 'log')
        legend('OOK: k = 0','BPSK: k = 0','OOK: k = 1','BPSK: k = 1', ...
            'OOK: k = 2','BPSK: k = 2','OOK: k = 3','BPSK: k = 3')
end