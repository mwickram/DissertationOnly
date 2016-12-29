
function figure5_8


filename='m040313_2.dat';%g=coupled
fpath=strcat('m040313','/',filename);

fpath1=strcat('m040313','/','m040313_5.dat');%g=0
datan=load(fpath1);
rtn=abs(sum(exp(i*datan)'))/20;
tn=[0:length(datan(:,1))-1]/1;
g_order_uncoupled=mean(rtn)



data=load(fpath);
dar=10;
fc=16;
cshift=-9;

T=[1 1000];
start_t=round(dar*T(1));
last_t=round(dar*T(2));


data=data(start_t:last_t,:);
[row,col]=size(data);

figure('Numbertitle','off','Name',filename);

% determining global order parameter Z(t)
rt=abs(sum(exp(i*data)'))/col;
t=[0:length(data(:,1))-1]/dar;

g_order=mean(rt(dar*300:dar*818))



h=subplot(222);

set(h,'fontsize',fc,'FontName','arial')

g=plot(t,rt,'-k');
set(g,'linewidth',2)

tend=round(t(end));
xlim([0 1000])
%set(h,'xTick',[0:200:600])
ylim([0 1])
ylabel('\itZ(t)')
xlabel('\itt')
hold all



%plot frequency of oscillators

T=[300 818];
start_t=round(dar*T(1));
last_t=round(dar*T(2));
data=data(start_t:last_t,:);

omega=omega_cal(data,dar);
omega=omega/2/pi;
omega=round(1000*omega)/1000;

cycles=mean(omega)*length(data)/dar

N=[1:length(omega)];

%natural frequency
%filename='m041712_5.dat';
filename1='m051712_3.dat';%natural frequency from experimental data

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



%ylabel('\omega (Hz)')
%xlabel('Electrode number')
ylim([0.388 0.4])
xlim([0 21])



Fig2_gray_scale_plot(data,cshift,dar) 



print -r300 -dtiff fig2.tiff


end




