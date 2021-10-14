function plotNoNoiseComparison(N,p0,p1,n_th)
    
    symbols = ['o' 's' '^' 'd'];
    colors = ['r','g','b','y'];
    
    delta = 1E-3;
    figure;
    mu = 0;
    
    hold on;
    index = 0;
    for k = [1]
        index = 1;
        Pe_noisy = [];
        Pe_noNoisy = [];

        % Pe = NaN per indici minori di k
        if k ~= 0
            for j = [0:0.02:k]
                %Pe_noisy(index) = NaN;
                Pe_noNoisy(index) = NaN;
                index = index+1;
            end
        end
        Pe_noNoisy(1)=1;
        for np = [k:0.02:10]
            mu = np2mu(np,setNoisyPACS(0,k,n_th),0,5,delta,'nPACS');
            Xi0 = setNoisyPACS(-mu,k,n_th);
            Xi1 = setNoisyPACS(mu,k,n_th);
            
            %Pe_noisy(np+1) = MDEP(p0,Xi0,p1,Xi1,N);
            Pe_noNoisy(index) = DEPnoNoisy(p0,Xi0,p1,Xi1);
            index = index+1;
        end
   
        %plot([0:100],Pe_noisy,strcat(colors(k+1),'--',symbols(k+1)));
        length(Pe_noNoisy)
        plot([0:0.02:10.02],Pe_noNoisy,strcat('r','-'));
    end
    
        xlabel('$n_p$','Interpreter','Latex')
        ylabel('$P_e$','Interpreter','Latex')
        set(gca, 'YScale', 'log')
        %legend('no noise formula (k=2)','noise formula (K=2)', ...
        %    'no noise formula (k=1)','noise formula (K=1)', ...
        %    'no noise formula (k=2)','noise formula (K=2)', ...
        %    'no noise formula (k=3)','noise formula (K=3)')
end