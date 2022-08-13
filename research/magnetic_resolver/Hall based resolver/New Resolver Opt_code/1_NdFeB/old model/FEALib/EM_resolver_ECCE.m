function [Eval_value] = EM_resolver_ECCE(para,nfeval,mode)
% 6 optimization variable
D_arc_2=para(1);  % should use greater than 0.8, 0.8~0.99
deg_arc_1=para(2); % should use 10~120
deg_arc_2=para(3); % should use 10~40
m_in=para(4); % should use 1~3
m_width=para(5); % should use width 5~10
m_thickness=para(6); % should use 1~3

% D_arc_2=D_arc_1*0.8;  % should use greater than 0.8, 0.8~0.99
% m_thickness=1.5; % should use 1~3
% m_width=8; % should use width 5~10
% m_in=3; % should use 1~3
% deg_arc_1=50; % should use 10~120
% deg_arc_2=50; % should use 10~40

global HandleToFEMM
pole_number=6;
D_arc_1=36;

x_bridge=1; % fixed for manufacturing

Position_Hall=2; %Distance from the output rotor radius (mm)
D_rotor_inner=18; %fixed
depth = 5; %fixed

Iteration=1;
Population=1;
nfeval=1;

% airgap =0.5;
% th_core = 3;

Hc=900000;
% Hc=source.Hc;

% Hc=para(10);
% depth = para(11);
% Iteration=para(12);
% Population=para(13);

%Start building motor model using FEMM
openfemm;
assignin('base',join(['handle',num2str(nfeval)]), HandleToFEMM)

newdocument(0);
path='C:/femm42/';
name_fem=[num2str(nfeval) '.fem'];
mi_saveas([path,name_fem]);

%Assign materials
idensity = 0;
u_r_mag=1.05;
u_0=4*pi*10^-7;
mi_addmaterial('NdFeB',u_r_mag,u_r_mag,Hc,0,0.556);
mi_addmaterial('NoMag',u_r_mag,u_r_mag);
mi_getmaterial('Air');
mi_getmaterial('M-19 Steel')

% mi_addboundprop('A_0',0,0,0,0,0,0,0,0,0);
mi_probdef(0,'millimeters','planar',1e-008,depth,30);

mi_clearselected();
mi_zoomnatural();

length_square=D_arc_1*1.5;
x_1=-length_square;x_2=length_square;y_1=-length_square;y_2=length_square;
%generate dots
mi_addnode(x_1,y_1);mi_addnode(x_1,y_2);mi_addnode(x_2,y_1);mi_addnode(x_2,y_2);
%draw lines
mi_addsegment(x_1,y_1,x_1,y_2);mi_addsegment(x_1,y_2,x_2,y_2);
mi_addsegment(x_2,y_2,x_2,y_1);mi_addsegment(x_2,y_1,x_1,y_1);

mi_addblocklabel(x_1+1,y_1+1);
mi_selectlabel(x_1+1,y_1+1);
mi_setblockprop('Air', 0, 1, 'None', 0, 0, 0);

%Origin
x_0 = 0;y_0 = 0;
%Inner part of the rotor
mi_addnode(x_0+(D_rotor_inner/2),y_0);
mi_addnode(x_0-(D_rotor_inner/2),y_0);
mi_addarc(x_0+(D_rotor_inner/2),y_0,x_0-(D_rotor_inner/2),y_0,180,5); %Semicircle from 0 deg. to 180 deg.
mi_addarc(x_0-(D_rotor_inner/2),y_0,x_0+(D_rotor_inner/2),y_0,180,5); %Semicircle from 180 deg. to 360 deg.

mi_selectcircle(x_0,y_0,(D_rotor_inner/2),4);
mi_clearselected();
mi_addblocklabel(x_0,y_0);
mi_selectlabel(x_0,y_0);
mi_setblockprop('Air', 0, 1, 'None', 0, 0, 0);

% airgap barrier
y_bridge=(D_arc_2/2)-1;
mi_addnode(-x_bridge/2,y_bridge);
mi_addnode(-x_bridge/2,y_bridge-m_thickness);
mi_addsegment(-x_bridge/2,y_bridge,-x_bridge/2,y_bridge-m_thickness);
mi_selectrectangle(-x_bridge,0,x_bridge,y_bridge,4);
mi_moverotate(0,0,-180/pole_number);

%draw magnet
mi_addnode(m_width/2,(D_arc_1/2)-m_in);
mi_addnode(0,(D_arc_1/2)-m_in);
mi_addnode(m_width/2,(D_arc_1/2)-m_thickness-m_in);
mi_addnode(0,(D_arc_1/2)-m_thickness-m_in);
mi_addsegment(m_width/2,(D_arc_1/2-m_in),-0,(D_arc_1/2-m_in));
mi_addsegment(m_width/2,(D_arc_1/2-m_in)-m_thickness,0,(D_arc_1/2-m_in)-m_thickness);
mi_addsegment(m_width/2,(D_arc_1/2-m_in)-m_thickness,m_width/2,(D_arc_1/2-m_in));

% find outer most radius of magnet
m_radius=(((D_arc_1/2)-m_in)^2+(m_width/2)^2)^0.5;
m_angle=atan2( m_width/2,D_arc_1/2-m_in);
% add 1mm for the bridge
arc_1_radius=m_radius+1 ;
x_arc_1=arc_1_radius*sin(m_angle);
y_arc_1=arc_1_radius*cos(m_angle);
mi_addnode(0,(D_arc_1/2));
mi_addnode(x_arc_1,y_arc_1);
mi_addarc(x_arc_1,y_arc_1,0,(D_arc_1/2),deg_arc_1,5);

