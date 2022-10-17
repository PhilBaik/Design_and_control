clc;
% clear;
close all;


%% loading & enable check 
% load('femm_output1_space10.0_sensor_r26.5_mag_in25.0_20221003_first_trial.mat')
% load('femm_output1_space20.0_sensor_r39.0_mag_in30.0_20221003_circular.mat')
%%
save_enable = 1; % if you are going to save the data post-processed
figure_enable = 1;
kg = 1;

%% max min flux checking
max_peak_flux = zeros(length(x_index),length(y_index));
min_peak_flux = zeros(length(x_index),length(y_index));


for x = x_index
    for y = y_index
        max_arr = [max(abs(a1(:,x,y))),max(abs(a2(:,x,y))),max(abs(a3(:,x,y))),max(abs(a4(:,x,y))), ...
            max(abs(b1(:,x,y))),max(abs(b2(:,x,y))),max(abs(b3(:,x,y))),max(abs(b4(:,x,y))) ...
            ,max(abs(c1(:,x,y))),max(abs(c2(:,x,y))),max(abs(c3(:,x,y))),max(abs(c4(:,x,y)))];
        max_peak_flux(x,y) = max(max_arr);
        min_peak_flux(x,y) = min(max_arr);
        diff = a1(:,x,y)-a2(:,x,y);
    end
end

dif_max_flux =max_peak_flux'-min_peak_flux';
max_peak_flux

max_flux = max(max(max_peak_flux));
min_flux = min(min(min_peak_flux));

