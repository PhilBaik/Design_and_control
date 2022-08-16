clear;
clc;

%input
x_position= -2:0.5:2; 
% x_position = 0;
y_position= -2:0.5:2;
% y_position = 0;
theta_increment = 2;
theta_elec_in = 0:theta_increment:360-theta_increment;
theta_r_in = theta_elec_in/2;

theta_position = 0;
sensor_space = 20;
D_rotor_outer= 56;
sensor_r= D_rotor_outer/2 + sensor_space;
D_stator_outer =  250;

x_index = 1:1:length(x_position);
y_index = 1:1:length(y_position);
theta_r_index = 1:1:length(theta_r_in);

Num_turns=1;
Num_series=1;
Num_parallel=1;


openfemm;
newdocument(0);
path='C:/femm42/';
name_fem='ebike.fem';

mi_saveas([path,name_fem]);
Hc=900000;

u_r_mag=1.05;
mi_getmaterial('Air')
mi_getmaterial('M-19')
mi_addmaterial('NdFeB',u_r_mag,u_r_mag,Hc,0,0.556);

mi_addboundprop('A_0',0,0,0,0)

%%% hall, magnet position
depth = 24.5;
pole_number= 4;
airgap = 0.5;
m_thickness=3;
m_width=9.3;
m_in=m_thickness;
D_rotor_inner = 50;% m location
D_shaft=8;
R_sue_3=D_rotor_outer*0.5+airgap;
inner_boundary = 0.7; %0~1 coefficient mulitplied with D_stator_outer

mi_probdef(0,'millimeters','planar',1e-008,depth,30);


% outer boundary
x1=0;
y1=0;
k=D_stator_outer*0.5;
mi_addnode(x1+k,y1);
mi_addnode(x1-k,y1);
mi_addarc(x1+k,y1,x1-k,y1,180,5);
mi_addarc(x1-k,y1,x1+k,y1,180,5);

mi_clearselected();
mi_selectarcsegment(0,k);
mi_setarcsegmentprop(1,'A_0', 0,0);
mi_selectarcsegment(0,-k) ;
mi_setarcsegmentprop(1,'A_0', 0,0);

% 
% mi_clearselected();
% mi_addblocklabel(0,0);
% mi_selectlabel(0,0);
% mi_setblockprop('Air',1, 0, '<None>', 0, 0, 0);

mi_zoomnatural();
mi_clearselected()
mi_refreshview()


%rotor
x1=0;
y1=0;
k=D_rotor_inner/2+m_thickness;
mi_addnode(x1+k,y1);
mi_addnode(x1-k,y1);
mi_addarc(x1+k,y1,x1-k,y1,180,5);
mi_addarc(x1-k,y1,x1+k,y1,180,5);

x1=0;
y1=0;
k=D_rotor_inner/2;
mi_addnode(x1+k,y1);
mi_addnode(x1-k,y1);
mi_addarc(x1+k,y1,x1-k,y1,180,5);
mi_addarc(x1-k,y1,x1+k,y1,180,5);

mi_addsegment(D_rotor_inner/2,0,D_rotor_inner/2+m_thickness,0)
mi_addsegment(-D_rotor_inner/2,0,-D_rotor_inner/2-m_thickness,0)

mi_addnode(0, D_rotor_inner/2+m_thickness);
mi_addnode(0, -D_rotor_inner/2-m_thickness);
mi_addnode(0, D_rotor_inner/2);
mi_addnode(0, -D_rotor_inner/2);
mi_addsegment(0,D_rotor_inner/2,0,D_rotor_inner/2+m_thickness)
mi_addsegment(0,-D_rotor_inner/2,0,-D_rotor_inner/2-m_thickness)



mi_selectcircle(0,0,(D_rotor_outer+airgap)*0.5,4);
mi_copyrotate2(0,0,360/2,2,4);
mi_addsegment((D_rotor_inner/2)-m_in+m_thickness,m_width/2,(D_rotor_inner/2)-m_in+m_thickness,-m_width/2)
mi_addsegment(-((D_rotor_inner/2)-m_in+m_thickness),m_width/2,-((D_rotor_inner/2)-m_in+m_thickness),-m_width/2)


z=1;
mi_clearselected();
mi_addblocklabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
mi_selectlabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
mi_setblockprop('NdFeB',0,0.1,'None',90+180/pole_number+(z-1)*4*180/pole_number,(10+z*2-1),1);
z=2;
mi_clearselected();
mi_addblocklabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
mi_selectlabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
mi_setblockprop('NdFeB',0,0.1,'None',90+180/pole_number+(z-1)*4*180/pole_number,(10+z*2-1),1);

