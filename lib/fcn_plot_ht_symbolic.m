function [xx,yy] = fcn_plot_ht_symbolic(R,tmax,sample)

sym x
t  = linspace(0,tmax,sample);

h  = -diff(R)/R;
hh = double(h(t));

xx = linspace(0,tmax,5*sample);
yy = interp1(t',hh,xx,'pchip');

figure('Name','h(t)');
plot(xx,yy,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('\it h(t)','FontSize',14);
title('Hazard Function','FontWeight','normal','FontSize',14);

end