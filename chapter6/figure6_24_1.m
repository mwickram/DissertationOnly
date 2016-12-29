
function figure6_1


filename='m041411_32';
fig_indx=2;
dar=1000;
fc=16;


data1=strcat('1_dis_',filename,'.dat');
data2=strcat('3_dis_',filename,'.dat');



data1=load(data1);%(1,2), (1,3)
data2=load(data2);%(2,4)

delta_I=[data1(:,1:2) data2(:,1)];

[r,c]=size(delta_I)
t=[0:r-1]/dar;


scrsz = get(0,'ScreenSize');
Hf_fig=figure(1);
set(Hf_fig,'Position',[1 scrsz(4)/1.5 scrsz(3)/2.5 scrsz(4)/1.5]);


for k=1:c
    
h=subplot(3,2,fig_indx);

set(h,'fontsize',fc,'FontName','arial')

plot(t,delta_I(:,k),'k')

ylim([-0.02 0.55 ])
xlim([0 250])
%ylabel('\iti\rm (mA)')
set(h,'ytick',[0 0.2 0.4],'yticklabel',{' ',' ',' '})
set(h,'xtick',[0 50 100 150 200 250],'xticklabel',{' ',' ',' ',' ',' ',' '})
set(h,'XTicklabel','')
fig_indx=fig_indx+2;

end


g=subplot(3,2,6);
set(g,'fontsize',fc,'FontName','arial')
set(g,'XTicklabel','0|50|100|150|200|250')







end