x_arc_2=(D_arc_2/2)*sin(pi/pole_number);
y_arc_2=(D_arc_2/2)*cos(pi/pole_number);
mi_addnode(x_arc_2,y_arc_2);
mi_addarc(x_arc_1,y_arc_1,x_arc_2,y_arc_2,deg_arc_2,5);
bridge_arc_ratio=0.93; % to grap the point for arc
x_bridge_2=((D_arc_2/2)-1)*sin(pi/pole_number*bridge_arc_ratio);
y_bridge_2=((D_arc_2/2)-1)*cos(pi/pole_number*bridge_arc_ratio);
x_bridge_3=((D_arc_2/2)-1-m_thickness)*sin(pi/pole_number*bridge_arc_ratio);
y_bridge_3=((D_arc_2/2)-1-m_thickness)*cos(pi/pole_number*bridge_arc_ratio);
mi_addarc(m_width/2,(D_arc_1/2)-m_in,x_bridge_2,y_bridge_2,deg_arc_2,5);
mi_addarc(m_width/2,(D_arc_1/2)-m_thickness-m_in,x_bridge_3,y_bridge_3,deg_arc_2,5);
mi_clearselected();
mi_addblocklabel(m_width/2+0.1,(D_arc_1/2)-m_thickness-m_in);
mi_selectlabel(m_width/2+0.1,(D_arc_1/2)-m_thickness-m_in);
mi_setblockprop('Air', 0, 1, 'None', 0, 0, 0);

mi_selectrectangle(-D_arc_1,-D_arc_1,D_arc_1,D_arc_1,4);
mi_mirror2(0,0,0,1,4);
mi_selectrectangle(-D_arc_1,-D_arc_1,D_arc_1,D_arc_1,4);
mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,4);

for z=1:2:pole_number
    mi_clearselected();
    mi_addblocklabel(((D_arc_1/2)-0.5*m_thickness-m_in)*cos((30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-0.5*m_thickness-m_in)*sin((30+(z-1)*360/pole_number)*2*pi/360));
    mi_selectlabel(((D_arc_1/2)-0.5*m_thickness-m_in)*cos((30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-0.5*m_thickness-m_in)*sin((30+(z-1)*360/pole_number)*2*pi/360));
    mi_setblockprop('NdFeB',1,0,'None',30+(z-1)*360/pole_number,2,1);
end

for z=2:2:pole_number
    mi_clearselected();
    mi_addblocklabel(((D_arc_1/2)-0.5*m_thickness-m_in)*cos((30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-0.5*m_thickness-m_in)*sin((30+(z-1)*360/pole_number)*2*pi/360));
    mi_selectlabel(((D_arc_1/2)-0.5*m_thickness-m_in)*cos((30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-0.5*m_thickness-m_in)*sin((30+(z-1)*360/pole_number)*2*pi/360));
    mi_setblockprop('NdFeB',1,0,'None',(30+(z-1)*360/pole_number-180),2,1);
end

mi_clearselected();
mi_addblocklabel(0,D_arc_1/2-0.1);
mi_selectlabel(0,D_arc_1/2-0.1);
mi_setblockprop('M-19 Steel', 1, 0, 'None', 0, 1, 0);

mi_clearselected();mi_refreshview();mi_zoomnatural();

%% Post analysis
mi_analyze(1)
mi_loadsolution()
k=1;
num_deg=36;
for rad_n=0:2*pi/num_deg:2*pi
    xpoint=real(((D_arc_1/2)+Position_Hall)*exp(j*(pi/2-rad_n/(pole_number/2))));
    ypoint=imag(((D_arc_1/2)+Position_Hall)*exp(j*(pi/2-rad_n/(pole_number/2))));
    pv = mo_getpointvalues(xpoint,ypoint);
    B_cos_rot(k)=-imag((pv(2)+j*pv(3))*exp(j*rad_n/(pole_number/2))); %In order to change the coordinates system.
    xpoint=real(((D_arc_1/2)+Position_Hall)*exp(j*(pi/6+pi/2-rad_n/(pole_number/2))));
    ypoint=imag(((D_arc_1/2)+Position_Hall)*exp(j*(pi/6+pi/2-rad_n/(pole_number/2))));
    pv = mo_getpointvalues(xpoint,ypoint);
    B_sin_rot(k)=-imag((pv(2)+j*pv(3))*exp(j*(-pi/6+rad_n/(pole_number/2)))); %In order to change the coordinates system.
    k=k+1;
end

%resolver volume
stator_volume=0;
mo_clearblock();
mo_groupselectblock(1);
rotor_volume=mo_blockintegral(10)*(depth*10^-3);
mo_clearblock();
mo_groupselectblock(2);
mag_volume=mo_blockintegral(10)*(depth*10^-3);
mo_clearblock();
coil_volume=0;
%resolver THD
[CosTHD,SinTHD,CosradfreqDomain,SinradfreqDomain,frequencyRange]=THD((B_cos_rot),(B_sin_rot));

%plotting
% elec_deg=0:360/num_deg:360;
% figure(3)
% plot(elec_deg,(B_sin_rot))
% hold on
% plot(elec_deg,(B_cos_rot))
% legend('Sin','Cos')
% xlabel('[rad]')
% ylabel('B [T]')
% figure(4)
% plot(elec_deg,atan2(B_sin_rot,B_cos_rot).*180/pi)
% xlabel('[deg]')
% ylabel('\theta_{est} [deg]')
% figure(5)
% stem(frequencyRange,abs(SinradfreqDomain))
% hold on
% stem(frequencyRange,abs(CosradfreqDomain))
% xlabel('Harmonics')
% ylabel('Magnitude')
% %objective function
% Eval_value.Total_volume=rotor_volume+coil_volume+stator_volume+mag_volume
Eval_value.Total_volume=mag_volume
Eval_value.Total_THD=CosTHD+SinTHD