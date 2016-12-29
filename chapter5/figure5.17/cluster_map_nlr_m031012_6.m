function cluster_map_nlr_m031012_6

g=linspace(0,2*pi-pi/10,20);
a=1;
b=a;
r=2;

x=a+r*cos(g);
y=b+r*sin(g);


c1=[1 2 14:16];
c2=[4 7 9 17:20];
c3=[3 8];
c4=[12 13];
c5=[5 10];
c6=[6 11];

c=zeros(20,3);
c(c1,1)=1;
c(c2,2)=1;
c(c3,3)=1;
c(c4,1:2:3)=1;
c(c5,1:2)=1;
c(c6,:)=1;




for m=1:length(x)

    
circle_map(x(m),y(m),c(m,:),m);

hold all


end

axis off
axis square


print -r300 -dtiff fig_nlr_m031012_6.tiff
