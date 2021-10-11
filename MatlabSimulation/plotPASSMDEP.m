function plotPASSMDEP()
    theta = pi;
    mu_start = 0;
    mu_delta = 0.1;
    np_max = 6;
    r = [0 0.01 0.1 0.2 0.5];
    %r=0.01;
    n_th = 1E-2;
    p0=0.5; p1=0.5;
    N = 40;
    errMax = 1E-3;
    
    % plot configuration
    colors = ['r','r','m','m','g','g','b','b','c','c'];
    line = ["--" '-' "--" '-' "--" '-' "--" '-' "--" '-'];
    plot_number = 1;
    
    figure;
    hold on;
    for current_r = r
        for k = [0 1]
            Pe = [];
            i=1;
            
            np=[];
            current_mu = mu_start;
            np(i) = photonNumber(current_mu,setNoisyPASS(current_mu,current_r,theta,k,n_th),N)*2;
            while np(i) <= np_max
                %Xi0 = setNoisyPASS(-current_mu,current_r,theta,k,n_th);
                Xi0 = setNoisyPASS(0,0,theta,0,n_th);
                Xi1 = setNoisyPASS(current_mu,current_r,theta,k,n_th);

                Pe(i) = MDEP(p0,Xi0,p1,Xi1,N);

                i = i+1;
                
                current_mu = current_mu + mu_delta;
                np(i) = photonNumber(current_mu,setNoisyPASS(current_mu,current_r,theta,k,n_th),N);
            end
            np(end)=[];

% 
%             i=1;
%             np_PACS=[];
%             PePACS=[];
%             current_mu=0;
%             np_PACS(i) = photonNumber(current_mu,setNoisyPACS(current_mu,k,n_th),N)*2;
%             while np_PACS(i) <= np_max
%                 
%                 Xi0_PACS = setNoisyPACS(-current_mu,k,n_th);
%                 Xi1_PACS = setNoisyPACS(current_mu,k,n_th);
% 
%                 PePACS(i) = MDEP(p0,Xi0_PACS,p1,Xi1_PACS,N);
% 
%                 i = i+1;
%                 
%                 current_mu = current_mu + 0.1;
%                 np_PACS(i) = photonNumber(current_mu,setNoisyPACS(current_mu,k,n_th),N)*2;
%             end
%             np_PACS(end)=[];
            
            current_line = line(plot_number);
            current_color = colors(plot_number);
            plot(np,Pe,strcat(current_line,current_color),'LineWidth',1);
            plot_number = plot_number+1;
            
%             current_line = line(plot_number);
%             current_color = colors(plot_number);
%             plot(np_PACS,PePACS,strcat(current_line,current_color));
%             plot_number = plot_number+1;

        end
    end
    
    
    
    xlabel('$n_p$','Interpreter','Latex')
    ylabel('$P_e$','Interpreter','Latex')
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
%     legend('PASS & k = 0',...
%         'PACS & k = 0',...
%         'PASS & k = 1',...
%         'PACS & k = 1')
end