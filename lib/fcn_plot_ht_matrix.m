function [xx,z] = fcn_plot_ht_matrix(T,tmax,sample)

t = linspace(0,tmax,sample);
u = sparse(ones(T.n,1));

for i = 1:sample
    e  = expmq(T.A*t(i));
    eu = e*u;
    R(i) = T.a*eu;
    H(i) = -T.a*T.A*eu/R(i);
end

H  = full(H);
xx = linspace(0,tmax,5*sample);
z  = interp1(t',H,xx,'pchip');

figure('Name','Hazard Function');
plot(xx,z,'k');
set(gca,'FontName','Times New Roman','FontSize',14);
xlabel('Time','FontSize',14);
ylabel('h(t)','FontSize',14);
% title('Hazard Function','FontWeight','normal','FontSize',14);

end

