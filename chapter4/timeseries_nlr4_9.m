function timeseries_nlr4_9


filename='m100612_41.lvm';
data=strcat(filename(1:7),'/',filename);
data=load(data);
data=data(:,9:28);
data=sgolayfilt(data,2,21);

rind=1.2;
data=data/rind;
dar=200;
t=[0:length(data)-1]/dar;

fc=18;

h=subplot(4,2,1:2);

set(h,'fontsize',fc)
g=plot(t,data(:,1:3),'-r',t,data(:,15:20),'-r',t,data(:,4:14),'-k');

xlim([49.50 69.5])
ylim([0.12 0.41])


%%%%%%%%%%%%%%%%%%%%%%%%%

fname='m100612_45.lvm'; 
fname=strcat(fname(1:7),'/',fname);
% 
dar=200;
rind=1.2;%kohm
% 
d=load(fname);
d=d(:,9:28);
d=sgolayfilt(d,2,21);
t=[0:length(d(:,1))-1]'/dar;
%       
I=d/rind;
fc=18;
%     
h=subplot(4,2,3:4);
% 
set(h,'fontsize',fc,'FontName','arial')
g=plot(t,I(:,1:6),'-k',t,I(:,17:20),'-k',t,I(:,7:16),'-r');
xlim([50 70])
ylim([0.12 0.41])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filename='m030912_17.lvm';
data=strcat(filename(1:7),'/',filename);
data=load(data);
data=data(:,9:28);
data=sgolayfilt(data,2,21);

rind=1.4;
data=data/rind;
dar=200;
t=[0:length(data)-1]/dar;

fc=18;

h=subplot(4,2,5:6);

set(h,'fontsize',fc)
g=plot(t,data(:,1:3),'-r',t,data(:,4:13),'-k',t,data(:,14:20),'r');

set(g,'linewidth',1)
%ylabel('Current (mA)')
xlim([50 56])
ylim([0.3 0.65])


%%%%%%%%%%%%%%%%%%%%


filename='m030912_21.lvm';
data=strcat(filename(1:7),'/',filename);
data=load(data);
data=data(:,9:28);
data=sgolayfilt(data,2,21);

rind=1.4;
data=data/rind;
dar=200;
t=[0:length(data)-1]/dar;

fc=18;

h=subplot(4,2,7:8);

set(h,'fontsize',fc)
g=plot(t,data(:,1:3),'-k',t,data(:,9:10),'-k',t,data(:,12:5:18),'-k',t,data(:,14:16),'-k',...
          t,data(:,4:8),'-r',t,data(:,11:2:13),'-r',t,data(:,17),'-r',t,data(:,19:20),'-r');

set(g,'linewidth',1)
%ylabel('Current (mA)')
xlim([49.7 55.7])
ylim([0.3 0.65])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

print -dtiff -r300 fig1.tiff