function   Extract_DXF_R3(para,filename)
global HandleToFEMM
%Assign motor parameters
D_arc_2=para.D_arc_2;  % should use greater than 0.8, 0.8~0.99
deg_arc_1=para.deg_arc_1; % should use 10~120
deg_arc_2=para.deg_arc_2; % should use 10~40
m_in_1=para.m_in_1; % should use 1~3
slit_width=para.slit_width; % should use width 5~10
m_thickness=para.m_thickness; % should use 1~3
m_gap=para.m_gap;
b_th_2=para.b_th_2;
% m_in_2=para.m_in_2;


v_shape=0; %if want to use v shape magnet

global HandleToFEMM
pole_number=6;
D_arc_1=36;
% % % %
m_in_2=m_in_1;
%fixed values
b_th_1=1; % use fixed width for manufacturing
Position_Hall=2; %Distance from the output rotor radius (mm)
D_rotor_inner=18; %fixed
depth = 5; %fixed

% to avoid error
if 0.5>abs(deg_arc_1)
    deg_arc_1=sign(deg_arc_1);
end
if 0.5>abs(deg_arc_2)
    deg_arc_2=sign(deg_arc_2);
end
% if 0.05<abs(1-(m_in_2)/m_in_1)
%     m_in_2=m_in_2*1.05
% end

nfeval=1;

% airgap =0.5;
% th_core = 3;

Hc=900000;
% Hc=source.Hc;

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
mi_getmaterial('Ceramic 8')

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
mi_addnode(-b_th_2/2,y_bridge);

mi_addnode(-b_th_1/2,y_bridge-m_thickness);
mi_addsegment(-b_th_2/2,y_bridge,-b_th_1/2,y_bridge-m_thickness);
mi_selectrectangle(-b_th_2,0,b_th_1,y_bridge,4);
mi_moverotate(0,0,-180/pole_number);

    
r_temp=m_thickness*sin(atan2(m_in_2-m_in_1,slit_width/2));
x_plus_1=r_temp*cos(atan2(m_in_2-m_in_1,slit_width/2));
y_plus_1=r_temp*sin(atan2(m_in_2-m_in_1,slit_width/2));
x_plus_2=m_gap*cos(atan2(m_in_2-m_in_1,slit_width/2));
y_plus_2=m_gap*sin(atan2(m_in_2-m_in_1,slit_width/2));

  
%draw magnet
if v_shape==0
    mi_addnode(slit_width/2,(D_arc_1/2)-m_in_1);
    mi_addnode(0,(D_arc_1/2)-m_in_1);
    mi_addnode(slit_width/2,(D_arc_1/2)-m_thickness-m_in_1);
    mi_addnode(0,(D_arc_1/2)-m_thickness-m_in_1);
    
    mi_addnode(slit_width/2-m_gap,(D_arc_1/2)-m_in_1);
    mi_addnode(slit_width/2-m_gap,(D_arc_1/2)-m_thickness-m_in_1);
    
    mi_addsegment(slit_width/2,(D_arc_1/2-m_in_1),-0,(D_arc_1/2-m_in_1));
    mi_addsegment(slit_width/2,(D_arc_1/2-m_in_1)-m_thickness,0,(D_arc_1/2-m_in_1)-m_thickness);
    % mi_addsegment(slit_width/2,(D_arc_1/2-m_in)-m_thickness,slit_width/2,(D_arc_1/2-m_in));
    mi_addsegment(slit_width/2-m_gap,(D_arc_1/2-m_in_1)-m_thickness,slit_width/2-m_gap,(D_arc_1/2-m_in_1));
end

