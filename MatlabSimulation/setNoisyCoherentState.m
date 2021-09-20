function Xi = setNoisyCoherentState(mu, n_th)
    % Xi = setNoisyCoherentState(omega, T0, mu)
    % Set state variable for noisy coherent state
    %
    % omega: angular frequency of field
    % T0: absolute temperature
    % mu: amplitude
    %
    % Xi = setNoisyCoherentState(np, mu)
    % Set state variable for noisy coherent state
    %
    % np: number of photons
    % mu: amplitude
    
    if (mu == 0)
        mu = 1E-15;
    end
    if (n_th == 0)
        n_th = 1E-10;
    end

    Xi.type = 'ncs';
    Xi.mu = mu;
    Xi.k = 0;
    Xi.n_th = n_th;
  

end