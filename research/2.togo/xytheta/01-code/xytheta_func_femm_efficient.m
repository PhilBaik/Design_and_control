function null = xytheta_func_femm_efficient(x_position,y_position,theta_elec_in, ...
    surface_magnet_enable,D_magnet_inner,m_thickness,m_width, sensor_space, ...
    auto, mesh_size, epoch_name, rotor_metal)

clc;
close all;
%% input
% surface_magnet_enable = 0;
% x_position= -5:1:5; 
% y_position= -1:1:1;
% x_position= -2:1:2; 
% y_position= -2:1:2;
% theta_increment = 10;
% theta_elec_in = 0:theta_increment:360-theta_increment;
theta_r_in = theta_elec_in/2;
theta_position = 0;
% %%% input index
x_index = 1:1:length(x_position);
y_index = 1:1:length(y_position);
theta_r_index = 1:1:length(theta_r_in);
%% geometry
D_rotor_outer = 100;
% D_magnet_inner = 50;% m location
D_shaft = 5;
% m_thickness=3;
% m_width=30;
m_in=m_thickness;
D_magnet_outer = D_magnet_inner + 2*m_thickness;
D_boundary =  200;
depth = 30;
pole_number= 4;
D_rotor_inner = D_shaft;


% R_sue_3=D_rotor_outer*0.5+airgap;
if(surface_magnet_enable == 1)
    D_rotor_outer = D_magnet_inner;
    
    sensor_r= D_magnet_outer/2 + sensor_space;
else
%     if ((D_rotor_outer/2 < sqrt((D_magnet_outer/2)^2+(m_width/2)^2))||(D_magnet_inner<D_shaft))
%         msg = 'Boundary Error';
%         error(msg);
%     end
    D_rotor_outer = 2*(sqrt((D_magnet_outer/2)^2+(m_width/2)^2)+1);
    sensor_r= D_rotor_outer/2 + sensor_space;
end

%% setup
Num_turns=1;
Num_series=1;
Num_parallel=1;
if(auto == 1)
    mesh_size = 0;
end

%% start femm and save
openfemm;
newdocument(0);
path='C:/femm42/';
name_fem= sprintf('xytheta_%s.fem',epoch_name)

mi_saveas([path,name_fem]);

%% getting material and problem definition
Hc=900000;

u_r_mag=1.05;
mi_getmaterial('Air')
mi_getmaterial('M-19')
mi_addmaterial('NdFeB',u_r_mag,u_r_mag,Hc,0,0.556);
mi_addboundprop('A_0',0,0,0,0)
mi_probdef(0,'millimeters','planar',1e-008,depth,30);


%% outer boundary and property
%%% open boundary condition
x0=0;
y0=0;
mi_makeABC(5,D_boundary/2,x0,y0,0)

%outer air
mi_clearselected();
mi_addblocklabel(0,0.5*D_boundary-1);
mi_selectlabel(0,0.5*D_boundary-1);
mi_setblockprop('Air',auto, mesh_size, '<None>', 0, 0, 0);%

%%%% use this condition if it is not an open boundary.

% x0=0;
% y0=0;
% k=D_stator_outer*0.5;
% mi_addnode(x0+k,y0);
% mi_addnode(x0-k,y0);
% mi_addarc(x0+k,y0,x0-k,y0,180,5);
% mi_addarc(x0-k,y0,x0+k,y0,180,5);
% 
% mi_clearselected();
% mi_selectarcsegment(0,k);
% mi_setarcsegmentprop(1,'A_0', 0,0);
% mi_selectarcsegment(0,-k) ;
% mi_setarcsegmentprop(1,'A_0', 0,0);
% 
% mi_zoomnatural();
% mi_clearselected()
% mi_refreshview()

%% rotor geometry and properties
x0=0;
y0=0;
k=D_rotor_outer/2;
mi_addnode(x0+k,y0);
mi_addnode(x0-k,y0);
mi_addarc(x0+k,y0,x0-k,y0,180,5);
mi_addarc(x0-k,y0,x0+k,y0,180,5);

