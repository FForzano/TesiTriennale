function element = thermalStateElement(n,m,mu,th_photons)
% Implementation of (11).
% 
% n: row number
% m: column number
% mu: amplitude of coherent state
% th_photons: thermal photon number.

    v = th_photons/(1+th_photons);
    element = (1-v)*exp(-(1-v)*abs(mu)^2)...
        *sqrt(factorial(n)/factorial(m))*(v^n)*((1-v)*conj(mu))^(m-n)...
        *laguerreL(n,m-n,(-(1-v)^2*abs(mu)^2)/v);
end