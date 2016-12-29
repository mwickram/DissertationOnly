
function figure5_7


filename='m040513_1.dat';


data=load(filename);
dar=10;
fc=16;
cshift=-13;


[row,col]=size(data);

figure('Numbertitle','off','Name',filename);

% determining global order parameter Z(t)
rt=abs(sum(exp(i*data)'))/col;
t=[0:length(data(:,1))-1]/dar;

T=[200 1200];
start_t=round(dar*T(1));
last_t=round(dar*T(2));
data=data(start_t:last_t,:);

g_order=mean(rt)


h=subplot(222);

set(h,'fontsize',fc,'FontName','arial')

g=plot(t,rt,'-k');
set(g,'linewidth',2)

tend=round(t(end));
xlim([0 1200])
%set(h,'xTick',[0:200:600])
ylim([0 1])
ylabel('\itZ(t)')
xlabel('\itt')
hold all



%plot frequency of oscillators

omega=omega_cal(data,dar);
omega=round(1000*omega)/1000;

cycles=mean(omega)*length(data)/dar

N=[1:length(omega)];

%natural frequency

omega_n(1:40)=0.4;

omega=circshift(omega,cshift);
omega_n=circshift(omega_n,cshift);

h2=subplot(221);

set(h2,'fontsize',fc,'FontName','arial')
g=plot(N,omega,'o-k',N,omega_n,'o-k');

set(g(1),'linewidth',2,'markerfacecolor','k','markeredgecolor','k','markersize',4)
set(g(2),'linewidth',2,'markerfacecolor','w','markeredgecolor','k','markersize',4)
set(h2,'Xtick',[1 20 40])
%set(h2,'XtickLabel',{'','20','40'})
%set(h2,'XtickLabel',{'','','','4','','','','8','','','','12','','','','16','','','','20'})



%ylabel('\omega')
%xlabel('Oscillator index \itj')
ylim([0.1 0.5])
xlim([-1 41])



Fig2_gray_scale_plot(data,cshift,dar) 



print -r300 -dtiff fig2.tiff


end




