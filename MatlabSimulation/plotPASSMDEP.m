function plotPASSMDEP()
    theta = pi;
    mu = [0:0.1:1];
    np = [0:0.1:4];
    r = [0 0.01 0.1 0.2 0.5];
%    r = [0 0.01];
    n_th = 1E-2;
    p0=0.5; p1=0.5;
    N = 30;
    errMax = 1E-6;
    
    % plot configuration
    colors = ['r','r','m','m','g','g','b','b','y','y'];
    line = ["--" '-' "--" '-' "--" '-' "--" '-' "--" '-'];
    plot_number = 1;
    
    figure;
    hold on;
    for current_r = r
        for k = [0 1]
            Pe = [];
            i=1;
%             for current_mu = mu
%                 Xi0 = setNoisyPASS(-current_mu,current_r,theta,k,n_th);
%                 Xi1 = setNoisyPASS(current_mu,current_r,theta,k,n_th);
% 
%                 Pe(i) = MDEP(p0,Xi0,p1,Xi1,N);
% 
%                 i = i+1;
%             end
            for current_np = np
                mu = np2mu(current_np/2,setNoisyPASS(0,current_r,theta,k,n_th),0,5,errMax, N);
                Xi0 = setNoisyPASS(-mu,current_r,theta,k,n_th);
                Xi1 = setNoisyPASS(mu,current_r,theta,k,n_th);

                Pe(i) = MDEP(p0,Xi0,p1,Xi1,N);

                i = i+1;
            end
            
            current_line = line(plot_number);
            current_color = colors(plot_number);
            plot(np,Pe,strcat(current_line,current_color));
            plot_number = plot_number+1;

        end
    end
    
    
    
    xlabel('mu')
    ylabel('Pe')
    set(gca, 'YScale', 'log')
    legend('r = 0 & k = 0',...
        'r = 0 & k = 1',...
        'r = 0.01 & k = 0',...
        'r = 0.01 & k = 1',...
        'r = 0.1 & k = 0',...
        'r = 0.1 & k = 1',...
        'r = 0.2 & k = 0',...
        'r = 0.2 & k = 1',...
        'r = 0.5 & k = 0',...
        'r = 0.5 & k = 1')
end