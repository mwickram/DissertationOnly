function find_omega(dat,dar)

dn=('C:\Documents and Settings\mwickram\My Documents\LabVIEW Data\');
sdir=dat(1:7);
Data1=strcat(dn,sdir,'\',dat);
data=load(Data1);
data1=data(:,9:28);
data1=sgolayfilt(data1,2,21);

[r,c]=size(data1);

for k=1:c

data=data1(:,k);
data=hilbert(data-mean(data));
data=angle(data);
theta=unwrap(data(100:end-100));
t=[0:length(theta)-1]'/dar;

c_fit=polyfit(t,theta,1);
omega1=c_fit(1)/(2*pi);
omega(k)=omega1;


end


omega_out=strcat('omega','_',dat(1:end-3),'dat');
save ('-ascii',omega_out,'omega')
omega'
range(omega)*1000
min(omega)
max(omega)






