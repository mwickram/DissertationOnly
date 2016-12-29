function omega_cal(filename,dar)


filename='m051812_9.dat';
fname=strcat('phase','/','p',filename);
data=load(fname);

dar=200;
T=[350 1000];
start_t=round(dar*T(1));
last_t=round(dar*T(2));

data=data(start_t:last_t,:);

[r,col]=size(data);

t=[0:length(data(:,1))-1]'/dar;


for k=1:col
   
d=data(:,k);

p=polyfit(t,d,1);
omega(k,:)=p(1)/2/pi;

end

omega_out=strcat('omega','_',filename(1:end-3),'dat');
save ('-ascii',omega_out,'omega')

 end


 
 
 
 
 


