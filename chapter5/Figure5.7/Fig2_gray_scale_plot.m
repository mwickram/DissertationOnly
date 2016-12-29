function Fig2_gray_scale_plot(data,cshift,dar) 


d=data;%unwrap phase data

[row,col]=size(d);
CM=load('CM40_14.dat');

Radius=(length(find(CM(1,:)))-1)/2;
Rcom=(CM*exp(i*d'))'/(2*Radius+1);%Ne+ element
theta=unwrap(angle(Rcom')');

t=[0:row-1]/dar;
dphase=d-theta;


fileout=strcat('theta','.dat');
save('-ascii', fileout, 'dphase');

implot(dphase,cshift,dar)


f_out=strcat('fig2_gray_scale','.tiff');
%print('-f1','-r600','-dtiff',f_out);


 end