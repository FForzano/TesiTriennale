function Pe = MDEP(p0,Xi0,p1,Xi1,N)
    delN = deltaN(p0, Xi0, p1, Xi1, N);
    Pe = 0.5*(1-trNorm(delN));
end