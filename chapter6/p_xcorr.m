function [delay]=p_xcorr(data1,maxtau,enum)


for k=1:enum
    
data= data1(1:end,k);
data=data- mean(data);
c=xcorr(data,maxtau,'coeff');

%c = xcorr(x,maxlags) returns the autocorrelation sequence over the lag range [-maxlags:maxlags].
%Output c has length 2*maxlags+1. If x is an N-by-P matrix, c is a matrix with 2*maxlags+1 rows whose P2 columns
%contain the autocorrelation sequences for all combinations of the columns of x.

tau=[-maxtau:maxtau]';
% plot(tau,c);
% grid;
% xlim([0,maxtau]);

[ind]=find(0<tau & tau<80);% gives the row number
c=c(ind);
tau=tau(ind);

c=c-1/exp(1);
c=abs(c);
delay(1,k)=tau(find(c==min(c)));

end
delay;

end





