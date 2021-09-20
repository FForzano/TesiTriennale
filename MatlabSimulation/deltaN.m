function dN = deltaN(p0, Xi0, p1, Xi1, N)
    % dN = deltaN(p0, Xi0, p1, Xi1, N)
    % return the density matrix approximation of p0*Xi0-pi*Xi1
    
%     dN = zeros(N);
%     for n = [0:N-1]
%         for m = [n:N-1]
%             dN(n+1,m+1) = delta_nm(p0,Xi0,p1,Xi1,n,m);
%             
%             % La matrice è Hermitiana, pertanto la trasposta coniugata
%             % è uguale alla matrice stessa.
%             % Per alleggerire i calcoli calcolo metà matrice e l'altra la
%             % riempio per simmetria.
%             if (n ~= m)
%                 dN(m+1,n+1) = conj(dN(n+1,m+1));
%             end
%             
%         end
%     end

    dN = p1*FockRepresentation(Xi1, N) - p0*FockRepresentation(Xi0, N);
    
end