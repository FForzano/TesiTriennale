function plotSSMDEP()
    theta = pi;
    np = [0:0.1:6];
    r = [0 0.01 0.1 0.2 0.5];
    N = 30;

    n_th = 0;
    p0=0.5; p1=0.5;
    maxErr = 1E-6;
    
    figure;
    hold on;
    for current_r = r
        Pe = [];
%         Pe_p = [];
        i=1;
        
        % minimum photon number for current_r
        np_min = (sinh(current_r))^2;
        
        for current_np = np
            if(current_np/2 < np_min)
                Pe(i) = NaN;
            else
                current_mu = np2mu(current_np/2,setNoisySS(0,current_r,theta,n_th),0,5,maxErr,N);
                Xi0 = setNoisySS(-current_mu,current_r,theta,n_th);
                Xi1 = setNoisySS(current_mu,current_r,theta,n_th);

                Pe(i) = MDEP(p0,Xi0,p1,Xi1,N);
            end
            
%             current_mu = np2mu(current_np/2,n_th,[0],0,5,maxErr,'nPACS');
%             Xi0_p = setNoisyPACS(-current_mu,0,n_th);
%             Xi1_p = setNoisyPACS(current_mu,0,n_th);
%             Pe_p(i) = MDEP(p0,Xi0_p,p1,Xi1_p,N);
            
            i = i+1;
        end
        
        plot(np,Pe);
%         plot(np,Pe_p);
        
        %xlabel('mu')
        %ylabel('Pe')
        %set(gca, 'YScale', 'log')
        %legend('Squeezed formula','PACS formula')
        
    end
    
    
    
    xlabel('$\bar{E}$','Interpreter','Latex')
    ylabel('$P_e$','Interpreter','Latex')
    set(gca, 'YScale', 'log')
    legend('r = 0','r = 0.01','r = 0.1','r = 0.2','r = 0.5')
end