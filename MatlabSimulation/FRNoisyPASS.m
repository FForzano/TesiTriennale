function Xi_nm = FRNoisyPASS(Xi,n,m)
    % Xi_nm = FRNoisyPASS(Xi,n,m)
    %
    % Calculate the element (n,m) of the density operator of the noisy
    % photon added squeezed coherent state Xi.
    
    if((n<Xi.k)|(m<Xi.k))
        Xi_nm = 0;
        return;
    else
        %Xi_nm = sqrt(prod([n-Xi.k+1:n])*prod([m-Xi.k+1:m]))*...
        Xi_nm = sqrt((factorial(n)*factorial(m))/(factorial(n-Xi.k)*...
            factorial(m-Xi.k)))*FRNoisySS(Xi, n-Xi.k, m-Xi.k);

    end

end