function omega=omega_cal(data)

dar=200;

[r,col]=size(data);

t=[0:length(data(:,1))-1]'/dar;


for k=1:col
   
d=data(:,k);

p=polyfit(t,d,1);
omega(k,:)=p(1)/2/pi;

end

%omega_out=strcat('omega','_','m031012_4.dat');
%save ('-ascii',omega_out,'omega')

 end


 
 
 
 
 


