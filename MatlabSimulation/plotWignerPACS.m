function plotWignerPACS()

    mu = 4;
    k=2;

    x = repmat([-1:0.1:3],length([-1:0.1:3]),1);
    y = repmat([-2:0.1:2],length([-2:0.1:2]),1)';

    alpha = x+1i*y;

    W = (2/pi*exp(-2*abs(alpha-mu).^2).*(-1)^k).*(2*laguerreL(k,abs(2*alpha-mu)).^2)./(pi*laguerreL(k,-abs(mu)^2));
    surf(x,y,W)
    xlabel('$Re\{ \alpha \}$','Interpreter','Latex')
    ylabel('$Im\{ \alpha \}$','Interpreter','Latex')
    zlabel('$W( \alpha )$','Interpreter','Latex')