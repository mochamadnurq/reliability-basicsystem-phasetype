function [xx,yy] = fcn_plot_pdf_symbolic(R,tmax,sample)

sym x
t  = linspace(0,tmax,sample);

f  = -diff(R);
f  = double(f(t));

xx = linspace(0,tmax,5*sample);
yy = interp1(t',f,xx,'pchip');

figure('Name','PDF');
plot(xx,yy,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('F(t)','FontSize',14);
title('PDF','FontWeight','normal','FontSize',14);

end