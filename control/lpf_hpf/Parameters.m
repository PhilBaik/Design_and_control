% LPF Filter parameters
clear;
clc;

% filter Cutoff frequency
f_cutoff=100;
%Maximum amplitude of the signal for distortion effect
Distor_effect=0.5;
%sampling frequency
fs=100000;
Ts = 1/fs; % sampling period (s)

%LPF
s=tf('s')
LPF=1/(1/(2*pi*f_cutoff)*s+1)
opts = c2dOptions;
opts.PrewarpFrequency=0;
opts.Method='Tustin';
LPF_z_100=c2d(LPF,Ts,opts) %Digital REsonant controller
format long;
num_LPF_z_100=(LPF_z_100.num{:})
den_LPF_z_100=(LPF_z_100.den{:})
aa100=num_LPF_z_100(1)
bb100=num_LPF_z_100(2)
cc100=den_LPF_z_100(1)
dd100=den_LPF_z_100(2)


% den_1=(1/2/pi/f_cutoff)*2/Ts+1
% den_2=-(1/2/pi/f_cutoff)*2/Ts+1

% 1/den_1
% den_2/den_1

% fs=10000;
% T=1/fs
% //[aa,dd,ee,ff]=LPF(100,1/fs);

bw=2*pi*f_cutoff;
%filter_tf=tf([ bw^2],[1 2*bw bw^2]);
%discretizaci� del filtro en continuo
a=bw^2
d=4/T^2-4*bw/T+bw^2
e=2*bw^2-8/T^2
f=4/T^2+4*bw/T+bw^2

%%
%HPF
HPF=1/(2*pi*f_cutoff)*s/(1/(2*pi*f_cutoff)*s+1)
opts = c2dOptions;
opts.PrewarpFrequency=2*pi*f_cutoff;
opts.Method='Tustin';
HPF_z_100=c2d(HPF,Ts,opts) %Digital REsonant controller
format long;
num_HPF_z_100=(HPF_z_100.num{:})
den_HPF_z_100=(HPF_z_100.den{:})
aa100=num_HPF_z_100(1)
bb100=num_HPF_z_100(2)
cc100=den_HPF_z_100(1)
dd100=den_HPF_z_100(2)