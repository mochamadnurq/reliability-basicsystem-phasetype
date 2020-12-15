function R = fcn_plot_rt_matrix(T,tmax,sample)

t=linspace(0,tmax,sample);
u=sparse(ones(T.n,1));

for i=1:sample
    e=expmq(T.A*t(i));
    eu=e*u;
    R(i)=T.a*eu;
end

R = full(R);
xx = linspace(0,tmax,5*sample);
z  = interp1(t',R,xx,'pchip');

figure('Name','Reliability Function');
plot(xx,z,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('Time','FontSize',14);
ylabel('R(t)','FontSize',14);
title('Reliability Function','FontWeight','normal','FontSize',14);

end

