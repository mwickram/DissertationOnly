function time_global_coupling4_7


filename='m061011_2.dat';
data=strcat(filename(1:7),'/',filename);
data=load(data);
data=sgolayfilt(data,2,21);

Rc=0.1;%kohm
Req=1.2;%kohm
data=data/(Req-4*Rc);

dar=200;
t=[0:length(data)-1]/dar;

fc=18;

h=subplot(4,2,1:2);

set(h,'fontsize',fc)
g=plot(t,data(:,1),'-k',t,data(:,2),'-k',t,data(:,3),'-r',t,data(:,4),'-r');
%title([filename(1:7),'\_',filename(9:end)])
set(g,'linewidth',1)
%xlabel('\it (s)')
%ylabel('\itd \rm(mA)')
set(h,'xticklabel','')
xlim([50 70])
ylim([0.1 0.5])

%%%%%%%%%%%%%%%%%%%

filename='m061011_3.dat';
data=strcat(filename(1:7),'/',filename);
data=load(data);
data=sgolayfilt(data,2,21);

Rc=0.2;%kohm
Req=1.2;%kohm
data=data/(Req-4*Rc);

dar=200;
t=[0:length(data)-1]/dar;

fc=18;

h=subplot(4,2,3:4);

set(h,'fontsize',fc)
g=plot(t,data(:,1),'-k',t,data(:,2),'-r',t,data(:,3),'-k',t,data(:,4),'-r');
%title([filename(1:7),'\_',filename(9:end)])
set(g,'linewidth',1)
%xlabel('\it (s)')
%ylabel('\itd \rm(mA)')
set(h,'xticklabel','')
xlim([50 70])
ylim([0.1 0.5])



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filename='m061011_22.dat';
data=strcat(filename(1:7),'/',filename);
data=load(data);
data=sgolayfilt(data,2,21);
t=[0:length(data)-1]/dar;

rind=1;%kohm 
data=data/rind;

h=subplot(4,2,5:6);
set(h,'fontsize',fc)

g=plot(t,data(:,1),'-k',t,data(:,2),'-r',t,data(:,3),'-r',t,data(:,4),'-k');
%title([filename(1:7),'\_',filename(9:end)])
set(g,'linewidth',1)
%xlabel('\it (s)')
%ylabel('\itd \rm(mA)')
set(h,'xticklabel','')
xlim([50 70])
ylim([0.1 0.5])



filename='m061011_24.dat';
data=strcat(filename(1:7),'/',filename);
data=load(data);
data=sgolayfilt(data,2,21);
t=[0:length(data)-1]/dar;

rind=1;%kohm 
data=data/rind;


h=subplot(4,2,7:8);
set(h,'fontsize',fc)

g=plot(t,data(:,1),'-k',t,data(:,2),'-r',t,data(:,3),'-r',t,data(:,4),'-r');
%title([filename(1:7),'\_',filename(9:end)])
set(g,'linewidth',1)
%xlabel('\it (s)')
%ylabel('\itd \rm(mA)')
xlim([50 70])
ylim([0.1 0.5])

print -dtiff -r300 fig.tiff


end




