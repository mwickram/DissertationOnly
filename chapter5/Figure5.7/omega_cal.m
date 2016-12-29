function Fre=omega_cal(data,dar)


[r,col]=size(data);
t=[0:length(data(:,1))-1]'/dar;


for k=1:col
   
d=data(:,k);

p=polyfit(t,d,1);
Fre(k,:)=p(1);

end


 end


 
 
 
 
 


