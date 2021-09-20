function Xi_nm = FRNoisySS(Xi,n,m)
    % Xi_nm = FRNoisySS(Xi,n,m)
    %
    % Xi must be the state variable of a noisy squeezed state;
    % n and m are the index of density matrix element.
    
    A = Xi.n_th + (2*Xi.n_th+1)*(sinh(Xi.r))^2;
    B = -(2*Xi.n_th+1)*exp(1i*Xi.theta)*sinh(Xi.r)*cosh(Xi.r);
    C = Xi.mu;

    den = (1+A)^2 - abs(B)^2;
    A_tilde = (A*(1+A)-abs(B)^2)/den;
    B_tilde = B/den;
    C_tilde = ((1+A)*C + B*conj(C))/den;

    Q0 = 1/pi * den^(-1/2) * exp(-((1+A)*abs(C)^2 + ...
        0.5*(B*conj(C)^2 + conj(B)*C^2))/den);

    sup = min([n,m]);
    Xi_nm = 0;
    for k = [0:sup]
        
        element = factorial(k)*nchoosek(n,k)*nchoosek(m,k)*...
            A_tilde^k*(0.5*B_tilde)^((n-k)/2)*...
            (0.5*conj(B_tilde))^((m-k)/2)*...
            hermite(n-k,(2*B_tilde)^(-1/2)*C_tilde)*...
            hermite(m-k,(2*conj(B_tilde))^(-1/2)*conj(C_tilde));
        Xi_nm = Xi_nm + element;
    end
    
    Xi_nm = (pi*Q0)/((factorial(n)*factorial(m))^(1/2)) * Xi_nm;
    return;
end