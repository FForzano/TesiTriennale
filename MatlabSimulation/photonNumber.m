function np = photonNumber(mu, n_th, parameter, system)
    
    if(strcmp(system,'nPACS'))
        if(length(parameter) ~= 1)
            'Incompatible parameters'
            return;
        elseif(parameter(1) < 0)
            'Incompatible parameters'
            return;
        end
        
        k = parameter(1);
        np = ((k+1)*(n_th+1)*laguerre(k+1,-abs(mu)^2/(n_th+1))/laguerre(k,-abs(mu)^2/(n_th+1))) -1;
        return;
        
    elseif(strcmp(system,'nSS'))
        if(length(parameter) ~= 1)
            'Incompatible parameters'
            return;
        elseif(parameter(1) < 0)
            'Incompatible parameters'
            return;
        end
        
        r = parameter(1);
        np = abs(mu)^2 + sinh(r)^2;
        return;
        
    elseif(strcmp(system,'nPASS'))
        if(length(parameter) ~= 2)
            'Incompatible parameters'
            return;
        elseif(parameter(1) < 0 | parameter(2) < 0)
            'Incompatible parameters'
            return;
        end
        
        return;
    else
        'Non valid system in photonNumber'
        np = NaN;
    end

end