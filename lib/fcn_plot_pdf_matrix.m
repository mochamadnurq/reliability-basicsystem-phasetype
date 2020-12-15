function [xx,yy] = fcn_plot_pdf_matrix(T,tmax,sample)

t = linspace(0,tmax,sample);

for i = 1:sample
    e    = expmq(T.A*t(i));    
    f(i) = -T.a*e*T.A*sparse(ones(T.n,1));
end

f  = full(f);
xx = linspace(0,tmax,5*sample);
yy = interp1(t',f,xx,'pchip');

figure('Name','PDF');
plot(xx,yy,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('\it t','FontSize',14);
ylabel('F(t)','FontSize',14);
title('PDF','FontWeight','normal','FontSize',14);

end

