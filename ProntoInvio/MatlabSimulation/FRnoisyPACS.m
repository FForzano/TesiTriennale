function Xi_nm = FRnoisyPACS(Xi, n, m)
    % Xi_nm = FRnoisyPACS(Xi, n, m)
    % Implementation of noisy PAC state Fock representation (11).
    %
    % mu: coherent state amplitude;
    % omega: angular frequency of field;
    % T0: absolute temperature of the quantum system;
    % k: number of photon added
    % n,m: row and column number
    
    v = Xi.n_th/(1+Xi.n_th);
    
    if (n<Xi.k | m<Xi.k)
        Xi_nm = 0;
        return;
        
    else
        Xi_nm = ((1-v)^(Xi.k+1))*exp(-(1-v)*abs(Xi.mu)^2)/(v^Xi.k)...
            *sqrt(factorial(n)/factorial(m))*nchoosek(m,Xi.k)...
            *v^n*(((1-v)*conj(Xi.mu))^(m-n))...
            *laguerre(n-Xi.k,m-n,(-(1-v)^2*abs(Xi.mu)^2)/v)...
            /laguerre(Xi.k,(-(1-v)*abs(Xi.mu)^2));
    end
end
