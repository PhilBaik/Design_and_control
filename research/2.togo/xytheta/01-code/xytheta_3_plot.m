%%% plot for x=1 y=0

%% Loading data
clc;
clear;

% load("xytheta_output_sensor_r48_air_kg39850_20220829_1445.mat")

%% Check whether x1, y0 corresponds to x=1, y=0
close all;
x1 = x_mid+2;
y0 = y_mid;
date = datestr(now,'yyyymmdd_HHMM');
save_enable = 0;
save_resolution = 2000;
save_format = '.tiff'; %.png is okay
%% getting abc1 abc2 and its corresponding dq for x1 y0
a1_1 = a1(:,x_mid+2,y_mid)';
a2_1 = a2(:,x_mid+2,y_mid)';
b1_1 = b1(:,x_mid+2,y_mid)';
b2_1 = b2(:,x_mid+2,y_mid)';
c1_1 = c1(:,x_mid+2,y_mid)';
c2_1 = c2(:,x_mid+2,y_mid)';

alpha1_1 = alpha(1,:,x_mid+2,y_mid)';
alpha2_1 = alpha(2,:,x_mid+2,y_mid)';
beta1_1 = beta(1,:,x_mid+2,y_mid)';
beta2_1 = beta(2,:,x_mid+2,y_mid)';
gamma1_1 = gamma(1,:,x_mid+2,y_mid)';
gamma2_1 = gamma(2,:,x_mid+2,y_mid)';

x_position(1,x_mid+1);

%% abc1 abc2 plot
figure_abc12 = figure;
hold on;
grid on;

ax = gca;
xticks([0 90 180 270 360])
ax.TickLabelInterpreter='latex';
xlim([0,360])
plot(theta_elec_in,a1_1,'-r','LineWidth',1)
plot(theta_elec_in,a2_1,'--r','LineWidth',1)
plot(theta_elec_in,b1_1,'-b','LineWidth',1)
plot(theta_elec_in,b2_1,'--b','LineWidth',1)
plot(theta_elec_in,c1_1,'-g','LineWidth',1)
plot(theta_elec_in,c2_1,'--g','LineWidth',1)
hold off;
box on;
ylatex = '$B[T]$';
ylabel(ylatex,'Interpreter','latex')
xlatex = '${\theta}_r[deg]$';
xlabel(xlatex,'Interpreter','latex')

leg_abc = legend('$B_{a1}$','$B_{a2}$','$B_{b1}$','$B_{b2}$','$B_{c1}$','$B_{c2}$','Location','northoutside','Numcolumns',3);
set(leg_abc, 'Interpreter', 'latex');
set(leg_abc, 'FontSize', 15);

if(save_enable==1)
filename = sprintf('abc1abc2_sensor_r%d_%s%s',sensor_r,date,save_format);
exportgraphics(ax,filename,'Resolution',save_resolution)
end
%% alpha beta gamma 1, 2
figure_alpha = figure;
hold on;
grid on;

ax = gca;
xticks([0 90 180 270 360])
ax.TickLabelInterpreter='latex';
xlim([0,360])
plot(theta_elec_in,alpha1_1,'-r','LineWidth',1)
plot(theta_elec_in,alpha2_1,'--r','LineWidth',1)
plot(theta_elec_in,beta1_1,'-b','LineWidth',1)
plot(theta_elec_in,beta2_1,'--b','LineWidth',1)
plot(theta_elec_in,gamma1_1,'-g','LineWidth',1)
plot(theta_elec_in,gamma2_1,'--g','LineWidth',1)
hold off;
box on;
ylatex = '$B[T]$';
ylabel(ylatex,'Interpreter','latex')
xlatex = '${\theta}_r[deg]$';
xlabel(xlatex,'Interpreter','latex')

leg_abc = legend('$B_{\alpha1}$','$B_{\alpha2}$','$B_{\beta1}$','$B_{\beta2}$','$B_{\gamma1}$','$B_{\gamma2}$','Location','northoutside','Numcolumns',3);
set(leg_abc, 'Interpreter', 'latex')
set(leg_abc, 'FontSize', 15);

