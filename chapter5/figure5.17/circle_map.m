
function circle_map(a,b,fill_color,m)

t=[0:pi/10000:2*pi];
g=length(t);
r=0.3;

       



x=a+r*cos(t);
y=b+r*sin(t);

g=plot(x,y,'-','color',fill_color);

fill(x,y,fill_color)

text(a,b,num2str(m),'FontSize',16,'Fontweight','bold','HorizontalAlignment','center','color',[0 0 0])