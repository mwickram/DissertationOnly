
function figure5_14

filename='m050812_6.dat';

data=strcat('phase/p',filename);
data=load(data);
dar=200;
fc=16;
data=data(20000:end,:);
cshift=-4;

[row,col]=size(data);

figure('Numbertitle','off','Name',filename);

% determining global order parameter Z(t)
rt=abs(sum(exp(i*data)'))/col;
t=[0:length(data(:,1))-1]/dar;


h=subplot(222);

set(h,'fontsize',fc,'FontName','arial')

g=plot(t,rt,'-k');
set(g,'linewidth',1)

tend=round(t(end));
xlim([0 900])
ylim([0 1.1])
ylabel('\itZ(t)')
xlabel('Time (s)')
hold all



T=[400 895];
start_t=round(dar*T(1));
last_t=round(dar*T(2));
data=data(start_t:last_t,:);

g_order=mean(rt(T(1)*dar:T(2)*dar))




%plot frequency of oscillators

%file=strcat('Frequency','/','omega','_',filename);
%omega=load(file);
omega=omega_cal(data);
omega=round(1000*omega)/1000;
cycles=mean(omega)*length(data)/dar

N=[1:length(omega)];

%natural frequency
filename1='m050812_3.dat';
file=strcat('Frequency','/','omega','_',filename1);
omega_n=load(file);



omega=circshift(omega,cshift);
omega_n=circshift(omega_n,cshift);

h2=subplot(221);

set(h2,'fontsize',fc,'FontName','arial')
g=plot(N,omega,'o-k',N,omega_n,'o-k');

set(g(1),'linewidth',2,'markerfacecolor','k','markeredgecolor','k','markersize',7)
set(g(2),'linewidth',2,'markerfacecolor','w','markeredgecolor','k','markersize',7)
set(h2,'Xtick',[1:1:20])
%set(h2,'XtickLabel',{' ','9',' ','7',' ','5',' ','3',' ','1',' ',' 3',' ','5',' ','7',' ','9',' ','11'})
set(h2,'XtickLabel',{'','','','4','','','','8','','','','12','','','','16','','','','20'})



ylabel('\omega (Hz)')
xlabel('Electrode number')
ylim([min(omega)-0.004 0.4])
xlim([0 21])

Fig2_gray_scale_plot(data,dar,cshift) 



print -r300 -dtiff fig2.tiff


end




