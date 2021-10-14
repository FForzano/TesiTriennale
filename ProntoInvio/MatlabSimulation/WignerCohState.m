function plotWignerCoh()

    mu = 0.4;

    x = repmat([-2:0.1:2],length([-2:0.1:2]),1);
    y = x';

    alpha = x+1i*y;

    W = 2/pi*exp(-2*abs(alpha-mu).^2)
    surf(x,y,W)
    xlabel('$Re\{ \alpha \}$','Interpreter','Latex')
    ylabel('$Im\{ \alpha \}$','Interpreter','Latex')
    zlabel('$W( \alpha )$','Interpreter','Latex')