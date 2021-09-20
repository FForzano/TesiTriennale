function delta = delta_nm(p0, Xi0, p1, Xi1, n, m)
    % delta = delta_nm(p0, Xi0, p1, Xi1, n, m)
    % 
    
    if(strcmp(Xi1.type,'nPACS'))
        delta = p1*FRnoisyPACS(Xi1, n, m) - p0*FRnoisyPACS(Xi0, n, m);
        
    elseif(strcmp(Xi1.type,'nSS'))
        delta = p1*FRNoisySS(Xi1, n, m) - p0*FRNoisySS(Xi0, n, m);
    
    elseif(strcmp(Xi1.type,'nPASS'))
        delta = p1*FRNoisyPASS(Xi1, n, m) - p0*FRNoisyPASS(Xi0, n, m);
    end
    
    return;
end