if(save_enable==1)
filename2 = sprintf('alphabetagamma_sensor_r%d_%s%s',sensor_r,date,save_format);
% saveas(figure_alpha,filename2,'png');
exportgraphics(ax,filename2,'Resolution',save_resolution)
end
%% x12,y12,x34,y34
x12_x1y0= 1000*x12(:,x_mid+2,y_mid);
x34_x1y0= 1000*x34(:,x_mid+2,y_mid);
y12_x1y0= 1000*y12(:,x_mid+2,y_mid);
y34_x1y0= 1000*y34(:,x_mid+2,y_mid);

x12x34_x1y0 = x12_x1y0+x34_x1y0;
y12y34_x1y0 = y12_x1y0+y34_x1y0;

figure_x12x34 = figure;
hold on;
grid on;

ax = gca;
xticks([0 90 180 270 360])
ax.TickLabelInterpreter='latex';
xlim([0,360]);
plot(theta_elec_in,x12_x1y0,'-r','LineWidth',1)
plot(theta_elec_in,x34_x1y0,'--r','LineWidth',1)
plot(theta_elec_in,y12_x1y0,'-b','LineWidth',1)
plot(theta_elec_in,y34_x1y0,'--b','LineWidth',1)
plot(theta_elec_in,x12x34_x1y0,'-g','LineWidth',1)
plot(theta_elec_in,y12y34_x1y0,'--g','LineWidth',1)
hold off;
box on;
ylatex = '$B[mT]$';
ylabel(ylatex,'Interpreter','latex')
xlatex = '${\theta}_r[deg]$';
xlabel(xlatex,'Interpreter','latex')

leg_abc = legend('$x_{12}$','$x_{34}$','$y_{12}$','$y_{34}$','$x_{12}+x_{34}$','$y_{12}+y_{34}$','Location','northoutside','Numcolumns',3);
set(leg_abc, 'Interpreter', 'latex')
set(leg_abc, 'FontSize', 15);

if(save_enable==1)
filename = sprintf('x12x34y12y34_sensor_r%d_%s%s',sensor_r,date,save_format);
% saveas(figure_x12x34,filename,'png');
exportgraphics(ax,filename,'Resolution',save_resolution)
end
%% full figure
full_figure2 = figure;
hold on;
grid on;
ax = gca;
ax.TickLabelInterpreter='latex';
% title(['sensor_r = ',num2str(sensor_r)])

x_index2=x_index;
y_index2=y_index;
% x_index2(:,1)=[];
% x_index2(:,end)=[];
% y_index2(:,1)=[];
% y_index2(:,end)=[];
for m = x_index2
    for n = y_index2
        scatter(xhat(:,m,n),yhat(:,m,n),2,'black')
    end
end
mesh_x = x_position;
mesh_y = y_position;
[X Y] = meshgrid(mesh_x,mesh_y);
scatter(X, Y,30,'red','*');
box on
xlim([min(x_position)-1,max(x_position)+1])
ylim([min(y_position)-1,max(y_position)+1])
ylatex = '$\hat{y}\,[mm]$';
ylabel(ylatex,'Interpreter','latex')
xlatex = '$\hat{x}\,[mm]$';
xlabel(xlatex,'Interpreter','latex')
hold off

if(save_enable==1)
filename = sprintf('xy_total_sensor_r%d_%s%s',sensor_r,date,save_format);
% saveas(full_figure,filename);
exportgraphics(ax,filename,'Resolution',save_resolution)
end
%% x=1 y=0


xhat1 = xhat(:,x1,y0);
yhat0 = yhat(:,x1,y0);


figx1y0 = figure;
hold on;
ax = gca;
xticks([0 90 180 270 360])
ax.TickLabelInterpreter='latex';
plot(theta_elec_in,xhat1,'k','Linewidth',2)
plot(theta_elec_in,yhat0,'b','Linewidth',2)
leg_10 = legend('$\hat{x}$','$\hat{y}$','Location','best');
set(leg_10, 'Interpreter', 'latex');
set(leg_10, 'FontSize', 15);
grid on
box on
xlim([0 360])
xticks([0 120 240 360])
ylim([-1.25 1.25])
ylatex = '$[mm]$';
ylabel(ylatex,'Interpreter','latex')
xlatex = '$\theta_r\,[degree]$';
xlabel(xlatex,'Interpreter','latex')
hold off

