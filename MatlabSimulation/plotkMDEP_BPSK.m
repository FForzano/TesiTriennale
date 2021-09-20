function plotkMDEP_BPSK(N,p0,p1,n_th)
    
    symbols = ['o' 's' '^' 'd'];
    colors = ['r','g','b','y'];
    
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
            mu_b = np2mu(np/2,n_th,[k],0,5,delta,'nPACS');
            mu_o = np2mu(np,n_th,[k],0,5,delta,'nPACS');
            
            Xi0_OOK = setNoisyPACS(0,0,n_th);
            Xi0_BPSK = setNoisyPACS(-mu_b,k,n_th);
            Xi1_OOK = setNoisyPACS(mu_o,k,n_th);
            Xi1_BPSK = setNoisyPACS(mu_b,k,n_th);
            
            Pe_OOK(np+1) = MDEP(p0,Xi0_OOK,p1,Xi1_OOK,N);
            Pe_BPSK(np+1) = MDEP(p0,Xi0_BPSK,p1,Xi1_BPSK,N);

        end
        
        for j = [1:k]
            Pe_BPSK(2*j) = NaN;
        end
        
        plot([0:10],Pe_OOK,strcat(colors(k+1),'--',symbols(k+1)));
        plot([0:10],Pe_BPSK,strcat(colors(k+1),'-',symbols(k+1)));
    end
    
        xlabel('Mean photon number in system')
        ylabel('Pe')
        set(gca, 'YScale', 'log')
        legend('OOK: k = 0','BPSK: k = 0','OOK: k = 1','BPSK: k = 1', ...
            'OOK: k = 2','BPSK: k = 2','OOK: k = 3','BPSK: k = 3')
end