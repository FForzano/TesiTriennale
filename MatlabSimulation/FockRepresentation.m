function Xi_out = FockRepresentation(Xi, N)
    Xi_out = zeros(N,N);

    if(strcmp(Xi.type,'nPACS'))
        for n = [0:N-1]
            for m = [n:N-1]
                Xi_out(n+1,m+1) = FRnoisyPACS(Xi,n,m);
                if (n ~= m)
                   Xi_out(m+1,n+1) = conj(Xi_out(n+1,m+1));
                end
            end
        end
    
        Xi_out = Xi_out/trace(Xi_out);
        return;
        
    elseif(strcmp(Xi.type,'nSS'))
        for n = [0:N-1]
            for m = [n:N-1]
                Xi_out(n+1,m+1) = FRNoisySS(Xi,n,m);
                if (n ~= m)
                   Xi_out(m+1,n+1) = conj(Xi_out(n+1,m+1));
                end
            end
        end
    
        Xi_out = Xi_out/trace(Xi_out);
        return;
    
    elseif(strcmp(Xi.type,'nPASS'))
        for n = [0:N-1]
            for m = [n:N-1]
                Xi_out(n+1,m+1) = FRNoisyPASS(Xi,n,m);
                if (n ~= m)
                   Xi_out(m+1,n+1) = conj(Xi_out(n+1,m+1));
                end
            end
        end
    
        Xi_out = Xi_out/trace(Xi_out);
        return;
        
    elseif(strcmp(Xi.type,'nPASSnotNormalized'))
    % Only diagonal compute for np elboration
        parfor n = [0:N-1]
            line = zeros(1,N);
            line(n+1) = FRNoisyPASS(Xi,n,n);

            Xi_out(n+1,:) = line;
        end
        
        return;
    end

end
