function plotAmplitudeMDEP(plotResolution,N,p0,h,p1,k,n_th)
    % plotAmplitudeMDEP(plotResolution,N,p0,h,p1,k,n_th)

    Pe=[];
    m=1;
    for mu = [-1:plotResolution:1]
        n = 1;
        Xi1 = setNoisyPACS(mu,k,n_th);

        for xsi = [-1:plotResolution:1]

            Xi0 = setNoisyCoherentState(xsi,n_th);
            Pe(n,m) = MDEP(p0,Xi0,p1,Xi1,N);
            n = n+1;

        end

        m = m+1;
    end

    surf([-1:plotResolution:1],[-1:plotResolution:1],Pe)
    zlabel('MDEP')
    xlabel('mu')
    ylabel('xsi')

end