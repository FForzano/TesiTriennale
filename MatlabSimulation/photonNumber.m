% function np = photonNumber(mu, n_th, parameter, system)
%     
%     if(strcmp(system,'nPACS'))
%         if(length(parameter) ~= 1)
%             'Incompatible parameters'
%             return;
%         elseif(parameter(1) < 0)
%             'Incompatible parameters'
%             return;
%         end
%         
%         k = parameter(1);
%         np = ((k+1)*(n_th+1)*laguerre(k+1,-abs(mu)^2/(n_th+1))/laguerre(k,-abs(mu)^2/(n_th+1))) -1;
%         return;
%         
%     elseif(strcmp(system,'nSS'))
%         if(length(parameter) ~= 1)
%             'Incompatible parameters'
%             return;
%         elseif(parameter(1) < 0)
%             'Incompatible parameters'
%             return;
%         end
%         
%         r = parameter(1);
%         np = abs(mu)^2 + sinh(r)^2;
%         return;
%         
%     elseif(strcmp(system,'nPASS'))
%         if(length(parameter) ~= 2)
%             'Incompatible parameters'
%             return;
%         elseif(parameter(1) < 0 | parameter(2) < 0)
%             'Incompatible parameters'
%             return;
%         end
%         
%         return;
%     else
%         'Non valid system in photonNumber'
%         np = NaN;
%     end
% 
% end

function np = photonNumber(mu, Xi, N)
    
    if(strcmp(Xi.type,'nPACS'))
        
        k = Xi.k;
        n_th = Xi.n_th;
        np = ((k+1)*(n_th+1)*laguerre(k+1,-abs(mu)^2/(n_th+1))/laguerre(k,-abs(mu)^2/(n_th+1))) -1;
        return;
        
    elseif(strcmp(Xi.type,'nSS'))
        
        r = Xi.r;
        np = abs(mu)^2 + sinh(r)^2;
        return;
        
    elseif(strcmp(Xi.type,'nPASS'))
        Xi.type = 'nPASSnotNormalized';
        Xi_aux = Xi;
        Xi_aux.k = Xi.k +1;
        np = trace(FockRepresentation(Xi_aux,N))/trace(FockRepresentation(Xi,N))-1;
    end
end