% fine_x = find(max_peak_flux'*25-2.5 <0,1)
% trouble_x = x_position(fine_x)

%% geting alpha beta gamma
dq = 2/3*[1 -0.5 -0.5;0 sqrt(3)/2 -sqrt(3)/2;1/2 1/2 1/2];

alpha = zeros(4,length(theta_r_index),length(x_index),length(y_index));
beta = zeros(4,length(theta_r_index),length(x_index),length(y_index));
gamma = zeros(4,length(theta_r_index),length(x_index),length(y_index));
for(r = theta_r_index)
    for(x = x_index)
        for(y = y_index)
            alpha(1,r,x,y)=dq(1,:)*[a1(r,x,y);b1(r,x,y);c1(r,x,y)];
            alpha(2,r,x,y)=dq(1,:)*[a2(r,x,y);b2(r,x,y);c2(r,x,y)];
            alpha(3,r,x,y)=dq(1,:)*[a3(r,x,y);b3(r,x,y);c3(r,x,y)];
            alpha(4,r,x,y)=dq(1,:)*[a4(r,x,y);b4(r,x,y);c4(r,x,y)];
            beta(1,r,x,y)=dq(2,:)*[a1(r,x,y);b1(r,x,y);c1(r,x,y)];
            beta(2,r,x,y)=dq(2,:)*[a2(r,x,y);b2(r,x,y);c2(r,x,y)];
            beta(3,r,x,y)=dq(2,:)*[a3(r,x,y);b3(r,x,y);c3(r,x,y)];
            beta(4,r,x,y)=dq(2,:)*[a4(r,x,y);b4(r,x,y);c4(r,x,y)];
            gamma(1,r,x,y)=dq(3,:)*[a1(r,x,y);b1(r,x,y);c1(r,x,y)];
            gamma(2,r,x,y)=dq(3,:)*[a2(r,x,y);b2(r,x,y);c2(r,x,y)];
            gamma(3,r,x,y)=dq(3,:)*[a3(r,x,y);b3(r,x,y);c3(r,x,y)];
            gamma(4,r,x,y)=dq(3,:)*[a4(r,x,y);b4(r,x,y);c4(r,x,y)];
        end
    end
end

%% x12,y12 estimation

x12 = zeros(length(theta_r_index),length(x_index),length(y_index));
y12 = zeros(length(theta_r_index),length(x_index),length(y_index));
x34 = zeros(length(theta_r_index),length(x_index),length(y_index));
y34 = zeros(length(theta_r_index),length(x_index),length(y_index));

xhat = zeros(length(theta_r_index),length(x_index),length(y_index));
yhat = zeros(length(theta_r_index),length(x_index),length(y_index));

for(r = theta_r_index)
    for(x = x_index)
        for(y = y_index)
            x12(r,x,y) = alpha(1,r,x,y)*gamma(1,r,x,y)-alpha(2,r,x,y)*gamma(2,r,x,y);
            y12(r,x,y) = beta(1,r,x,y)*gamma(1,r,x,y)-beta(2,r,x,y)*gamma(2,r,x,y);
            x34(r,x,y) = cos(-pi/6)*(alpha(3,r,x,y)*gamma(3,r,x,y)-alpha(4,r,x,y)*gamma(4,r,x,y))-sin(-pi/6)*(beta(3,r,x,y)*gamma(3,r,x,y)-beta(4,r,x,y)*gamma(4,r,x,y));
            y34(r,x,y) = sin(-pi/6)*(alpha(3,r,x,y)*gamma(3,r,x,y)-alpha(4,r,x,y)*gamma(4,r,x,y))+cos(-pi/6)*(beta(3,r,x,y)*gamma(3,r,x,y)-beta(4,r,x,y)*gamma(4,r,x,y));

        end
    end
end



%% kg calculation using x_index=mid+1, y_index=mid fixed point
    
    if(length(x_index)*length(y_index)~=1)
    x_mid = floor(median(x_index));
    y_mid = floor(median(y_index));
    checkx1y0 = x12(:,x_mid+1,y_mid)+x34(:,x_mid+1,y_mid);
    x1y0 = [x_position(1,x_mid+1),y_position(1,y_mid)]
    mean(checkx1y0);
    kg = round(norm(x1y0)/mean(checkx1y0))
    end

%% xhat, yhat calculation
for r = theta_r_index
    for x = x_index
        for y = y_index
            xhat(r,x,y) = kg*(x12(r,x,y)+x34(r,x,y));
            yhat(r,x,y) = -kg*(y12(r,x,y)+y34(r,x,y));
        end
    end
end

%% theta calculation
theta1hat = zeros(length(theta_r_index),length(x_index),length(y_index));
theta2hat = zeros(length(theta_r_index),length(x_index),length(y_index));
theta_r_hat = zeros(length(theta_r_index),length(x_index),length(y_index));

%%% before revised
% for r = theta_r_index
%     for x = x_index
%         for y = y_index
%             theta1hat(r,x,y) = atan2(beta(2,r,x,y),alpha(1,r,x,y));
%             theta2hat(r,x,y) = atan2(beta(1,r,x,y),alpha(2,r,x,y));
%             theta_r_hat(r,x,y) = (theta1hat(r,x,y)+theta2hat(r,x,y))/2;
%         end
%     end
% end

%%% halmonic enhanced version
for x = x_index
    for y = y_index
            theta1hat(:,x,y) = atan2(beta(2,:,x,y),alpha(1,:,x,y));
            theta2hat(:,x,y) = atan2(beta(1,:,x,y),alpha(2,:,x,y));
            theta_r_hat(:,x,y) = atan2((beta(1,:,x,y)+beta(2,:,x,y))/2,(alpha(1,:,x,y)+alpha(2,:,x,y))/2);
    end
end

%% theta figure & full figure
if(figure_enable == 1)
    figure(1);
plot(theta_elec_in,theta1hat(:,1,1))

% f2 = zeros(length(x_index),2);
% 
% for m = x_index
%         f2(m,1) = figure; %a
%         hold on;
%         legend("off")
%         legend("show",Location="best")
%         title(['xhat ','x = ', num2str(x_position(1,m)),  '  sensor r=  ',num2str(sensor_r),' mm'])
% %         f2(m,2) = figure;
% %         hold on;
% %         legend("off")
% %         legend("show",Location="best")
% %         title(['yhat ','x = ', num2str(x_position(1,m)),  '  sensor r=  ',num2str(sensor_r),' mm'])
%     for n = y_index
%         figure(f2(m,1));
%         plot(theta_r_in,xhat(:,m,n),'DisplayName',['y = ',num2str(y_position(1,n))])
% %         figure(f2(m,2));
% %         plot(theta_r_in,yhat(:,m,n),'DisplayName',['y = ',num2str(y_position(1,n))])
%     end
% end
%%
full_figure = figure(2);
hold on;
grid on;
title(['sensor_r = ',num2str(sensor_r)])
xlim([min(x_position)-1,max(x_position)+1])
ylim([min(y_position)-1,max(y_position)+1])
    for m = x_index
        for n = y_index
            scatter(xhat(:,m,n),yhat(:,m,n),2)
        end
    end
end
%%
check_figure = figure(3);
plot(xhat(:,1,1))
title(['kg = ', num2str(kg)])
%% MSE
% x_ref = repmat(x_position,[length(theta_elec_in),1,length(y_position)]);
% err_x = (xhat-x_ref).^2
% tot_err_x = sum(err_x)
% 
% y_ref = repmat(y_position,[length(theta_elec_in),1,length(y_position)]);
% err_y = (xhat-x_ref).^2
% tot_err_y = sum(err_y)

err_x = zeros(size(xhat));
err_y = zeros(size(yhat));
err_theta = zeros(size(theta_r_hat));
for i = x_index
    err_x(:,i,:) = err_x(:,i,:) + x_position(1,i);
end
for i = y_index
    err_y(:,:,i) = err_y(:,:,i) + y_position(1,i);
end
for i = theta_r_index
    err_theta(i,:,:) = err_theta(i,:,:) + theta_elec_in(1,i);
end

err_x = xhat - err_x;
err_x = err_x.^2;
err_y = yhat - err_y;
err_y = err_y.^2;;

tot_error_x = sum(sum(sum(err_x)));
tot_error_x = tot_error_x/(length(x_position)*length(y_position)*length(theta_elec_in));
tot_error_y = sum(sum(sum(err_y)));
tot_error_y = tot_error_y/(length(x_position)*length(y_position)*length(theta_elec_in));

position_error = [tot_error_x,tot_error_y]

% err_theta = theta_r_hat - err_theta/180*pi

%% save operation
if(save_enable==1)
    close all;
    date = datestr(now,'mmdd');
    dirname = ['post_data_',date,'/',epoch_name,'/'];
    mkdir(dirname)
    filename_pre = sprintf('surface%d_space%3.1f_sensor_r%3.1f_mag_in%3.1f_%s',surface_magnet_enable,sensor_space,sensor_r,D_magnet_inner,epoch_name);
    err_sprintf = sprintf('xytheta_post_%f_',tot_error_y)
    filename_post = [dirname,err_sprintf,filename_pre,'_',date,'.mat'];
    save(filename_post)
end
save_enable=0;
figure_enable=0;