if v_shape==1
mi_addnode(slit_width/2-x_plus_1-x_plus_2,(D_arc_1/2)-m_in_1-y_plus_1-y_plus_2);
mi_addnode(slit_width/2-x_plus_2,(D_arc_1/2)-m_thickness-m_in_1-y_plus_2);
mi_addsegment(slit_width/2-x_plus_2,(D_arc_1/2)-m_thickness-m_in_1-y_plus_2,slit_width/2-x_plus_1-x_plus_2,(D_arc_1/2)-m_in_1-y_plus_1-y_plus_2);
mi_addnode(0,(D_arc_1/2)-m_in_2);
mi_addnode(slit_width/2,(D_arc_1/2)-m_thickness-m_in_1);
mi_addnode(0,(D_arc_1/2)-m_thickness-m_in_2);
    

    if m_in_2>m_in_1
        mi_addnode(slit_width/2,(D_arc_1/2)-m_in_1);
        
        mi_addnode(x_plus_1,(D_arc_1/2)-m_thickness-m_in_2+y_plus_1);
        mi_addsegment(0,(D_arc_1/2)-m_in_2,x_plus_1,(D_arc_1/2)-m_thickness-m_in_2+y_plus_1);
        mi_addsegment(slit_width/2,(D_arc_1/2-m_in_1),-0,(D_arc_1/2-m_in_2));
        
    end
    if m_in_2<m_in_1
        mi_addnode(-x_plus_1,(D_arc_1/2)-m_in_2-y_plus_1);
        mi_addsegment(0,(D_arc_1/2)-m_in_2-m_thickness,-x_plus_1,(D_arc_1/2)-m_in_2-y_plus_1);
        mi_addsegment(slit_width/2-x_plus_1-x_plus_2,(D_arc_1/2)-m_in_1-y_plus_1-y_plus_2,-0,(D_arc_1/2-m_in_2));
    end
    mi_addsegment(slit_width/2,(D_arc_1/2-m_in_1)-m_thickness,0,(D_arc_1/2-m_in_2)-m_thickness);
    
end


% find outer most radius of magnet
m_radius=(((D_arc_1/2)-m_in_1)^2+(slit_width/2)^2)^0.5;
m_angle=atan2( slit_width/2,D_arc_1/2-m_in_1);
% add 1mm for the bridge
arc_1_radius=m_radius+1 ;
x_arc_1=arc_1_radius*sin(m_angle);
y_arc_1=arc_1_radius*cos(m_angle);
mi_addnode(0,(D_arc_1/2));
mi_addnode(x_arc_1,y_arc_1);
if deg_arc_1>0
    mi_addarc(x_arc_1,y_arc_1,0,(D_arc_1/2),deg_arc_1,5);
else
    mi_addarc(0,(D_arc_1/2),x_arc_1,y_arc_1,-deg_arc_1,5);
end

x_arc_2=(D_arc_2/2)*sin(pi/pole_number);
y_arc_2=(D_arc_2/2)*cos(pi/pole_number);
mi_addnode(x_arc_2,y_arc_2);
if deg_arc_2>0
    mi_addarc(x_arc_1,y_arc_1,x_arc_2,y_arc_2,deg_arc_2,5);
else
    mi_addarc(x_arc_2,y_arc_2,x_arc_1,y_arc_1,-deg_arc_2,5);
end

bridge_arc_ratio=0.9; % to grap the point for arc
x_bridge_2=((D_arc_2/2)-1)*sin(pi/pole_number*bridge_arc_ratio);
y_bridge_2=((D_arc_2/2)-1)*cos(pi/pole_number*bridge_arc_ratio);
x_bridge_3=((D_arc_2/2)-1-m_thickness)*sin(pi/pole_number*bridge_arc_ratio);
y_bridge_3=((D_arc_2/2)-1-m_thickness)*cos(pi/pole_number*bridge_arc_ratio);

if deg_arc_2>0
        mi_addarc(slit_width/2-x_plus_1,(D_arc_1/2)-m_in_1-y_plus_1,x_bridge_2,y_bridge_2,deg_arc_2,5);        
        mi_addarc(slit_width/2,(D_arc_1/2)-m_thickness-m_in_1,x_bridge_3,y_bridge_3,deg_arc_2,5);
