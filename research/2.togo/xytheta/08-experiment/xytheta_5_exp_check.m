clc;
clear;
close all;

addpath('exp_raw')
if ~exist('exp_out','dir')
mkdir('exp_out')
end
%%
% ref data
filename = 'adc_ref.dat';
fileID = fopen(filename);
adc_ref_file = textscan(fileID, '%d32', 'HeaderLines' , 1);
col1 = length(adc_ref_file{1})/12;
adc_ref2 = double(adc_ref_file{1});
adc_ref_arr = reshape(adc_ref2,[12,col1]);
adc_ref = mean(adc_ref_arr,2);
kg = 6e-6
k = 2;

plot_enable = 1;

% basic parameters
Fs = 25000;
Ts = 1/Fs;
rot_rpm = 2000;
rot_hz = rot_rpm/60;
rot_period_num_sample = round(1/rot_hz*Fs);
num_sample = 10000;
fc = 600;
save_enable =0;
save_name = 'x0y-4_norotate2.mat';

%% 
filename = 'adc_test.dat';
fileID = fopen(filename);
adc_read = textscan(fileID, '%d32','HeaderLines',1);
adc_read2 = adc_read{1};

%%
length(adc_read2);
col2=length(adc_read2)/12;
t= linspace(0,num_sample*Ts,col2);
adc_output=reshape(adc_read2,[12,col2]);
adc_output = double(adc_output);
adc_dif = adc_output-adc_ref;

a1 = adc_dif(1,:);
a2 = adc_dif(2,:);
a3 = adc_dif(3,:);
a4 = adc_dif(4,:);
b1 = adc_dif(5,:);
b2 = adc_dif(6,:);
b3 = adc_dif(7,:);
b4 = adc_dif(8,:);
c1 = adc_dif(9,:);
c2 = adc_dif(10,:);
c3 = adc_dif(11,:);
c4 = adc_dif(12,:);

xytheta = zeros(3, col2);

for i = 1:1:col2
 xytheta(:,i) = xytheta_estimation(a1(1,i), a2(1,i), a3(1,i), a4(1,i), ...
     b1(1,i), b2(1,i), b3(1,i), b4(1,i), ...
     c1(1,i), c2(1,i), c3(1,i), c4(1,i), kg);
end

%% lpf calculation
a1_lpf = lpf(a1, Ts, fc);
a2_lpf = lpf(a2, Ts, fc);
a3_lpf = lpf(a3, Ts, fc);
a4_lpf = lpf(a4, Ts, fc);
b1_lpf = lpf(b1, Ts, fc);
b2_lpf = lpf(b2, Ts, fc);
b3_lpf = lpf(b3, Ts, fc);
b4_lpf = lpf(b4, Ts, fc);
c1_lpf = lpf(c1, Ts, fc);
c2_lpf = lpf(c2, Ts, fc);
c3_lpf = lpf(c3, Ts, fc);
c4_lpf = lpf(c4, Ts, fc);

xytheta_lpf = zeros(3, col2);

for i = 1:1:col2
 xytheta_lpf(:,i) = xytheta_estimation(a1_lpf(1,i), a2_lpf(1,i), a3_lpf(1,i), a4_lpf(1,i), ...
     b1_lpf(1,i), b2_lpf(1,i), b3_lpf(1,i), b4_lpf(1,i), ...
     c1_lpf(1,i), c2_lpf(1,i), c3_lpf(1,i), c4_lpf(1,i), kg);
end
%%

%% ref voltage check
if(plot_enable == 1)
ref_figure = figure;
hold on;
ylim([1900, 2200])
a1_ref = adc_ref_arr(1,:);
a2_ref = adc_ref_arr(2,:);
a3_ref = adc_ref_arr(3,:);
a4_ref = adc_ref_arr(4,:);
a5_ref = adc_ref_arr(5,:);
a6_ref = adc_ref_arr(6,:);
a7_ref = adc_ref_arr(7,:);
a8_ref = adc_ref_arr(8,:);
a9_ref = adc_ref_arr(9,:);
a10_ref = adc_ref_arr(10,:);
a11_ref = adc_ref_arr(11,:);
a12_ref = adc_ref_arr(12,:);


ref_t= linspace(0,8,col1);
plot(ref_t,a1_ref)
plot(ref_t,a2_ref)
plot(ref_t,a3_ref)
plot(ref_t,a4_ref)
plot(ref_t,a5_ref)
plot(ref_t,a6_ref)
plot(ref_t,a7_ref)
plot(ref_t,a8_ref)
plot(ref_t,a9_ref)
plot(ref_t,a10_ref)
plot(ref_t,a11_ref)
plot(ref_t,a12_ref)
end

%% pair abc check
if(plot_enable == 0)
figure
hold on;
xlim([1 3])
plot(t,a1,t,a2)
title('a1a2')
figure
plot(t,a3,t,a4)
title('a3a4')
figure
plot(t,b2,t,b1)
title('b1b2')
figure
plot(t,b3,t,b4)
title('b3b4')
figure
plot(t,c1,t,c2)
title('c1c2')
figure
plot(t,c3,t,c4)
title('c3c4')
end
%% a1~c4 plot
if(plot_enable == 0)
check_figure = figure;
hold on;
xlim([0, 1])

plot(t,a1)
plot(t,b1)
plot(t,c1)
plot(t,a2)
plot(t,b2)
plot(t,c2)
plot(t,a3)
plot(t,b3)
plot(t,c3)
plot(t,a4)
plot(t,b4)
plot(t,c4)
end
%% xytheta no lpf plot
if(plot_enable == 1)
xy_figure = figure;
ax = gca;
hold on;
title(ax,'no lpf plot')
ylim([-5,5])
plot(t,xytheta(1,:),'g')
plot(t,xytheta(2,:),'r')
legend({'x_{hat}','y_{hat}'})
% plot(t,output(3,:),'b')
end
mean(xytheta(2,:))
%  a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4,



