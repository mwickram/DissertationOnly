function Am010711

%star coupling
data=load('Am010711.dat');
data(end-5:end-2,:)=[];
data=[data(1:2:end-2,:); data(end-2:end,:)];
data(:,1)=log10(1./data(:,1));

fc=18;
figure(1)

for k=1:6
    
h=subplot(3,3,k);
set(h,'fontsize',fc);

plot(data(:,1),data(:,k+1),'o-k','markerfacecolor','k','linewidth',2);
%line([0,-2.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k')
%xlabel('K (1/k\Omega)')
line([-2.5 0],[0.5 0.5],'color','k')
%ylabel('\rho')
xlim([-2.5 0])
ylim([0 1.05])
end



figure(2)

for k=1:6
    
h=subplot(3,3,k);
set(h,'fontsize',fc);
plot(data(:,1),data(:,k+7),'o-k','markerfacecolor','k','linewidth',2);
 %line([0,-2.1],[0.5, 0.5],'linewidth',2,'linestyle','--','color','k')
%xlabel('K (1/k\Omega)')
%ylabel('\rho_z')
line([-2.5 0],[0.5 0.5],'color','k')
xlim([-2.5 0])
ylim([0 1.05])
end


print -r600 -dtiff fig6_19.tiff -f1

print -r600 -dtiff fig6_20.tiff -f2

end
