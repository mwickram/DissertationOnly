
function figure2_2


%figure('Numbertitle','off','Name',filename);
filename='m051712_6.dat';

fc=16;

h=subplot(221);

set(h,'fontsize',fc,'FontName','arial')

%g=plot(t,rt,'-k');
%set(g,'linewidth',1)
figure2_1
%tend=round(t(end));
%xlim([0 tend])
ylim([0 1])
ylabel('\itZ(t)')
xlabel('\itt\rm (s)')
hold all




%plot frequency of oscillators


file=strcat('Frequency','/','omega','_',filename);
omega=load(file);

omega=round(1000*omega)/1000;
%cycles=mean(omega)*length(data)/dar

N=[1:length(omega)];

%natural frequency
filename='m051712_3.dat';
file=strcat('Frequency','/','omega','_',filename);
omega_n=load(file);



omega=circshift(omega,-4);
omega_n=circshift(omega_n,-4);

h2=subplot(222);

set(h2,'fontsize',fc,'FontName','arial')
g=plot(N,omega,'o-k',N,omega_n,'o-k');

set(g(1),'linewidth',2,'markerfacecolor','k','markeredgecolor','k','markersize',7)
set(g(2),'linewidth',2,'markerfacecolor','w','markeredgecolor','k','markersize',7)
set(h2,'Xtick',[1:1:20])
%set(h2,'XtickLabel',{' ','9',' ','7',' ','5',' ','3',' ','1',' ',' 3',' ','5',' ','7',' ','9',' ','11'})
set(h2,'XtickLabel',{'','','','4','','','','8','','','','12','','','','16','','','','20'})



ylabel('\omega (Hz)')
xlabel('\itk')
ylim([min(omega)-0.004 0.4])
%ylim([0.365 0.4])
xlim([0 21])



Fig2_gray_scale_plot 



print -r300 -dtiff fig2.tiff


end




