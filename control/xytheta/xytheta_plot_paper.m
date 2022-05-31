%% Loading data
clc;
clear;
load("xytheta_output_sensor_r43_kg750_20220529_2335.mat");

%% getting abc1 abc2 and its corresponding dq
theta_r = linspace(1,720,length(a1(:,1)));
a1_1 = a1(:,x_mid+1,y_mid)';
a2_1 = a2(:,x_mid+1,y_mid)';
b1_1 = b1(:,x_mid+1,y_mid)';
b2_1 = b2(:,x_mid+1,y_mid)';
c1_1 = c1(:,x_mid+1,y_mid)';
c2_1 = c2(:,x_mid+1,y_mid)';

alpha1_1 = alpha(1,:,x_mid+1,y_mid)';
alpha2_1 = alpha(2,:,x_mid+1,y_mid)';
beta1_1 = beta(1,:,x_mid+1,y_mid)';
beta2_1 = beta(2,:,x_mid+1,y_mid)';
gamma1_1 = gamma(1,:,x_mid+1,y_mid)';
gamma2_1 = gamma(2,:,x_mid+1,y_mid)';

x_position(1,x_mid+1);

%% abc1 abc2 plot
figure;
hold on;
grid on;

xlim([0,360])
plot(theta_r,a1_1,'-g')
plot(theta_r,a2_1,'--g')
plot(theta_r,b1_1,'-b')
plot(theta_r,b2_1,'--b')
plot(theta_r,c1_1,'-r')
plot(theta_r,c2_1,'--r')
hold off;

%% alpha beta gamma 1, 2
figure;
hold on;
grid on;

xlim([0,360])
plot(theta_r,alpha1_1,'-g')
plot(theta_r,alpha2_1,'--g')
plot(theta_r,beta1_1,'-b')
plot(theta_r,beta2_1,'--b')
plot(theta_r,gamma1_1,'-r')
plot(theta_r,gamma2_1,'--r')
hold off;