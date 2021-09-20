function norm = trNorm(HM)
    % norm = trNorm(HM)
    % Where HM is an Hermitian Matrix
    
    %lambda = eig(HM);
    norm = sum(abs(eig(HM)));
    %norm = trace(sqrt(HM*conj(HM)));
end