if(save_enable==1)
filename = sprintf('x1y0_partial_sensor_r%d_%s%s',sensor_r,date,save_format);
% saveas(figx1y0,filename,'png')
exportgraphics(ax,filename,'Resolution',save_resolution)
end
%% theta estimation

theta1_hatx1y0 = theta1hat(:,x1,y0)*180/pi();
theta1_hatx1y0 = theta1_hatx1y0.';
theta2_hatx1y0 = theta2hat(:,x1,y0)*180/pi();
theta2_hatx1y0 = theta2_hatx1y0.';
theta_hatx1y0 = theta_r_hat(:,x1,y0)*180/pi();
theta_hatx1y0 = theta_hatx1y0.';
theta_elec_inx1y0 = zeros(1,length(theta_r_index));

for i = theta_r_index

        theta_elec_inx1y0(1,i)=theta_elec_in(1,i);

end

figure_theta = figure;
hold on;
grid on;

ax = gca;
xticks([0 90 180 270 360])
ax.TickLabelInterpreter='latex';


plot(theta_elec_in,theta1_hatx1y0,'r','LineWidth',1)
plot(theta_elec_in,theta2_hatx1y0,'b','LineWidth',1)
plot(theta_elec_in,theta_hatx1y0,'k','LineWidth',1)
ylim([-200 200])
xlim([0 360])
hold off;
ylatex = '$\hat{\theta}_r[deg]$';
ylabel(ylatex,'Interpreter','latex')
xlatex = '${\theta}_r[deg]$';
xlabel(xlatex,'Interpreter','latex')

leg_abc = legend('$\hat{\theta}_r$','${\theta}_1$','${\theta}_2$','Location','northoutside','Numcolumns',3);
set(leg_abc, 'Interpreter', 'latex')
set(leg_abc, 'FontSize', 15);

if(save_enable==1)
filename = sprintf('theta_x1y0_sensor_r%d_%s%s',sensor_r,date,save_format);
% saveas(figure_theta,filename,'png');
exportgraphics(ax,filename,'Resolution',save_resolution)
end
%% theta err estimation

figure_err_theta = figure;
hold on;
grid on;

ax = gca;
xticks([0 90 180 270 360])
ax.TickLabelInterpreter='latex';

theta_err1 = mod(theta1_hatx1y0-theta_elec_inx1y0,360);
theta_err2 = mod(theta2_hatx1y0-theta_elec_inx1y0,360);
theta_err = mod(theta_hatx1y0-theta_elec_inx1y0,360);

for i = theta_r_index
    if(theta_err1(1,i)>180)
        theta_err1(1,i)=theta_err1(1,i)-360;
    end
    if(theta_err2(1,i)>180)
        theta_err2(1,i)=theta_err2(1,i)-360;
    end
    if(theta_err(1,i)>180)
        theta_err(1,i)=theta_err(1,i)-360;
    end
    

end

err_index1 = abs(theta_err1)>30;
err_index2 = abs(theta_err2)>30;
err_index = abs(theta_err)>30;
theta_err1(err_index1);
% theta_err1(err_index1)=0;
% theta_err2(err_index2)=0;
% theta_err(err_index)=0;


plot(theta_elec_in,theta_err,'k','LineWidth',1);
plot(theta_elec_in,theta_err1,'r','LineWidth',1);
plot(theta_elec_in,theta_err2,'b','LineWidth',1);


hold off;
box on;
ylatex = '$Errpr[deg]$';
ylabel(ylatex,'Interpreter','latex','FontSize',15)
xlatex = '${\theta}_r[deg]$';
xlabel(xlatex,'Interpreter','latex','FontSize',15)

ylim([-3, 3])
xlim([0,360])

leg_abc = legend('$\hat{\theta}_r$','${\theta}_1$','${\theta}_2$','Location','northoutside','Numcolumns',3);
set(leg_abc, 'Interpreter', 'latex')
set(leg_abc, 'FontSize', 15);

fprintf('kg = %d\n',kg)

if(save_enable==1)
    filename = sprintf('theta_err_x1y0_sensor_r%d_%s%s',sensor_r,date,save_format);
    % saveas(figure_err_theta,filename,'png')
    exportgraphics(ax,filename,'Resolution',save_resolution)
    close all;
end

