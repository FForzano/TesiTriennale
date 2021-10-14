function plotSSMDEP_explicit()
    mu = [0:0.1:2];
    r = [0 0.01 0.1 0.2 0.5 1 2 4];
    p0=0.5; p1=0.5;
    
    figure;
    hold on;
    for current_r = r
        
        Pe = 0.5*(1-sqrt(1-exp(-4*mu.^2*exp(2*current_r))));
        plot(mu,Pe);
        
    end
    xlabel('mu')
    ylabel('Pe')
    set(gca, 'YScale', 'log')
    legend('r = 0','r = 0.01','r = 0.1','r = 0.2','r = 0.5','r = 1','r = 2','r = 4')
end