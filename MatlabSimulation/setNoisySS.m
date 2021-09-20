function Xi = setNoisySS(mu,r,theta,n_th)
    % Xi = setNoisySS(mu,r,theta,n_th)
    % Set state variable for noisy squeezes state (SS)
    %
    % mu: amplitude
    % r: sqeezing amplitude
    % theta: squeezing angle
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
    
    Xi.type = 'nSS';
    Xi.theta = theta;
    Xi.n_th = n_th;
end