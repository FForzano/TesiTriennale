function plotNoNoiseComparison(N,p0,p1,n_th)
    
    symbols = ['o' 's' '^' 'd'];
    colors = ['r','g','b','y'];
    
    delta = 1E-3;
    figure;
    mu = 0;
    
    hold on;
    index = 0;
    for k = [0:3]
        index = 1;
        Pe_noisy = [];
        Pe_noNoisy = [];

        % Pe = NaN per indici minori di k
        if k ~= 0
            for j = [1:0.02:k]
                %Pe_noisy(index) = NaN;
                Pe_noNoisy(index) = NaN;
                index = index+1;
            end
        end
        
        for np = [k:0.02:10]
            mu = np2mu(np,n_th,[k],0,5,delta,'nPACS');
            Xi0 = setNoisyPACS(-mu,k,n_th);
            Xi1 = setNoisyPACS(mu,k,n_th);
            
            %Pe_noisy(np+1) = MDEP(p0,Xi0,p1,Xi1,N);
            Pe_noNoisy(index) = DEPnoNoisy(p0,Xi0,p1,Xi1);
            index = index+1;
        end
   
        %plot([0:100],Pe_noisy,strcat(colors(k+1),'--',symbols(k+1)));
        plot([0:0.02:9.02],Pe_noNoisy,strcat(colors(k+1),'-',symbols(k+1)));
    end
    
        xlabel('np')
        ylabel('Pe')
        set(gca, 'YScale', 'log')
        legend('no noise formula (k=0)','noise formula (K=0)', ...
            'no noise formula (k=1)','noise formula (K=1)', ...
            'no noise formula (k=2)','noise formula (K=2)', ...
            'no noise formula (k=3)','noise formula (K=3)')
end