z=1;
mi_clearselected();
mi_addblocklabel(cos((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
mi_selectlabel(cos((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
mi_setblockprop('NdFeB',0,0.1,'None',180/pole_number+(z-1)*4*180/pole_number,(10+z*2-1),1);
z=2;
mi_clearselected();
mi_addblocklabel(cos((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
mi_selectlabel(cos((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
mi_setblockprop('NdFeB',0,0.1,'None',180/pole_number+(z-1)*4*180/pole_number,(10+z*2-1),1);

% shaft property
% mi_clearselected();
% mi_addblocklabel(0,0);
% mi_selectlabel(0,0);
% mi_setblockprop('Air',0, 0.5, '<None>', 0, 10, 0);

mi_clearselected();
mi_addblocklabel(0,D_shaft*0.5+1);
mi_selectlabel(0,D_shaft*0.5+1);
mi_setblockprop('Air',0, 0.2, '<None>', 0, 10, 0);

%outer air
mi_clearselected();
mi_addblocklabel(0,0.5*D_stator_outer-1);
mi_selectlabel(0,0.5*D_stator_outer-1);
mi_setblockprop('Air',0, 0.1, '<None>', 0, 0, 0);%

mi_clearselected();
mi_selectcircle(0,0,(D_rotor_outer*0.5+airgap*0.5),4)
mi_seteditmode('group')
mi_moverotate(0,0,theta_position+90)

mi_selectcircle(0,0,(D_stator_outer*0.5+airgap*0.5),4)
mi_seteditmode('group')
mi_moverotate(0,0,-90)




%% 

%%%%%%%%%%%%% Post analysis


% time.FEA_run=round(toc)

mi_selectcircle(0,0,(D_rotor_outer*0.5+airgap*0.5),4)
mi_seteditmode('group')
mi_moverotate(0,0,45)

%%analyzing
mi_analyze(1)
mi_loadsolution()

[B_0abs, B_30abs, B_60abs, B_90abs, B_120abs, B_150abs, B_180abs, B_210abs, B_240abs,...
        B_270abs, B_300abs, B_330abs] = getflux(theta_r_in,x_position,y_position,sensor_r);

closefemm;


a1 = B_0abs; b1 = B_240abs; c1 = B_120abs;
a2 = B_180abs; b2 = B_60abs; c2 = B_300abs;
a3 = B_30abs; b3 = B_270abs; c3 = B_150abs;
a4 = B_210abs; b4 = B_90abs; c4 = B_330abs;


date = datestr(now,'yyyymmdd_HHMM')
filename = sprintf('femm_output_sensor_r%d_air_%s.mat',sensor_r,date)
% filename = 'hi';

save(filename)

function [B_0abs, B_30abs, B_60abs, B_90abs, B_120abs, B_150abs, B_180abs, B_210abs, B_240abs,...
        B_270abs, B_300abs, B_330abs] = getflux(theta_r_in,x_pos, y_pos,sensor_r)
    x_index = 1:1:length(x_pos);
    y_index = 1:1:length(y_pos);
    theta_index = 1:1:length(theta_r_in);
    B_0x = zeros(length(theta_index),length(x_index),length(y_index));
    B_0y = zeros(length(theta_index),length(x_index),length(y_index));
    B_0abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_30x = zeros(length(theta_index),length(x_index),length(y_index));
    B_30y = zeros(length(theta_index),length(x_index),length(y_index));
    B_30abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_60x = zeros(length(theta_index),length(x_index),length(y_index));
    B_60y = zeros(length(theta_index),length(x_index),length(y_index));
    B_60abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_90x = zeros(length(theta_index),length(x_index),length(y_index));
    B_90y = zeros(length(theta_index),length(x_index),length(y_index));
    B_90abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_120x = zeros(length(theta_index),length(x_index),length(y_index));
    B_120y = zeros(length(theta_index),length(x_index),length(y_index));
    B_120abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_150x = zeros(length(theta_index),length(x_index),length(y_index));
    B_150y = zeros(length(theta_index),length(x_index),length(y_index));
    B_150abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_180x = zeros(length(theta_index),length(x_index),length(y_index));
    B_180y = zeros(length(theta_index),length(x_index),length(y_index));
    B_180abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_210x = zeros(length(theta_index),length(x_index),length(y_index));
    B_210y = zeros(length(theta_index),length(x_index),length(y_index));
    B_210abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_240x = zeros(length(theta_index),length(x_index),length(y_index));
    B_240y = zeros(length(theta_index),length(x_index),length(y_index));
    B_240abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_270x = zeros(length(theta_index),length(x_index),length(y_index));
    B_270y = zeros(length(theta_index),length(x_index),length(y_index));
    B_270abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_300x = zeros(length(theta_index),length(x_index),length(y_index));
    B_300y = zeros(length(theta_index),length(x_index),length(y_index));
    B_300abs = zeros(length(theta_index),length(x_index),length(y_index));
    B_330x = zeros(length(theta_index),length(x_index),length(y_index));
    B_330y = zeros(length(theta_index),length(x_index),length(y_index));
    B_330abs = zeros(length(theta_index),length(x_index),length(y_index));


    for theta = theta_index
        for x = x_index
            for y = y_index
                rot_matrix = [cos(theta_r_in(1,theta)*pi/180), sin(theta_r_in(1,theta)*pi/180); -sin(theta_r_in(1,theta)*pi/180), cos(theta_r_in(1,theta)*pi/180)];
                xypoint0 = rot_matrix*[sensor_r*cos(0*pi/180)-x_pos(1,x); sensor_r*sin(0*pi/180)-y_pos(1,y)];
                
                xypoint30 = rot_matrix*[sensor_r*cos(30*pi/180)-x_pos(1,x); sensor_r*sin(30*pi/180)-y_pos(1,y)];
                xypoint60 = rot_matrix*[sensor_r*cos(60*pi/180)-x_pos(1,x); sensor_r*sin(60*pi/180)-y_pos(1,y)];
                xypoint90 = rot_matrix*[sensor_r*cos(90*pi/180)-x_pos(1,x); sensor_r*sin(90*pi/180)-y_pos(1,y)];
                xypoint120 = rot_matrix*[sensor_r*cos(120*pi/180)-x_pos(1,x); sensor_r*sin(120*pi/180)-y_pos(1,y)];
                xypoint150 = rot_matrix*[sensor_r*cos(150*pi/180)-x_pos(1,x); sensor_r*sin(150*pi/180)-y_pos(1,y)];
                xypoint180 = rot_matrix*[sensor_r*cos(180*pi/180)-x_pos(1,x); sensor_r*sin(180*pi/180)-y_pos(1,y)];
                xypoint210 = rot_matrix*[sensor_r*cos(210*pi/180)-x_pos(1,x); sensor_r*sin(210*pi/180)-y_pos(1,y)];
                xypoint240 = rot_matrix*[sensor_r*cos(240*pi/180)-x_pos(1,x); sensor_r*sin(240*pi/180)-y_pos(1,y)];
                xypoint270 = rot_matrix*[sensor_r*cos(270*pi/180)-x_pos(1,x); sensor_r*sin(270*pi/180)-y_pos(1,y)];
                xypoint300 = rot_matrix*[sensor_r*cos(300*pi/180)-x_pos(1,x); sensor_r*sin(300*pi/180)-y_pos(1,y)];
                xypoint330 = rot_matrix*[sensor_r*cos(330*pi/180)-x_pos(1,x); sensor_r*sin(330*pi/180)-y_pos(1,y)];

                theta0 = atan2(xypoint0(2,1),xypoint0(1,1));
                theta30 = atan2(xypoint30(2,1),xypoint30(1,1));
                theta60 = atan2(xypoint60(2,1),xypoint60(1,1));
                theta90 = atan2(xypoint90(2,1),xypoint90(1,1));
                theta120 = atan2(xypoint120(2,1),xypoint120(1,1));
                theta150 = atan2(xypoint150(2,1),xypoint150(1,1));
                theta180 = atan2(xypoint180(2,1),xypoint180(1,1));
                theta210 = atan2(xypoint210(2,1),xypoint210(1,1));
                theta240 = atan2(xypoint240(2,1),xypoint240(1,1));
                theta270 = atan2(xypoint270(2,1),xypoint270(1,1));
                theta300 = atan2(xypoint300(2,1),xypoint300(1,1));
                theta330 = atan2(xypoint330(2,1),xypoint330(1,1));

                pv0 = mo_getpointvalues(xypoint0(1,1),xypoint0(2,1));
                pv30 = mo_getpointvalues(xypoint30(1,1),xypoint30(2,1));
                pv60 = mo_getpointvalues(xypoint60(1,1),xypoint60(2,1));
                pv90 = mo_getpointvalues(xypoint90(1,1),xypoint90(2,1));
                pv120 = mo_getpointvalues(xypoint120(1,1),xypoint120(2,1));
                pv150 = mo_getpointvalues(xypoint150(1,1),xypoint150(2,1));
                pv180 = mo_getpointvalues(xypoint180(1,1),xypoint180(2,1));
                pv210 = mo_getpointvalues(xypoint210(1,1),xypoint210(2,1));
                pv240 = mo_getpointvalues(xypoint240(1,1),xypoint240(2,1));
                pv270 = mo_getpointvalues(xypoint270(1,1),xypoint270(2,1));
                pv300 = mo_getpointvalues(xypoint300(1,1),xypoint300(2,1));
                pv330 = mo_getpointvalues(xypoint330(1,1),xypoint330(2,1));
                
                %%% getting flux density of x, y
                B_0x(theta,x,y)=pv0(2);B_0y(theta,x,y)=pv0(3); 
%                 B_0abs(theta,x,y) = sqrt(B_0x(theta,x,y)^2+B_0y(theta,x,y)^2);
                B_0abs(theta,x,y)=real((B_0x(theta,x,y) + 1i*B_0y(theta,x,y))*exp(-1i*theta0));

                B_30x(theta,x,y)=pv30(2); B_30y(theta,x,y)=pv30(3);
%                 B_30abs(theta,x,y) = sqrt(B_30x(theta,x,y)^2+B_30y(theta,x,y)^2);
                B_30abs(theta,x,y)=real((B_30x(theta,x,y) + 1i*B_30y(theta,x,y))*exp(-1i*theta30));

                B_60x(theta,x,y)=pv60(2); B_60y(theta,x,y)=pv60(3); 
%                 B_60abs(theta,x,y) = sqrt(B_60x(theta,x,y)^2+B_60y(theta,x,y)^2);
                B_60abs(theta,x,y)=real((B_60x(theta,x,y) + 1i*B_60y(theta,x,y))*exp(-1i*theta60));

                B_90x(theta,x,y)=pv90(2); B_90y(theta,x,y)=pv90(3);
%                 B_90abs(theta,x,y) = sqrt(B_90x(theta,x,y)^2+B_90y(theta,x,y)^2);
                B_90abs(theta,x,y)=real((B_90x(theta,x,y) + 1i*B_90y(theta,x,y))*exp(-1i*theta90));   

                B_120x(theta,x,y)=pv120(2); B_120y(theta,x,y)=pv120(3); 
%                 B_120abs(theta,x,y) = sqrt(B_120x(theta,x,y)^2+B_120y(theta,x,y)^2);
                B_120abs(theta,x,y)=real((B_120x(theta,x,y) + 1i*B_120y(theta,x,y))*exp(-1i*theta120));

                B_150x(theta,x,y)=pv150(2); B_150y(theta,x,y)=pv150(3); 
%                 B_150abs(theta,x,y) = sqrt(B_150x(theta,x,y)^2+B_150y(theta,x,y)^2);
                B_150abs(theta,x,y)=real((B_150x(theta,x,y) + 1i*B_150y(theta,x,y))*exp(-1i*theta150));

                B_180x(theta,x,y)=pv180(2); B_180y(theta,x,y)=pv180(3); 
%                 B_180abs(theta,x,y) = sqrt(B_180x(theta,x,y)^2+B_180y(theta,x,y)^2);
                B_180abs(theta,x,y)=real((B_180x(theta,x,y) + 1i*B_180y(theta,x,y))*exp(-1i*theta180));

                B_210x(theta,x,y)=pv210(2); B_210y(theta,x,y)=pv210(3); 
%                 B_210abs(theta,x,y) = sqrt(B_210x(theta,x,y)^2+B_210y(theta,x,y)^2);
                B_210abs(theta,x,y)=real((B_210x(theta,x,y) + 1i*B_210y(theta,x,y))*exp(-1i*theta210));

                B_240x(theta,x,y)=pv240(2); B_240y(theta,x,y)=pv240(3); 
%                 B_240abs(theta,x,y) = sqrt(B_240x(theta,x,y)^2+B_240y(theta,x,y)^2);
                B_240abs(theta,x,y)=real((B_240x(theta,x,y) + 1i*B_240y(theta,x,y))*exp(-1i*theta240));

                B_270x(theta,x,y)=pv270(2); B_270y(theta,x,y)=pv270(3); 
%                 B_270abs(theta,x,y) = sqrt(B_270x(theta,x,y)^2+B_270y(theta,x,y)^2);
                B_270abs(theta,x,y)=real((B_270x(theta,x,y) + 1i*B_270y(theta,x,y))*exp(-1i*theta270));

                B_300x(theta,x,y)=pv300(2); B_300y(theta,x,y)=pv300(3);
%                 B_300abs(theta,x,y) = sqrt(B_300x(theta,x,y)^2+B_300y(theta,x,y)^2);
                B_300abs(theta,x,y)=real((B_300x(theta,x,y) + 1i*B_300y(theta,x,y))*exp(-1i*theta300));

                B_330x(theta,x,y)=pv330(2); B_330y(theta,x,y)=pv330(3);
%                 B_330abs(theta,x,y) = sqrt(B_330x(theta,x,y)^2+B_330y(theta,x,y)^2);
                B_330abs(theta,x,y)=real((B_330x(theta,x,y) + 1i*B_330y(theta,x,y))*exp(-1i*theta330));
            end
        end
    end

end

