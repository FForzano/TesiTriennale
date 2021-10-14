function L = laguerre(n,a,x)
% L = laguerre(n,a,x)

    L = 0;

    if (nargin < 3)
        x = a;
        
        for k = [0:n]
           L = L + (nchoosek(n,k)*(-1)^k/factorial(k)*(x^k));
        end
        return;
        
    else
        % Generalized laguerre polynomial
        for k = [0:n]
           L = L + (nchoosek(n+a,n-k)*(-1)^k/factorial(k)*(x^k));
        end
        
        return;
    end
end