%% LPF a1 vs a1 plot
if(plot_enable == 1)
lpf_figure = figure;
ax = gca;
hold on;
title(ax,'lpf a1 vs a1 plot')
% xlim([1,1.2])
plot(t,a1(1,:),'--b','linewidth',1)
plot(t,a1_lpf(1,:),'-g','linewidth',1.5)

end

%% LPF xytheta plot
if(plot_enable == 1)
xy_figure = figure;
ax = gca;
hold on;
title(ax,'lpf xytheta plot')
% xlim([0,2])
ylim([-5,5])
plot(t,xytheta_lpf(1,:),'g')
plot(t,xytheta_lpf(2,:),'r')
legend({'x_{hat}','y_{hat}'})
% plot(t,output(3,:),'b')
end

%%
x_mean=mean(xytheta_lpf(1,:))
y_mean=mean(xytheta_lpf(2,:))
%%
point_figure = figure;

scatter(xytheta_lpf(1,:),xytheta_lpf(2,:),0.5,'black')
xlim([-5,5])
ylim([-5,5])
title('figure')
grid on;

%%
point_figure2 = figure;



scatter(xytheta_lpf(1,k*rot_period_num_sample:(k+1)*rot_period_num_sample),xytheta_lpf(2,k*rot_period_num_sample:(k+1)*rot_period_num_sample),0.5,'black')
xlim([-2,2])
ylim([-2,2])
title('figure_oneperiod')
grid on;
%% LPF xytheta plot for one period
if(plot_enable == 1)
xy_figure2 = figure;
ax = gca;
hold on;
title(ax,'lpf xytheta plot for one period')
t_oneperiod = [k/rot_hz,(k+2)/rot_hz];
xlim(t_oneperiod)
% ylim([-5,5])
plot(t,xytheta_lpf(1,:),'g')
plot(t,xytheta_lpf(2,:),'r')
legend({'x_{hat}','y_{hat}'})
% plot(t,output(3,:),'b')
end
%% error check
x_err = max(xytheta_lpf(1,k*rot_period_num_sample:(k+1)*rot_period_num_sample))-min(xytheta_lpf(1,k*rot_period_num_sample:(k+1)*rot_period_num_sample))
y_err = max(xytheta_lpf(2,k*rot_period_num_sample:(k+1)*rot_period_num_sample))-min(xytheta_lpf(2,k*rot_period_num_sample:(k+1)*rot_period_num_sample))
%%

if(save_enable == 1)
close all;
save(['D:\xytheta_5_phy_abc_output\' save_name])
end
%  a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4,


%%
function output = xytheta_estimation(a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, kg)
    dq = 2/3*[1 -0.5 -0.5;0 sqrt(3)/2 -sqrt(3)/2;1/2 1/2 1/2];
    abc = [a1, a2, a3, a4;b1, b2, b3, b4;c1, c2, c3, c4];
    abc1 = abc(:,1);
    abc2 = abc(:,2);
    abc3 = abc(:,3);
    abc4 = abc(:,4);
    dq1 = dq*abc1;
    dq2 = dq*abc2;
    dq3 = dq*abc3;
    dq4 = dq*abc4;

    x12 = dq1(1)*dq1(3)-dq2(1)*dq2(3);
    y12 = dq1(2)*dq1(3)-dq2(2)*dq2(3);
    x34 = cos(-pi/6)*(dq3(1)*dq3(3)-dq4(1)*dq4(3))-sin(-pi/6)*(dq3(2)*dq3(3)-dq4(2)*dq4(3));
    y34 = sin(-pi/6)*(dq3(1)*dq3(3)-dq4(1)*dq4(3))+cos(-pi/6)*(dq3(2)*dq3(3)-dq4(2)*dq4(3));

    xhat = kg*(x12+x34);
    yhat = -kg*(y12+y34);
    theta1hat = atan2(dq2(2),dq1(1));
    theta2hat = atan2(dq1(2),dq2(1));
    thetahat = atan2((dq1(2)+dq2(2))/2,(dq1(1)+dq2(1))/2);

    output = [xhat; yhat; thetahat];
end

function LPF_output = lpf(a1, Ts, f_cutoff)
    LPF_num_coefs = zeros(2, 1);
    LPF_den_coefs = zeros(2, 1);
    LPF_output = zeros(1,length(a1));
    LPF_num_coefs(1,1)=  2*pi*f_cutoff*Ts/(2+2*pi*f_cutoff*Ts);
    LPF_num_coefs(2,1)=  2*pi*f_cutoff*Ts/(2+2*pi*f_cutoff*Ts);
    LPF_den_coefs(1,1) = 1.0;
    LPF_den_coefs(2,1) = -(2*pi*f_cutoff*Ts-2)/(2+2*pi*f_cutoff*Ts);
    LPF_output(1,1) = a1(1,1);
    for i = 2:1:length(a1)
        LPF_output(1,i) = LPF_num_coefs(1,1)*a1(1,i) + LPF_num_coefs(2,1)*a1(1,i-1) +LPF_den_coefs(2,1)*LPF_output(1,i-1);

    end
    a = exp(-2*pi*f_cutoff*Ts);
    for i = 2:1:length(a1)
        LPF_output(1,i) = a*LPF_output(1,i-1) + (1-a)*a1(1,i-1);
    end
        
end