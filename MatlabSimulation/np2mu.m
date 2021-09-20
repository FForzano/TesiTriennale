% function mu = np2mu(np, n_th, parameter, mu_inf, mu_sup, delta, system)
%     % mu = np2mu(np, n_th, parameter, mu_inf, mu_sup, delta)
%     %
%     % Calcolo approssimato di mu (compreso tra mu_inf e mu_sup) con errore
%     % massimo delta.
%     % La funzione sfrutta la monotonia della funzione np(mu,n_th) in
%     % [0,+inf[, il calcolo viene effettuato tramite un algoritmo di
%     % bisezione tra mu_inf e mu_sup.
%     % system deve essere una stringa contenente il tipo di sistema 
%     % quantistico in questione: 'nPACS', 'nSS', 'nPASS'
%     % parameter deve essere un array contenente i parametri del sistema,
%     % quali:
%     % nPACS: k
%     % nSS: r
%     % nPASS: r, k
%     
%     mu_med = (mu_sup+mu_inf)/2.0;
%     current_np = photonNumber(mu_med, n_th, parameter, system);
% 
%     deviation = np-current_np;
% 
%     while((abs(deviation) >= delta) & (mu_med>0))
%         if(deviation >= 0)
%             mu_inf = mu_med;
%         else
%             mu_sup = mu_med;
%         end
% 
%         mu_med = (mu_sup+mu_inf)/2.0;
%         
%         if(strcmp(system,'nPASS'))
%             current_np = photonNumberAddictedStates(
%         else
%             current_np = photonNumber(mu_med, n_th, parameter, system);
%         end
% 
%         deviation = np-current_np;
%     end
% 
%     mu = mu_med;
%     return;
% end

function mu = np2mu(np, Xi, mu_inf, mu_sup, delta, N)
    % mu = np2mu(np, Xi, mu_inf, mu_sup, delta)
    %
    % Calcolo approssimato di mu (compreso tra mu_inf e mu_sup) con errore
    % massimo delta.
    % La funzione sfrutta la monotonia della funzione np(mu,n_th) in
    % [0,+inf[, il calcolo viene effettuato tramite un algoritmo di
    % bisezione tra mu_inf e mu_sup.
    % Xi deve essere la struttura dati corrispontente allo stato desiderato
    
    mu_med = (mu_sup+mu_inf)/2.0;
    current_np = photonNumber(mu_med, Xi, N);

    deviation = np-current_np;

    while((abs(deviation) >= delta) & (mu_med>0))
        if(deviation >= 0)
            mu_inf = mu_med;
        else
            mu_sup = mu_med;
        end

        mu_med = (mu_sup+mu_inf)/2.0;
        
        current_np = photonNumber(mu_med, Xi, N);

        deviation = np-current_np;
    end

    mu = mu_med;
    return;
end