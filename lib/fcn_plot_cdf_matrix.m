function [xx,yy] = fcn_plot_cdf(T,tmax,sample)

t=linspace(0,tmax,sample);

for i=1:sample
    e    = expmq(T.A*t(i));    
    F(i) = 1-T.a*e*T.v;
end

F = full(F);
xx = linspace(0,tmax,5*sample);
yy = interp1(t',F,xx,'pchip');

figure('Name','CDF');
plot(xx,yy,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('F(t)','FontSize',14);
title('CDF','FontWeight','normal','FontSize',14);

end

