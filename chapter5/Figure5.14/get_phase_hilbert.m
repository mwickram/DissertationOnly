function c=get_phase_hilbert(data,dar)


data=data-mean(data);
data=hilbert(data-mean(data));
data=data(100:end-100);
theta=angle(data);
theta=unwrap(theta);

c=[theta data];


