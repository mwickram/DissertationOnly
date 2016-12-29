
function figure5_15


filename='m051712_456.dat';
data=strcat('phase/p',filename);
data=load(data);
dar=200;
%data=data(40000:1150*dar,:);
data=data(40000:end,:);
data=unwrap(data);

fc=16;
cshift=-4;


[row,col]=size(data);

figure('Numbertitle','off','Name',filename);

%determining global order parameter Z(t)
rt=abs(sum(exp(i*data)'))/col;
t=[0:length(data(:,1))-1]/dar;

T=[600 1150];
start_t=round(dar*T(1));
last_t=round(dar*T(2));

data=data(start_t:last_t,:);

g_order=mean(rt(T(1)*dar:T(2)*dar))

h=subplot(222);

set(h,'fontsize',fc,'FontName','arial')

g=plot(t,rt,'-k');
set(g,'linewidth',1)
xlim([0 1150])
ylim([0 1.1])
ylabel('\itZ(t)')
xlabel('Time (s)')
hold all


%plot frequency of oscillators

omega=omega_cal(data)
%file=strcat('Frequency','/','omega','_','m051712_456.dat');
%omega=load(file);

omega=round(1000*omega)/1000;
cycles=mean(omega)*length(data)/dar

N=[1:length(omega)];

%natural frequency

filename1='m051712_3.dat';
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
ylim([min(omega)-0.004 0.41])
%ylim([0.365 0.4])
xlim([0 21])

Fig2_gray_scale_plot(data,dar,cshift) 


print -r300 -dtiff fig2.tiff


end