x0=0;
y0=0;
k=D_rotor_inner/2;
mi_addnode(x0+k,y0);
mi_addnode(x0-k,y0);
mi_addarc(x0+k,y0,x0-k,y0,180,5);
mi_addarc(x0-k,y0,x0+k,y0,180,5);

mi_clearselected();
mi_addblocklabel(0,0.5*D_rotor_inner+1);
mi_selectlabel(0,0.5*D_rotor_inner+1);

if(rotor_metal == 1)
    mi_setblockprop('M-19',auto, mesh_size, '<None>', 0, 0, 0);%metal
else
    mi_setblockprop('Air',auto, mesh_size, '<None>', 0, 0, 0);%air
end
%% shaft geometry and property
x0=0;
y0=0;
k=D_shaft/2;

mi_addnode(x0+k,y0);
mi_addnode(x0-k,y0);
mi_addarc(x0+k,y0,x0-k,y0,180,5);
mi_addarc(x0-k,y0,x0+k,y0,180,5);

mi_clearselected();
mi_addblocklabel(0,0);
mi_selectlabel(0,0);
mi_setblockprop('Air',auto, mesh_size, '<None>', 0, 10, 0);

%% rotor with magnet

if(surface_magnet_enable == 1 )
    x0=0;
    y0=0;
    k=D_magnet_inner/2+m_thickness;
    mi_addnode(x0+k,y0);
    mi_addnode(x0-k,y0);
    mi_addarc(x0+k,y0,x0-k,y0,180,5);
    mi_addarc(x0-k,y0,x0+k,y0,180,5);
    
    x0=0;
    y0=0;
    k=D_magnet_inner/2;
    mi_addnode(x0+k,y0);
    mi_addnode(x0-k,y0);
    mi_addarc(x0+k,y0,x0-k,y0,180,5);
    mi_addarc(x0-k,y0,x0+k,y0,180,5);

    mi_addsegment(D_magnet_inner/2,0,D_magnet_inner/2+m_thickness,0)
    mi_addsegment(-D_magnet_inner/2,0,-D_magnet_inner/2-m_thickness,0)
    
    mi_addnode(0, D_magnet_inner/2+m_thickness);
    mi_addnode(0, -D_magnet_inner/2-m_thickness);
    mi_addnode(0, D_magnet_inner/2);
    mi_addnode(0, -D_magnet_inner/2);
    mi_addsegment(0,D_magnet_inner/2,0,D_magnet_inner/2+m_thickness)
    mi_addsegment(0,-D_magnet_inner/2,0,-D_magnet_inner/2-m_thickness)
    
    z=1;
    mi_clearselected();
    mi_addblocklabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5);
    mi_selectlabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5);
    mi_setblockprop('NdFeB',auto,mesh_size,'None',90+180/pole_number+(z-1)*4*180/pole_number,(10+z*2-1),1);
    z=2;
    mi_clearselected();
    mi_addblocklabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5);
    mi_selectlabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5);
    mi_setblockprop('NdFeB',auto,mesh_size,'None',90+180/pole_number+(z-1)*4*180/pole_number,(10+z*2-1),1);
    %
    z=1;
    mi_clearselected();
    mi_addblocklabel(cos((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5,sin((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5);
    mi_selectlabel(cos((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5,sin((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5);
    mi_setblockprop('NdFeB',auto,mesh_size,'None',180/pole_number+(z-1)*4*180/pole_number,(10+z*2-1),1);
    z=2;
    mi_clearselected();
    mi_addblocklabel(cos((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5,sin((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5);
    mi_selectlabel(cos((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5,sin((pi/2+pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_magnet_inner+m_thickness)*0.5);
    mi_setblockprop('NdFeB',auto,mesh_size,'None',180/pole_number+(z-1)*4*180/pole_number,(10+z*2-1),1);
else
    x0=0;
    y0=0;
    k=D_magnet_inner/2;
    mi_addnode(x0+m_width/2,y0+D_magnet_inner/2);
    mi_addnode(x0-m_width/2,y0+D_magnet_inner/2);
    mi_addnode(x0+m_width/2,y0+D_magnet_inner/2+m_thickness);
    mi_addnode(x0-m_width/2,y0+D_magnet_inner/2+m_thickness);
    mi_addsegment(x0+m_width/2,y0+D_magnet_inner/2,x0-m_width/2,y0+D_magnet_inner/2);
    mi_addsegment(x0+m_width/2,y0+D_magnet_inner/2,x0+m_width/2,y0+D_magnet_inner/2+m_thickness);
    mi_addsegment(x0-m_width/2,y0+D_magnet_inner/2,x0-m_width/2,y0+D_magnet_inner/2+m_thickness);
    mi_addsegment(x0+m_width/2,y0+D_magnet_inner/2+m_thickness,x0-m_width/2,y0+D_magnet_inner/2+m_thickness);
    
    mi_selectrectangle(x0+m_width/2+1,y0+D_magnet_inner/2+m_thickness+1,x0-m_width/2-1,y0+D_magnet_inner/2-1,4)
    mi_copyrotate2(x0,y0,90,3,4)

    z=2;
    mi_clearselected();
    mi_addblocklabel(x0+(D_magnet_inner+m_thickness)/2,y0);
    mi_selectlabel(x0+(D_magnet_inner+m_thickness)/2,y0);
    mi_setblockprop('NdFeB',auto,mesh_size,'None',0,(10+z*2-1),1);
    z=1;
    mi_clearselected();
    mi_addblocklabel(x0,y0+(D_magnet_inner+m_thickness)/2);
    mi_selectlabel(x0,y0+(D_magnet_inner+m_thickness)/2);
    mi_setblockprop('NdFeB',auto,mesh_size,'None',270,(10+z*2-1),1);
    z=2;
    mi_clearselected();
    mi_addblocklabel(x0-(D_magnet_inner+m_thickness)/2,y0);
    mi_selectlabel(x0-(D_magnet_inner+m_thickness)/2,y0);
    mi_setblockprop('NdFeB',auto,mesh_size,'None',180,(10+z*2-1),1);
    %
    z=1;
    mi_clearselected();
    mi_addblocklabel(x0,y0-(D_magnet_inner+m_thickness)/2);
    mi_selectlabel(x0,y0-(D_magnet_inner+m_thickness)/2);
    mi_setblockprop('NdFeB',auto,mesh_size,'None',90,(10+z*2-1),1);
    
end
%% 

%%%%%%%%%%%%% Post analysis


% time.FEA_run=round(toc)

mi_selectcircle(0,0,D_boundary*0.5-10,4)
mi_seteditmode('group')
mi_moverotate(0,0,45)

% mi_makeABC(7,D_boundary/2,x0,y0,0)
%% analyzing
mi_analyze(1)
%% loading solution
mi_loadsolution()
%%
[B_0abs, B_30abs, B_60abs, B_90abs, B_120abs, B_150abs, B_180abs, B_210abs, B_240abs,...
        B_270abs, B_300abs, B_330abs] = xytheta_func_getflux(theta_r_in,x_position,y_position,sensor_r);
%%
closefemm;

a1 = B_0abs; b1 = B_240abs; c1 = B_120abs;
a2 = B_180abs; b2 = B_60abs; c2 = B_300abs;
a3 = B_30abs; b3 = B_270abs; c3 = B_150abs;
a4 = B_210abs; b4 = B_90abs; c4 = B_330abs;


date = datestr(now,'yyyymmdd')
filename = sprintf('femm_output%d_space%3.1f_sensor_r%3.1f_mag_in%3.1f_%s_%s.mat',surface_magnet_enable,sensor_space,sensor_r,D_magnet_inner,date,epoch_name)
% filename = 'hi';

save(filename)
null = [];

end



