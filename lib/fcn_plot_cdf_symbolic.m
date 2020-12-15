function [xx,yy] = fcn_plot_cdf_symbolic(R,tmax,sample)

sym x
t  = linspace(0,tmax,sample);

F  = 1-double(R(t));

xx = linspace(0,tmax,5*sample);
yy = interp1(t',F,xx,'pchip');

figure('Name','CDF');
plot(xx,yy,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('F(t)','FontSize',14);
title('CDF','FontWeight','normal','FontSize',14);

end