%         mi_addarc(slit_width/2,(D_arc_1/2)-m_in_1,x_bridge_2,y_bridge_2,deg_arc_2,5);        
%         mi_addarc(slit_width/2,(D_arc_1/2)-m_thickness-m_in_1,x_bridge_3,y_bridge_3,deg_arc_2,5);
 else
        mi_addarc(x_bridge_2,y_bridge_2,slit_width/2-x_plus_1,(D_arc_1/2)-m_in_1-y_plus_1,-deg_arc_2,5);
        mi_addarc(x_bridge_3,y_bridge_3,slit_width/2,(D_arc_1/2)-m_thickness-m_in_1,-deg_arc_2,5);

%         mi_addarc(x_bridge_2,y_bridge_2,slit_width/2,(D_arc_1/2)-m_in_1,-deg_arc_2,5);
%         mi_addarc(x_bridge_3,y_bridge_3,slit_width/2,(D_arc_1/2)-m_thickness-m_in_1,-deg_arc_2,5);
end

mi_clearselected();
mi_addblocklabel(slit_width/2+0.1,(D_arc_1/2)-m_thickness-m_in_1+0.1);
mi_selectlabel(slit_width/2+0.1,(D_arc_1/2)-m_thickness-m_in_1+0.1);
mi_setblockprop('Air', 0, 1, 'None', 0, 0, 0);
mi_clearselected();

mi_selectrectangle(-D_arc_1,-D_arc_1,D_arc_1,D_arc_1,4);
mi_mirror2(0,0,0,1,4);
mi_selectrectangle(-D_arc_1,-D_arc_1,D_arc_1,D_arc_1,4);
mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,4);

