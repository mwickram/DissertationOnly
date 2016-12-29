function theta=get_phase_hilbert(data,dar)


data=hilbert(data-mean(data));
data=angle(data);
theta=unwrap(data(100:end-100));





