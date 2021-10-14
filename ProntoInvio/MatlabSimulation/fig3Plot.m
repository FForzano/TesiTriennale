% creazione e salvataggio dei grafici in fig3

name1 = ['a' 'b' 'c' 'd'];
name2 = ['e' 'f' 'g' 'h'];

p0 = 1/2;
p1 = 1/2;

h = 0;

plotResolution = 0.025;
N = 30;

n_th = 0.1;
parfor k = [0:3]
    compName2 = strcat('3' + name2(k+1));
    fig2 = figure('Name', compName2, 'NumberTitle', 'off');
    
    plotAmplitudeMDEP(plotResolution,N,p0,h,p1,k,n_th)
    
    savefig(fig2, compName2);
    close(fig2);
end

n_th = 0;
parfor k = [0:3]
    compName1 = strcat('3' + name1(k+1));
    fig1 = figure('Name', compName1, 'NumberTitle', 'off');
    figure('Name', compName1, 'NumberTitle', 'off');
    
    plotAmplitudeMDEP(plotResolution,N,p0,h,p1,k,n_th)
    
    savefig(fig1, compName1);
    close(fig1);
end
