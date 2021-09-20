function Xi = setNoisyPASS(mu,r,theta,k,n_th)
    % Xi = setNoisyPASS(mu,r,theta,k,n_th)
    % Set state variable for noisy photon added squeezes state (PASS)
    %
    % mu: amplitude
    % r: sqeezing amplitude
    % theta: squeezing angle
    % k: number of photon addition
    % n_th: thermal photon number
    
    if (mu == 0)
        Xi.mu = 1E-15;
    else
        Xi.mu = mu;
    end
    if (n_th == 0)
        n_th = 1E-8;
    end
    if (r == 0)
        Xi.r = 1E-6;
    else
        Xi.r = r;
    end
    
    Xi.type = 'nPASS';
    Xi.theta = theta;
    Xi.k = k;
    Xi.n_th = n_th;
end