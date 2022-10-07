clc;
clear;
close all;
%%
% x_position= -1:1:1; 
% y_position= -1:1:1;
% theta_increment = 30;
x_position= -3:1:3; 
y_position= -3:1:3;
theta_increment = 5;
theta_elec_in = 0:theta_increment:360-theta_increment;
theta_r_in = theta_elec_in/2;


x_index = 1:1:length(x_position);
y_index = 1:1:length(y_position);
theta_r_index = 1:1:length(theta_r_in);

D_magnet_inner= [10 25 30]
D_magnet_index = 1:1:length(D_magnet_inner);

sensor_space = [10 15 20]
sensor_space_index = 1:1:length(sensor_space);

m_thickness = [3 5 7]
m_thickness_index = 1:1:length(m_thickness);

m_width = 7;
epoch_name = 'circular'
auto = 0;
mesh = 0.3;
%% surface 
%function null = xytheta_func_femm_efficient
% (x_position,y_position,theta_elec_in,surface_magnet_enable,D_magnet_inner,m_thickness,m_width)
surface_magnet_enable = 1;
for k = m_thickness_index
    for j = sensor_space_index
        for i = D_magnet_index
        xytheta_func_femm_efficient(x_position,y_position,theta_elec_in, ...
            surface_magnet_enable,D_magnet_inner(1,i),m_thickness(1,k),m_width,sensor_space(1,j), ...
            auto,mesh,epoch_name, 1);
        end
    end
end
    
epoch_name = 'circular_air'
for k = m_thickness_index
    for j = sensor_space_index
        for i = D_magnet_index
        xytheta_func_femm_efficient(x_position,y_position,theta_elec_in, ...
            surface_magnet_enable,D_magnet_inner(1,i),m_thickness(1,k),m_width,sensor_space(1,j), ...
            auto,mesh,epoch_name, 0);
        end
    end
end
%% rectangular 40*5 metal
epoch_name = 'rect_40,5'
surface_magnet_enable = 0;
m_width = 40;
m_thickness = 5;
D_magnet_inner= [m_width+1 50 60 70 80]
D_magnet_index = 1:1:length(D_magnet_inner);

for j = sensor_space_index
    for i = D_magnet_index
    xytheta_func_femm_efficient(x_position,y_position,theta_elec_in, ...
        surface_magnet_enable,D_magnet_inner(1,i),m_thickness,m_width,sensor_space(1,j), ...
        auto,mesh,epoch_name, 1);
    end
end

%% rectangular 25*3 metal
epoch_name = 'rect_25,3'
surface_magnet_enable = 0;
m_width = 25;
m_thickness = 3;
D_magnet_inner= [m_width+1 35 45 55 65]
D_magnet_index = 1:1:length(D_magnet_inner);

for j = sensor_space_index
    for i = D_magnet_index
    xytheta_func_femm_efficient(x_position,y_position,theta_elec_in, ...
        surface_magnet_enable,D_magnet_inner(1,i),m_thickness,m_width,sensor_space(1,j), ...
        auto,mesh,epoch_name, 1);
    end
end

%% rectangular 10*3 metal
epoch_name = 'rect_10,3'
surface_magnet_enable = 0;
m_width = 10;
m_thickness = 3;
D_magnet_inner= [m_width+1 35 45 55 65]
D_magnet_index = 1:1:length(D_magnet_inner);

for j = sensor_space_index
    for i = D_magnet_index
    xytheta_func_femm_efficient(x_position,y_position,theta_elec_in, ...
        surface_magnet_enable,D_magnet_inner(1,i),m_thickness,m_width,sensor_space(1,j), ...
        auto,mesh,epoch_name, 1);
    end
end

%% rectangular 40*5 air
epoch_name = 'rect_40,5_air'
surface_magnet_enable = 0;
m_width = 40;
m_thickness = 5;
D_magnet_inner= [m_width+1 50 60 70 80]
D_magnet_index = 1:1:length(D_magnet_inner);

for j = sensor_space_index
    for i = D_magnet_index
    xytheta_func_femm_efficient(x_position,y_position,theta_elec_in, ...
        surface_magnet_enable,D_magnet_inner(1,i),m_thickness,m_width,sensor_space(1,j), ...
        auto,mesh,epoch_name, 0);
    end
end

%% rectangular 25*3 air
epoch_name = 'rect_25,3_air'
surface_magnet_enable = 0;
m_width = 25;
m_thickness = 3;
D_magnet_inner= [m_width+1 35 45 55 65]
D_magnet_index = 1:1:length(D_magnet_inner);

for j = sensor_space_index
    for i = D_magnet_index
    xytheta_func_femm_efficient(x_position,y_position,theta_elec_in, ...
        surface_magnet_enable,D_magnet_inner(1,i),m_thickness,m_width,sensor_space(1,j), ...
        auto,mesh,epoch_name, 0);
    end
end

%% rectangular 10*3 air
epoch_name = 'rect_10,3_air'
surface_magnet_enable = 0;
m_width = 10;
m_thickness = 3;
D_magnet_inner= [m_width+1 35 45 55 65]
D_magnet_index = 1:1:length(D_magnet_inner);

for j = sensor_space_index
    for i = D_magnet_index
    xytheta_func_femm_efficient(x_position,y_position,theta_elec_in, ...
        surface_magnet_enable,D_magnet_inner(1,i),m_thickness,m_width,sensor_space(1,j), ...
        auto,mesh,epoch_name, 0);
    end
end