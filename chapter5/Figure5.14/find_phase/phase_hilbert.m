function phase_hilbert(dar)

filename='m022012_2.lvm';
dar=200;

data1=zeros(500000,40);
data1=load(filename);
data1=data1(1:end,9:28)/1;  % current in mA
data1=sgolayfilt(data1,2,21);%data in Volts (V)
leng_th=length(data1)

plot_index=1;
fig_num=1;

for k=1:20
    
    data=data1(:,k);
    p=get_phase_hilbert(data,dar);
    plot_index=plot_index+1;
    
%     if  plot_index==7
%         plot_index=1;
%         fig_num=fig_num+1;
%     end
    
    t=[0:length(p)-1]'/dar;
    pc=polyfit(t,p,1);
    plg(k)=length(p);
    phs(1:min(plg),k)=p(1:min(plg));
   
end
 
phs=phs(1:min(plg),:);
fileout=strcat('p',filename(1:end-4),'.dat');
save('-ascii', fileout, 'phs');
movefile('p*.dat','phase');


% m_index=[1:4];

% for p=1:length(m_index)
%     
% hf_fig=figure(m_index(p));
% print_fig=strcat(num2str(m_index(p)),dat(1:end-4),'.tiff');
% print('-dtiff','-r300', print_fig,hf_fig);
% %close    
% end


% movefile('*m*.tiff','timeseries')

end


    




