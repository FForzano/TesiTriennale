function Pe = DEPnoNoisy(p0,Xi0,p1,Xi1)
    StateInnerProduct = conj(Xi0.mu)^(Xi1.k-Xi0.k)*laguerre(Xi0.k,Xi1.k-Xi0.k ...
        ,-Xi1.mu*conj(Xi0.mu))*exp(-0.5*(abs(Xi1.mu)^2 + abs(Xi0.mu)^2 - ...
        2*Xi1.mu*conj(Xi0.mu)))/sqrt(factorial(Xi1.k)/factorial(Xi0.k)* ...
        laguerre(Xi1.k,-(abs(Xi1.mu)^2))*laguerre(Xi0.k,-(abs(Xi0.mu)^2)));
    
    Pe = 0.5*(1-sqrt(1-4*p0*p1*abs(StateInnerProduct)^2));
end