if v_shape==0
    for z=1:2:pole_number
        mi_clearselected();
        mi_addblocklabel(((D_arc_1/2)-0.5*m_thickness-m_in_1)*cos((30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-0.5*m_thickness-m_in_1)*sin((30+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel(((D_arc_1/2)-0.5*m_thickness-m_in_1)*cos((30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-0.5*m_thickness-m_in_1)*sin((30+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('Ceramic 8',1,0,'None',30+(z-1)*360/pole_number,2,1);
        mi_clearselected();
        
    end
    
    for z=2:2:pole_number
        mi_clearselected();
        mi_addblocklabel(((D_arc_1/2)-0.5*m_thickness-m_in_1)*cos((30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-0.5*m_thickness-m_in_1)*sin((30+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel(((D_arc_1/2)-0.5*m_thickness-m_in_1)*cos((30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-0.5*m_thickness-m_in_1)*sin((30+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('Ceramic 8',1,0,'None',(30+(z-1)*360/pole_number-180),2,1);
        mi_clearselected();
        
    end
    mi_clearselected();
    
end

if v_shape==1
    deg_temp=atan2(m_in_2-m_in_1,slit_width/2);
    deg_temp_2=atan2(slit_width*0.25,D_arc_1/2-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)
    for z=1:2:pole_number
        mi_clearselected();
        mi_addblocklabel(((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*cos(deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*sin(deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel(((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*cos(deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*sin(deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('NdFeB',1,0,'None',-deg_temp*180/pi+30+(z-1)*360/pole_number,2,1);
        
        mi_clearselected();
        mi_addblocklabel(((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*cos(-deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*sin(-deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel(((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*cos(-deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*sin(-deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('NdFeB',1,0,'None',deg_temp*180/pi+30+(z-1)*360/pole_number,2,1);
        mi_clearselected();
        
    end
    
    for z=2:2:pole_number
        mi_clearselected();
        mi_addblocklabel(((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*cos(deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*sin(deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel(((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*cos(deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*sin(deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('NdFeB',1,0,'None',-deg_temp*180/pi+30+(z-1)*360/pole_number,2,1);
        
        mi_clearselected();
        mi_addblocklabel(((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*cos(-deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*sin(-deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel(((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*cos(-deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_in_1-m_thickness*0.5-(m_in_2-m_in_1)*0.5)*sin(-deg_temp_2+(30+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('NdFeB',1,0,'None',deg_temp*180/pi+30+(z-1)*360/pole_number,2,1);
        mi_clearselected();
        
    end
    
    for z=1:1:pole_number
        mi_clearselected();
        mi_addnode(slit_width/2,(D_arc_1/2)-m_thickness-m_in_1);
        
        mi_addblocklabel(((D_arc_1/2)-m_thickness*0.5-m_in_2)*cos((90+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_thickness*0.5-m_in_2)*sin((90+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel(((D_arc_1/2)-m_thickness*0.5-m_in_2)*cos((90+(z-1)*360/pole_number)*2*pi/360),((D_arc_1/2)-m_thickness*0.5-m_in_2)*sin((90+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('Air', 0, 1, 'None', 0, 0, 0);
        mi_clearselected();
        
    end
    mi_clearselected();
    
end

% yoke

airgap=2.5;
yoke_th=3;
%Origin
x_0 = 0;y_0 = 0;
mi_addnode(x_0+(D_arc_1/2+airgap),y_0);
mi_addnode(x_0-(D_arc_1/2+airgap),y_0);
mi_addarc(x_0+(D_arc_1/2+airgap),y_0,x_0-(D_arc_1/2+airgap),y_0,180,5); %Semicircle from 0 deg. to 180 deg.
mi_addarc(x_0-(D_arc_1/2+airgap),y_0,x_0+(D_arc_1/2+airgap),y_0,180,5); %Semicircle from 180 deg. to 360 deg.

mi_addnode(x_0+(D_arc_1/2+airgap+yoke_th),y_0);
mi_addnode(x_0-(D_arc_1/2+airgap+yoke_th),y_0);
mi_addarc(x_0+(D_arc_1/2+airgap+yoke_th),y_0,x_0-(D_arc_1/2+airgap+yoke_th),y_0,180,5); %Semicircle from 0 deg. to 180 deg.
mi_addarc(x_0-(D_arc_1/2+airgap+yoke_th),y_0,x_0+(D_arc_1/2+airgap+yoke_th),y_0,180,5); %Semicircle from 180 deg. to 360 deg.

mi_clearselected();
mi_addblocklabel(x_0+(D_arc_1/2+airgap+yoke_th/2),y_0);
mi_selectlabel(x_0+(D_arc_1/2+airgap+yoke_th/2),y_0);
mi_setblockprop('M-19 Steel', 1, 0, 'None', 0, 1, 0);
mi_clearselected();
mi_addblocklabel(x_0+(D_arc_1/2+airgap/2),y_0);
mi_selectlabel(x_0+(D_arc_1/2+airgap/2),y_0);
mi_setblockprop('Air', 0, 1, 'None', 0, 0, 0);
mi_clearselected();
mi_addblocklabel(0,D_arc_1/2-0.1);
mi_selectlabel(0,D_arc_1/2-0.1);
mi_setblockprop('M-19 Steel', 1, 0, 'None', 0, 1, 0);
mi_clearselected();mi_refreshview();mi_zoomnatural();

mi_resize(500,500) 

mi_zoomnatural();
name_fem=[num2str(filename) '.dxf'];

mi_savedxf(name_fem) 


%% Post analysis
% mi_createmesh
mi_analyze(1)
mi_loadsolution()
k=1;
num_deg=36*3;
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
% 
% plotting
elec_deg=0:360/num_deg:360;
figure(33)
plot(elec_deg,(B_sin_rot))
hold on
plot(elec_deg,(B_cos_rot))
legend('Sin','Cos')
xlabel('[rad]')
ylabel('B [T]')
figure(44)
plot(elec_deg,atan2(B_sin_rot,B_cos_rot).*180/pi)
xlabel('[deg]')
ylabel('\theta_{est} [deg]')
figure(55)
stem(frequencyRange,abs(SinradfreqDomain))
hold on
stem(frequencyRange,abs(CosradfreqDomain))
xlabel('Harmonics')
ylabel('Magnitude')
%objective function
% Eval_value.Total_volume=rotor_volume+coil_volume+stator_volume+mag_volume
Eval_value.Total_volume=mag_volume
Eval_value.Total_THD=CosTHD+SinTHD
Eval_value.Amp_fundamental=abs(SinradfreqDomain(2))
