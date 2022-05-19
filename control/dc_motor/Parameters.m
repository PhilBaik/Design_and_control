% DC motor parameters
clc;
clear;

P_rated=15;
V_rated=12;
I_rated=4;
omega_rated=300*(2*pi/60);
T_rated=P_rated/I_rated;

R_a=0.26;
L_a=1.7e-3;
J=0.00252;
B=0.0001;
k_e=T_rated/I_rated
k_t=k_e

% DC motor current controller
f_cutoff_c=100;
k_p=L_a*2*pi*f_cutoff_c;
k_i=R_a*2*pi*f_cutoff_c;
k_e_hat=k_e;

% DC motor velocity controller
f_cutoff_vel=10;
k_ps=J/k_t*2*pi*f_cutoff_vel;
k_is=k_ps/5*2*pi*f_cutoff_vel;




%sampling frequency
fs=100000;
Ts = 1/fs; % sampling period (s)






