function Bm122110

% 4 chain

data=load('Bm122110.dat');

data=data(1:end,:);
data(end-10,:)=[];
data(:,1)=log10(1000./data(:,1));

f12=abs(data(:,14)-data(:,15));
f13=abs(data(:,14)-data(:,16));
f14=abs(data(:,14)-data(:,17));
f23=abs(data(:,15)-data(:,16));
f24=abs(data(:,15)-data(:,17));
f34=abs(data(:,16)-data(:,17));


% %figure(1)
% 
% fre=[f12 f13 f14 f23 f24 f34];
% 
% for k=1:6
%     
% %subplot(2,3,k)
% 
% plot(data(:,1),fre(:,k),'o-k')
% xlabel('log_10(1/R)')
% ylabel('\Delta\omega')
% %xlim([0 1.5])
% 
% end

% figure(2)
% 
% h=plot(data(:,1),f12,'o-k',data(:,1),f13,'o-k',data(:,1),f14,'o-k'...
%     ,data(:,1),f23,'o-b',data(:,1),f24,'o-b',data(:,1),f34,'o-g'); 
% xlabel('Log_10(1/R)');ylabel('\omega');
% legend('E12','E13','E14','E23','E24','E34')
% xlabel('Log_10(1/R)')
% ylabel('\Delta\omega')
% %xlim([0 1.5])
% %ylim([0 0.032])

fc=18;
figure(3)

for k=1:6
    
h=subplot(3,3,k);
set(h,'Fontsize',fc)

g=plot(data(:,1),data(:,k+1),'o-k','linewidth',2);
set(g(1),'markerfacecolor','k')
%xlabel('K (1/k\Omega)')
%ylabel('\rho')
line([-3.4 0],[0.5 0.5],'color','k')
xlim([-3.4 0])
ylim([0 1.05])

end



figure(4)

for k=1:6
h=subplot(3,3,k);
set(h,'Fontsize',fc)
g=plot(data(:,1),data(:,k+7),'o-k','linewidth',2);
set(g(1),'markerfacecolor','k')
%xlabel('K (1/k\Omega)')
%ylabel('\rho^z')
line([-3.4 0],[0.5 0.5],'color','k')
xlim([-3.4 0])
ylim([0 1.05])
end

print -r600 -dtiff fig6_17.tiff -f3

print -r600 -dtiff fig6_18.tiff -f4

end
