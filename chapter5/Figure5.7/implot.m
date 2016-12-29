function implot(data,cshift,dar)


data=mod(data+pi,2*pi)-pi;
%data=flipud(data);
data=circshift(data,[0 cshift]);
fc=12;

[nr,nc]=size(data);

t=[0:nr-1]/dar;
t=-t;
N=[1:1:nc];


hg=subplot(2,2,3:4);

set(hg,'fontsize',fc,'FontName','arial')

g=imagesc(N,t,data,[-3 3]);
h=get(g,'parent');
set(h,'Xtick',[1:1:40])
set(h,'XTickLabel',{' ','2',' ','4','','6','','8','','10','','12','','14','','16','','18','','20','','22','','24','','26','','28','','30','','32','','34','','36','','38','','40'})
set(h,'yTickLabel',{'1200','1000','800','600','400','200'})

%xlabel('Oscillator index \itj')
%ylabel('\itt')

p=gray;
a=[p(33:64,:); flipud(p(33:64,:))];
colormap(a)
colorbar


end