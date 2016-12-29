function phase_hilbert(dat,dar)

data1=zeros(500000,40);
data1=load(dat);
data1=data1(1:end,9:28)/1;  % current in mA
data1=sgolayfilt(data1,2,21);%data in Volts (V)

fc=3;

for k=1:20
    
    data=data1(:,k);
    c=get_phase_hilbert(data,dar);
    p=c(:,1);
    d=c(:,2);

    
    h=subplot(5,4,k);
    plot(d)
    set(h,'linewidth',fc)   
    grid
    
    
    t=[0:length(p)-1]'/dar;
    pc=polyfit(t,p,1);
    plg(k)=length(p);
    phs(1:min(plg),k)=p(1:min(plg));
   
end
 
phs=phs(1:min(plg),:);
fileout=strcat('p',dat(1:end-4),'.dat');
save('-ascii', fileout, 'phs');
movefile('p*.dat','phase');



end


    




