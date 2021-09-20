function Xi = setNoisyPACS(mu, k, n_th)
    % Xi = setNoisyPACS(omega, T0, mu, k)
    % Set state variable for noisy photon added coherent state (PACS)
    %
    % omega: angular frequency of field
    % T0: absolute temperature
    % mu: amplitude
    % k: number of photon added
    
    if (mu == 0)
        mu = 1E-15;
    end
    if (n_th == 0)
        n_th = 1E-8;
    end
    
    Xi.type = 'nPACS';
    Xi.mu = mu;
    Xi.k = k;
    Xi.n_th = n_th;

end