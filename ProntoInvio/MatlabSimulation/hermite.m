function H = hermite(n,x)
    H=0;
    for m = [0:floor(n/2)]
        H = H + ((-1)^m/(factorial(m)*factorial(n-2*m))*(2*x)^(n-2*m));
    end
    H = H*factorial(n);
    return;
end