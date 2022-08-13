clear all
close all
global HandleToFEMM


% mode=1 %conventional mode
% mode=2 %hall sensor - surface PM
% mode=3 %hall sensor - consecutive surface PM
% mode=4 %hall sensor - interior PM
% mode=5 %hall sensor - consecutive interior PM
mode=6 %hall sensor - resolver

D_rotor_outer=17;
slot_number = 10;
nfeval=1
Ror=D_rotor_outer/2;
m_thickness=1;
w_teeth =3;
shoe_1=0.2;
shoe_2=0.3;
airgap =0.5;
th_core = 3;
slot_ratio = 0.75;
pole_arc_ratio = 0.5;
D_ro1=D_rotor_outer;
D_ro2=15
a_arc=70%degree
D_ri1=8
D_ri2=10
a_ri=0.1

if mode==6 
    pole_number=6;
    D_rotor_inner=10%(mode6)
else
    pole_number=8;
    D_rotor_inner=D_rotor_outer-m_thickness*2; 
end
%Angles in the Hall-effect resolver
deg_shape=3; %Make the saliency of the rotor in order ot avoid THD
deg_barrier=50; %Make the arc of the flux barrier
deg_round=51; % Round the corners of the hexagon
Position_Hall=2; %Distance from the output rotor radius (mm)


mag_dis=1
mag_th=1
mag_width=2

Num_turns=200

inset_thickness=0;
Hc=950000;
% Hc=source.Hc;
depth = 5;
Iteration=1;
Population=1;

% Hc=para(10);
% depth = para(11);
% Iteration=para(12);
% Population=para(13);

D_stator_outer =  36;
Rir=D_rotor_inner/2;
D_stator_inner=D_rotor_outer+airgap*2;
R_shoe_3=D_rotor_outer*0.5+airgap;
R_shoe_2=R_shoe_3+shoe_2;
R_shoe_1=R_shoe_2+shoe_1;


pole_pair=pole_number/2
consecutive_pole_pair=pole_number

%Start building motor model using FEMM
openfemm;
assignin('base',join(['handle',num2str(nfeval)]), HandleToFEMM)

% join(['handle',num2str(nfeval)])=HandleToFEMM;
% HandleToFEMM=join(['handle',num2str(nfeval)]);
% a=join(['handle',num2str(nfeval)])
% HandleToFEMM=eval(a)
newdocument(0);
path='C:/femm42/';
name_fem=[num2str(nfeval) '.fem'];
mi_saveas([path,name_fem]);

%Assign materials
idensity = 0;
u_r_mag=1.00;
u_0=4*pi*10^-7;
mi_addmaterial('NdFeB',u_r_mag,u_r_mag,Hc,0,0.556);
mi_addmaterial('NoMag',u_r_mag,u_r_mag);
mi_getmaterial('Air');
mi_getmaterial('M-19 Steel')

mi_addmaterial('I_1+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_1-', 1, 1, 0, idensity/2, 56);
mi_addmaterial('I_2+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_2-', 1, 1, 0, idensity/2, 56);
mi_addmaterial('I_3+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_3-', 1, 1, 0, idensity/2, 56);
mi_addmaterial('I_4+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_4-', 1, 1, 0, idensity/2, 56);
mi_addmaterial('I_5+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_5-', 1, 1, 0, idensity/2, 56);
mi_addmaterial('I_6+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_6-', 1, 1, 0, idensity/2, 56);
mi_addmaterial('I_7+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_7-', 1, 1, 0, idensity/2, 56);
mi_addmaterial('I_8+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_8-', 1, 1, 0, idensity/2, 56);
mi_addmaterial('I_9+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_9-', 1, 1, 0, idensity/2, 56);
mi_addmaterial('I_10+', 1, 1, 0, -idensity/2, 56);
mi_addmaterial('I_10-', 1, 1, 0, idensity/2, 56);
mi_addboundprop('A_0',0,0,0,0,0,0,0,0,0);
mi_probdef(0,'millimeters','planar',1e-008,depth,30);

mi_clearselected();
mi_zoomnatural();

if mode==1
    pole_number= 8;
    slot_number = 10;
    mi_addnode(-(D_stator_outer*0.5-th_core)*cos((pi/2-(asin(w_teeth*0.5/(D_stator_outer*0.5-th_core))))),(D_stator_outer*0.5-th_core)*sin((pi/2-(asin(w_teeth*0.5/(D_stator_outer*0.5-th_core))))));
    mi_addnode(0,R_shoe_3);
    mi_addnode(R_shoe_3*cos((pi/2+pi/slot_number*slot_ratio)),R_shoe_3*sin((pi/2+pi/slot_number*slot_ratio)));
    mi_addnode(R_shoe_2*cos((pi/2+pi/slot_number*slot_ratio)),R_shoe_2*sin((pi/2+pi/slot_number*slot_ratio)));
    mi_addnode(-R_shoe_1*cos((pi/2-(asin(w_teeth*0.5/R_shoe_1)))),R_shoe_1*sin((pi/2-(asin(w_teeth*0.5/R_shoe_1)))));
    mi_addsegment(-(D_stator_outer*0.5-th_core)*cos((pi/2-(asin(w_teeth*0.5/(D_stator_outer*0.5-th_core))))),(D_stator_outer*0.5-th_core)*sin((pi/2-(asin(w_teeth*0.5/(D_stator_outer*0.5-th_core))))),-R_shoe_1*cos((pi/2-(asin(w_teeth*0.5/R_shoe_1)))),R_shoe_1*sin((pi/2-(asin(w_teeth*0.5/R_shoe_1)))));
    mi_addsegment(-R_shoe_1*cos((pi/2-(asin(w_teeth*0.5/R_shoe_1)))),R_shoe_1*sin((pi/2-(asin(w_teeth*0.5/R_shoe_1)))),R_shoe_2*cos((pi/2+pi/slot_number*slot_ratio)),R_shoe_2*sin((pi/2+pi/slot_number*slot_ratio)));
    mi_addsegment(R_shoe_2*cos((pi/2+pi/slot_number*slot_ratio)),R_shoe_2*sin((pi/2+pi/slot_number*slot_ratio)),R_shoe_3*cos((pi/2+pi/slot_number*slot_ratio)),R_shoe_3*sin((pi/2+pi/slot_number*slot_ratio)));
    mi_addarc(0,R_shoe_3,R_shoe_3*cos((pi/2+pi/slot_number*slot_ratio)),R_shoe_3*sin((pi/2+pi/slot_number*slot_ratio)),(180/slot_number*slot_ratio),5);
    mi_addnode((D_stator_outer*0.5-th_core)*cos((pi/2+pi/slot_number)),(D_stator_outer*0.5-th_core)*sin((pi/2+pi/slot_number)));
    mi_addnode(R_shoe_2*cos((pi/2+pi/slot_number)),R_shoe_2*sin((pi/2+pi/slot_number)));
    mi_addsegment((D_stator_outer*0.5-th_core)*cos((pi/2+pi/slot_number)),(D_stator_outer*0.5-th_core)*sin((pi/2+pi/slot_number)),R_shoe_2*cos((pi/2+pi/slot_number)),R_shoe_2*sin((pi/2+pi/slot_number)));
    mi_addsegment(R_shoe_2*cos((pi/2+pi/slot_number)),R_shoe_2*sin((pi/2+pi/slot_number)),R_shoe_2*cos((pi/2+pi/slot_number*slot_ratio)),R_shoe_2*sin((pi/2+pi/slot_number*slot_ratio)));
    mi_addarc(-(D_stator_outer*0.5-th_core)*cos((pi/2-(asin(w_teeth*0.5/(D_stator_outer*0.5-th_core))))),(D_stator_outer*0.5-th_core)*sin((pi/2-(asin(w_teeth*0.5/(D_stator_outer*0.5-th_core))))),(D_stator_outer*0.5-th_core)*cos((pi/2+pi/slot_number)),(D_stator_outer*0.5-th_core)*sin((pi/2+pi/slot_number)),(180/slot_number-180/pi*(asin(w_teeth*0.5/(D_stator_outer*0.5-th_core)))),5);
    mi_selectcircle(0,0,D_stator_outer,4);
    mi_mirror2(0,0,0,10,4);
    mi_selectcircle(0,0,D_stator_outer*0.5,4);
    mi_copyrotate2(0,0,360/slot_number,slot_number,4);
    
    % winding
    zz=1;
    mi_clearselected();
    for v=1:20
        xx=floor((v-1)/2);
        zz=zz*-1;
        mi_addblocklabel(((D_stator_outer*0.5+R_shoe_1-th_core)/2)*cos((zz*pi/slot_number*0.9+pi/2+2*pi/slot_number*xx)),((D_stator_outer*0.5+R_shoe_1-th_core)/2)*sin((zz*pi/slot_number*0.9+pi/2+2*pi/slot_number*xx)));
        mi_selectlabel(((D_stator_outer*0.5+R_shoe_1-th_core)/2)*cos((zz*pi/slot_number*0.9+pi/2+2*pi/slot_number*xx)),((D_stator_outer*0.5+R_shoe_1-th_core)/2)*sin((zz*pi/slot_number*0.9+pi/2+2*pi/slot_number*xx)));
        if (v==1)
            mi_setblockprop('I_1-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==2)
            mi_setblockprop('I_1+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==3)
            mi_setblockprop('I_2-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==4)
            mi_setblockprop('I_2+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==5)
            mi_setblockprop('I_3-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==6)
            mi_setblockprop('I_3+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==7)
            mi_setblockprop('I_4-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==8)
            mi_setblockprop('I_4+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==9)
            mi_setblockprop('I_5-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==10)
            mi_setblockprop('I_5+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==11)
            mi_setblockprop('I_6-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==12)
            mi_setblockprop('I_6+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==13)
            mi_setblockprop('I_7-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==14)
            mi_setblockprop('I_7+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==15)
            mi_setblockprop('I_8-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==16)
            mi_setblockprop('I_8+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==17)
            mi_setblockprop('I_9-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==18)
            mi_setblockprop('I_9+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==19)
            mi_setblockprop('I_10-', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        elseif (v==20)
            mi_setblockprop('I_10+', 1, 0, '<None>', 0, 6, 0);
            mi_setgroup(6);
            mi_clearselected();
        end
    end
    mi_addnode(0, D_ro1*0.5);
    mi_addnode(0, D_ri2*0.5);
    mi_addnode((D_ri2*0.5)*cos(-pi/(pole_number/2)*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/(pole_number/2)*a_ri+pi/2));
    mi_addarc((D_ri2*0.5)*cos(-pi/(pole_number/2)*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/(pole_number/2)*a_ri+pi/2),0, D_ri2*0.5,180/(pole_number/2)*a_ri,5)
    mi_addnode((D_ri1*0.5)*cos(-pi/(pole_number/2)*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/(pole_number/2)*a_ri+pi/2));
    mi_addsegment((D_ri1*0.5)*cos(-pi/(pole_number/2)*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/(pole_number/2)*a_ri+pi/2),(D_ri2*0.5)*cos(-pi/(pole_number/2)*a_ri+pi/2), (D_ri2*0.5)*sin(pi/(pole_number/2)*a_ri+pi/2))
    mi_addnode((D_ri1*0.5)*cos(pi/2-pi/(pole_number/2)), (D_ri1*0.5)*sin(pi/2-pi/(pole_number/2)));
    
    mi_addarc((D_ri1*0.5)*cos(pi/2-pi/(pole_number/2)), (D_ri1*0.5)*sin(pi/2-pi/(pole_number/2)),(D_ri1*0.5)*cos(-pi/(pole_number/2)*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/(pole_number/2)*a_ri+pi/2),(pi/(pole_number/2))*(1-a_ri)*180/pi,5)
    mi_addnode((D_ro2*0.5)*cos(pi/2-pi/(pole_number/2)), (D_ro2*0.5)*sin(pi/2-pi/(pole_number/2)));
    mi_addarc((D_ro2*0.5)*cos(pi/2-pi/(pole_number/2)), (D_ro2*0.5)*sin(pi/2-pi/(pole_number/2)),0, D_ro1*0.5,a_arc,5)
    
    mi_selectcircle(0,0,(D_rotor_outer+airgap)*0.5,4);
    mi_mirror2(0,0,0,10,4);
    mi_selectcircle(0,0,(D_rotor_outer+airgap)*0.5,4);
    mi_copyrotate2(0,0,360/(pole_number/2),(pole_number/2),4);
end

if mode==2
    x1=0;     y1=0;
    k=D_stator_inner*0.5;
    mi_addnode(x1+k,y1);
    mi_addnode(x1-k,y1);
    mi_addarc(x1+k,y1,x1-k,y1,180,5);
    mi_addarc(x1-k,y1,x1+k,y1,180,5);
    mi_clearselected();
    
    %magnet
    mi_addnode(D_rotor_inner/2*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),D_rotor_inner/2*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)));
    mi_addnode(D_rotor_outer/2*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)));
    mi_addsegment(D_rotor_inner/2*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),D_rotor_inner/2*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)));
    
    mi_addnode(-D_rotor_inner/2*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),D_rotor_inner/2*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)));
    mi_addnode(-D_rotor_outer/2*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)));
    mi_addsegment(-D_rotor_inner/2*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),D_rotor_inner/2*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),-D_rotor_outer/2*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5)));
    
    a1=(D_rotor_outer/2-inset_thickness)*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    a2=(D_rotor_outer/2-inset_thickness)*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    b1=(D_rotor_inner/2)*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    b2=(D_rotor_inner/2)*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    a3=-(D_rotor_outer/2-inset_thickness)*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    a4=(D_rotor_outer/2-inset_thickness)*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    b3=-(D_rotor_inner/2)*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    b4=(D_rotor_inner/2)*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    mi_addnode(a1,a2);
    mi_addsegment(a1,a2,b1,b2)
    mi_addnode(a3,a4);
    mi_addsegment(a3,a4,b3,b4)
    mi_addarc(a3,a4,a1,a2,(1-pole_arc_ratio)*360/pole_number,5)
    
    c1=(D_rotor_outer/2)*cos((pi/2+2*pi/pole_number*(1+pole_arc_ratio)*0.5));
    c2=(D_rotor_outer/2)*sin((pi/2+2*pi/pole_number*(1+pole_arc_ratio)*0.5));
    c3=(D_rotor_outer/2)*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    c4=(D_rotor_outer/2)*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    mi_addnode(c1,c2);
    % mi_addnode(a3,a4);
    mi_addarc(c3,c4,c1,c2,(pole_arc_ratio*360/pole_number),5)
    
    d1=D_rotor_inner/2*cos((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    d2=D_rotor_inner/2*sin((pi/2+2*pi/pole_number*(1-pole_arc_ratio)*0.5));
    d3=(D_rotor_inner/2)*cos((pi/2+2*pi/pole_number*(1+pole_arc_ratio)*0.5));
    d4=(D_rotor_inner/2)*sin((pi/2+2*pi/pole_number*(1+pole_arc_ratio)*0.5));
    mi_addnode(d3,d4);
    mi_addarc(d1,d2,d3,d4,(pole_arc_ratio*360/pole_number),5)
    
    mi_selectcircle(0,0,(D_rotor_outer+airgap)*0.5,4);
    mi_copyrotate2(0,0,360/pole_number,pole_number,4);
    for z=1:(pole_number/2)
        mi_clearselected();
        mi_addblocklabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
        mi_selectlabel(cos((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
        mi_setblockprop('NdFeB',1,0,'None',90+180/pole_number+(z-1)*4*180/pole_number,9,1);
        mi_clearselected();
        mi_addblocklabel(cos((pi/2-pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2-pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
        mi_selectlabel(cos((pi/2-pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2-pi/pole_number+(z-1)*4*pi/pole_number))*(D_rotor_inner+m_thickness)*0.5);
        mi_setblockprop('NdFeB',1,0,'None',-90-180/pole_number+(z-1)*4*180/pole_number,9,1);
    end
    
    mi_addnode(0, D_ro1*0.5);
    mi_addnode(0, D_ri2*0.5);
    mi_addnode((D_ri2*0.5)*cos(-pi/(pole_number)*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/(pole_number)*a_ri+pi/2));
    mi_addarc((D_ri2*0.5)*cos(-pi/(pole_number)*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/(pole_number)*a_ri+pi/2),0, D_ri2*0.5,360/(pole_number)*a_ri,5)
    mi_addnode((D_ri1*0.5)*cos(-pi/(pole_number)*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/(pole_number)*a_ri+pi/2));
    mi_addsegment((D_ri1*0.5)*cos(-pi/(pole_number)*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/(pole_number)*a_ri+pi/2),(D_ri2*0.5)*cos(-pi/(pole_number)*a_ri+pi/2), (D_ri2*0.5)*sin(pi/(pole_number)*a_ri+pi/2))
    mi_addnode((D_ri1*0.5)*cos(pi/2-pi/(pole_number)), (D_ri1*0.5)*sin(pi/2-pi/(pole_number)));
    mi_addarc((D_ri1*0.5)*cos(pi/2-pi/(pole_number)), (D_ri1*0.5)*sin(pi/2-pi/(pole_number)),(D_ri1*0.5)*cos(-pi/(pole_number)*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/(pole_number)*a_ri+pi/2),(pi/(pole_number))*(1-a_ri)*180/pi,5)
    
    mi_selectcircle(0,0,(D_ri2+airgap)*0.5,4);
    mi_mirror2(0,0,0,10,4);
    mi_selectcircle(0,0,(D_ri2+airgap)*0.5,4);
    mi_copyrotate2(0,0,360/(pole_number),(pole_number),4);
end

if mode==3
    x1=0;     y1=0;
    k=D_stator_inner*0.5;
    mi_addnode(x1+k,y1);
    mi_addnode(x1-k,y1);
    mi_addarc(x1+k,y1,x1-k,y1,180,5);
    mi_addarc(x1-k,y1,x1+k,y1,180,5);
    mi_clearselected();
    
    %magnet
    mi_addnode(D_rotor_inner/2*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),D_rotor_inner/2*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)));
    mi_addnode(D_rotor_outer/2*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)));
    mi_addsegment(D_rotor_inner/2*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),D_rotor_inner/2*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)));
    
    mi_addnode(-D_rotor_inner/2*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),D_rotor_inner/2*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)));
    mi_addnode(-D_rotor_outer/2*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)));
    mi_addsegment(-D_rotor_inner/2*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),D_rotor_inner/2*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),-D_rotor_outer/2*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)),D_rotor_outer/2*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5)));
    
    a1=(D_rotor_outer/2-inset_thickness)*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    a2=(D_rotor_outer/2-inset_thickness)*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    b1=(D_rotor_inner/2)*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    b2=(D_rotor_inner/2)*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    a3=-(D_rotor_outer/2-inset_thickness)*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    a4=(D_rotor_outer/2-inset_thickness)*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    b3=-(D_rotor_inner/2)*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    b4=(D_rotor_inner/2)*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    mi_addnode(a1,a2);
    mi_addsegment(a1,a2,b1,b2)
    mi_addnode(a3,a4);
    mi_addsegment(a3,a4,b3,b4)
    mi_addarc(a3,a4,a1,a2,(1-pole_arc_ratio)*360/pole_pair,5)
    
    c1=(D_rotor_outer/2)*cos((pi/2+2*pi/pole_pair*(1+pole_arc_ratio)*0.5));
    c2=(D_rotor_outer/2)*sin((pi/2+2*pi/pole_pair*(1+pole_arc_ratio)*0.5));
    c3=(D_rotor_outer/2)*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    c4=(D_rotor_outer/2)*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    mi_addnode(c1,c2);
    % mi_addnode(a3,a4);
    mi_addarc(c3,c4,c1,c2,(pole_arc_ratio*360/pole_pair),5)
    
    d1=D_rotor_inner/2*cos((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    d2=D_rotor_inner/2*sin((pi/2+2*pi/pole_pair*(1-pole_arc_ratio)*0.5));
    d3=(D_rotor_inner/2)*cos((pi/2+2*pi/pole_pair*(1+pole_arc_ratio)*0.5));
    d4=(D_rotor_inner/2)*sin((pi/2+2*pi/pole_pair*(1+pole_arc_ratio)*0.5));
    mi_addnode(d3,d4);
    mi_addarc(d1,d2,d3,d4,(pole_arc_ratio*360/pole_pair),5)
    
    mi_selectcircle(0,0,(D_rotor_outer+airgap)*0.5,4);
    mi_copyrotate2(0,0,360/pole_pair,pole_pair,4);
    for z=1:(pole_number)
        mi_clearselected();
        mi_addblocklabel(cos((pi/2+pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_rotor_inner+m_thickness)*0.5);
        mi_selectlabel(cos((pi/2+pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2+pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_rotor_inner+m_thickness)*0.5);
        mi_setblockprop('NdFeB',1,0,'None',90+180/pole_pair+(z-1)*4*180/pole_pair,9,1);
        
        mi_clearselected();
        mi_addblocklabel(cos((pi/2-pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2-pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_rotor_inner+m_thickness)*0.5);
        mi_selectlabel(cos((pi/2-pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_rotor_inner+m_thickness)*0.5,sin((pi/2-pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_rotor_inner+m_thickness)*0.5);
        mi_setblockprop('NdFeB',1,0,'None',90-180/pole_pair+(z-1)*4*180/pole_pair,9,1);
    end
    mi_addnode(0, D_ro1*0.5);
    mi_addnode(0, D_ri2*0.5);
    mi_addnode((D_ri2*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/pole_pair*a_ri+pi/2));
    mi_addarc((D_ri2*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/pole_pair*a_ri+pi/2),0, D_ri2*0.5,180/pole_pair*a_ri,5)
    mi_addnode((D_ri1*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/pole_pair*a_ri+pi/2));
    mi_addsegment((D_ri1*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/pole_pair*a_ri+pi/2),(D_ri2*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri2*0.5)*sin(pi/pole_pair*a_ri+pi/2))
    mi_addnode((D_ri1*0.5)*cos(pi/2-pi/pole_pair), (D_ri1*0.5)*sin(pi/2-pi/pole_pair));
    mi_addarc((D_ri1*0.5)*cos(pi/2-pi/pole_pair), (D_ri1*0.5)*sin(pi/2-pi/pole_pair),(D_ri1*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/pole_pair*a_ri+pi/2),(pi/2-pi/pole_pair)*(1-a_ri)*180/pi,5)
    
    mi_selectcircle(0,0,(D_ri2+airgap)*0.5,4);
    mi_mirror2(0,0,0,10,4);
    mi_selectcircle(0,0,(D_ri2+airgap)*0.5,4);
    mi_copyrotate2(0,0,360/pole_pair,pole_pair,4);
    
end

if mode==4
    mi_addnode(0, D_ro1*0.5);
    mi_addnode((D_ro2*0.5)*cos(pi/2-pi/pole_number), (D_ro2*0.5)*sin(pi/2-pi/pole_number));
    mi_addarc((D_ro2*0.5)*cos(pi/2-pi/pole_number), (D_ro2*0.5)*sin(pi/2-pi/pole_number),0, D_ro1*0.5,a_arc,5)
    
    mi_selectcircle(0,0,(D_rotor_outer+airgap)*0.5,4);
    mi_mirror2(0,0,0,10,4);
    mi_selectcircle(0,0,(D_rotor_outer+airgap)*0.5,4);
    mi_copyrotate2(0,0,360/pole_number,pole_number,4);
    
    %magnet
    mi_addnode(-mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5));
    mi_addnode(-mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5));
    mi_addnode(+mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5));
    mi_addnode(+mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5));
    mi_addsegment(-mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5),-mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5));
    mi_addsegment(-mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5),+mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5))
    mi_addsegment(+mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5),+mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5))
    mi_addsegment(+mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5),-mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5))
    
    mi_selectrectangle(-mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5),mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5),4);
    mi_copyrotate2(0,0,360/pole_number,pole_number,4);
    for z=1:(pole_number/2)
        mi_clearselected();
        mi_addblocklabel(cos((pi/2+(z-1)*4*pi/pole_number))*(D_ro1*0.5-mag_dis),sin((pi/2+(z-1)*4*pi/pole_number))*(D_ro1*0.5-mag_dis));
        mi_selectlabel(cos((pi/2+(z-1)*4*pi/pole_number))*(D_ro1*0.5-mag_dis),sin((pi/2+(z-1)*4*pi/pole_number))*(D_ro1*0.5-mag_dis));
        mi_setblockprop('NdFeB',1,0,'None',90+(z-1)*4*180/pole_number,9,1);
        
        mi_clearselected();
        mi_addblocklabel(cos((pi/2+2*pi/pole_number+(z-1)*4*pi/pole_number))*(D_ro1*0.5-mag_dis),sin((pi/2+2*pi/pole_number+(z-1)*4*pi/pole_number))*(D_ro1*0.5-mag_dis));
        mi_selectlabel(cos((pi/2+2*pi/pole_number+(z-1)*4*pi/pole_number))*(D_ro1*0.5-mag_dis),sin((pi/2+2*pi/pole_number+(z-1)*4*pi/pole_number))*(D_ro1*0.5-mag_dis));
        mi_setblockprop('NdFeB',1,0,'None',-360/pole_number+(z-1)*4*180/pole_number,9,1);
    end
    
    x1=0;     y1=0;
    k=D_stator_inner*0.5;
    mi_addnode(x1+k,y1);
    mi_addnode(x1-k,y1);
    mi_addarc(x1+k,y1,x1-k,y1,180,5);
    mi_addarc(x1-k,y1,x1+k,y1,180,5);
    mi_clearselected();
    
    mi_addnode(0, D_ro1*0.5);
    mi_addnode(0, D_ri2*0.5);
    mi_addnode((D_ri2*0.5)*cos(-pi/pole_number*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/pole_number*a_ri+pi/2));
    mi_addarc((D_ri2*0.5)*cos(-pi/pole_number*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/pole_number*a_ri+pi/2),0, D_ri2*0.5,180/pole_number*a_ri,5)
    mi_addnode((D_ri1*0.5)*cos(-pi/pole_number*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/pole_number*a_ri+pi/2));
    mi_addsegment((D_ri1*0.5)*cos(-pi/pole_number*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/pole_number*a_ri+pi/2),(D_ri2*0.5)*cos(-pi/pole_number*a_ri+pi/2), (D_ri2*0.5)*sin(pi/pole_number*a_ri+pi/2))
    mi_addnode((D_ri1*0.5)*cos(pi/2-pi/pole_number), (D_ri1*0.5)*sin(pi/2-pi/pole_number));
    mi_addarc((D_ri1*0.5)*cos(pi/2-pi/pole_number), (D_ri1*0.5)*sin(pi/2-pi/pole_number),(D_ri1*0.5)*cos(-pi/pole_number*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/pole_number*a_ri+pi/2),(pi/2-pi/pole_number)*(1-a_ri)*180/pi,5)
    
    mi_selectcircle(0,0,(D_ri2+airgap)*0.5,4);
    mi_mirror2(0,0,0,10,4);
    mi_selectcircle(0,0,(D_ri2+airgap)*0.5,4);
    mi_copyrotate2(0,0,360/pole_number,pole_number,4);
end


if mode==5
    mi_addnode(0, D_ro1*0.5);
    mi_addnode((D_ro2*0.5)*cos(pi/2-pi/pole_pair), (D_ro2*0.5)*sin(pi/2-pi/pole_pair));
    mi_addarc((D_ro2*0.5)*cos(pi/2-pi/pole_pair), (D_ro2*0.5)*sin(pi/2-pi/pole_pair),0, D_ro1*0.5,a_arc,5)
    
    mi_selectcircle(0,0,(D_rotor_outer+airgap)*0.5,4);
    mi_mirror2(0,0,0,10,4);
    mi_selectcircle(0,0,(D_rotor_outer+airgap)*0.5,4);
    mi_copyrotate2(0,0,360/pole_pair,pole_pair,4);
    
    %magnet
    mi_addnode(-mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5));
    mi_addnode(-mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5));
    mi_addnode(+mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5));
    mi_addnode(+mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5));
    mi_addsegment(-mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5),-mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5));
    mi_addsegment(-mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5),+mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5))
    mi_addsegment(+mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5),+mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5))
    mi_addsegment(+mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5),-mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5))
    
    mi_selectrectangle(-mag_width/2,D_ro1*0.5-(mag_dis+mag_th*0.5),mag_width/2,D_ro1*0.5-(mag_dis-mag_th*0.5),4);
    mi_copyrotate2(0,0,360/pole_pair,pole_pair,4);
    for z=1:(pole_pair/2)
        mi_clearselected();
        mi_addblocklabel(cos((pi/2+(z-1)*4*pi/pole_pair))*(D_ro1*0.5-mag_dis),sin((pi/2+(z-1)*4*pi/pole_pair))*(D_ro1*0.5-mag_dis));
        mi_selectlabel(cos((pi/2+(z-1)*4*pi/pole_pair))*(D_ro1*0.5-mag_dis),sin((pi/2+(z-1)*4*pi/pole_pair))*(D_ro1*0.5-mag_dis));
        mi_setblockprop('NdFeB',1,0,'None',90+(z-1)*4*180/pole_pair,9,1);
        
        mi_clearselected();
        mi_addblocklabel(cos((pi/2+2*pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_ro1*0.5-mag_dis),sin((pi/2+2*pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_ro1*0.5-mag_dis));
        mi_selectlabel(cos((pi/2+2*pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_ro1*0.5-mag_dis),sin((pi/2+2*pi/pole_pair+(z-1)*4*pi/pole_pair))*(D_ro1*0.5-mag_dis));
        mi_setblockprop('NdFeB',1,0,'None',180+90-360/pole_pair+(z-1)*4*180/pole_pair,9,1);
    end
    
    x1=0;     y1=0;
    k=D_stator_inner*0.5;
    mi_addnode(x1+k,y1);
    mi_addnode(x1-k,y1);
    mi_addarc(x1+k,y1,x1-k,y1,180,5);
    mi_addarc(x1-k,y1,x1+k,y1,180,5);
    mi_clearselected();
    
    mi_addnode(0, D_ro1*0.5);
    mi_addnode(0, D_ri2*0.5);
    mi_addnode((D_ri2*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/pole_pair*a_ri+pi/2));
    mi_addarc((D_ri2*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri2*0.5)*sin(-pi/pole_pair*a_ri+pi/2),0, D_ri2*0.5,180/pole_pair*a_ri,5)
    mi_addnode((D_ri1*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/pole_pair*a_ri+pi/2));
    mi_addsegment((D_ri1*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/pole_pair*a_ri+pi/2),(D_ri2*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri2*0.5)*sin(pi/pole_pair*a_ri+pi/2))
    mi_addnode((D_ri1*0.5)*cos(pi/2-pi/pole_pair), (D_ri1*0.5)*sin(pi/2-pi/pole_pair));
    mi_addarc((D_ri1*0.5)*cos(pi/2-pi/pole_pair), (D_ri1*0.5)*sin(pi/2-pi/pole_pair),(D_ri1*0.5)*cos(-pi/pole_pair*a_ri+pi/2), (D_ri1*0.5)*sin(-pi/pole_pair*a_ri+pi/2),(pi/2-pi/pole_pair)*(1-a_ri)*180/pi,5)
    
    mi_selectcircle(0,0,(D_ri2+airgap)*0.5,4);
    mi_mirror2(0,0,0,10,4);
    mi_selectcircle(0,0,(D_ri2+airgap)*0.5,4);
    mi_copyrotate2(0,0,360/pole_pair,pole_pair,4);
end

if mode==6
    length_square=30
    x_1=-length_square
    x_2=length_square
    y_1=-length_square
    y_2=length_square
    %generate dots
mi_addnode(x_1,y_1);
mi_addnode(x_1,y_2);
mi_addnode(x_2,y_1);
mi_addnode(x_2,y_2);

%draw lines
mi_addsegment(x_1,y_1,x_1,y_2);
mi_addsegment(x_1,y_2,x_2,y_2);
mi_addsegment(x_2,y_2,x_2,y_1);
mi_addsegment(x_2,y_1,x_1,y_1);
    mi_addblocklabel(x_1+1,y_1+1);
    mi_selectlabel(x_1+1,y_1+1);
    mi_setblockprop('Air', 0, 1, 'None', 0, 0, 0);
    
   %Origin
    x_0 = 0;
    y_0 = 0; 
    %Inner part of the rotor

    % mi_addarc(x1,y1,x2,y2,angle,maxseg): Add a new arc segment from the nearest node to (x1,y1) to
    % the nearest node to (x2,y2) with angle ‘angle’ divided into ‘maxseg’ segments.

    mi_addnode(x_0+Rir,y_0);
    mi_addnode(x_0-Rir,y_0);
    mi_addarc(x_0+Rir,y_0,x_0-Rir,y_0,180,5); %Semicircle from 0 deg. to 180 deg.
    mi_addarc(x_0-Rir,y_0,x_0+Rir,y_0,180,5); %Semicircle from 180 deg. to 360 deg.

    % mi_selectcircle(x,y,R,editmode) selects objects within a circle of radius R centered at (x,y). 
    mi_selectcircle(x_0,y_0,Rir,4);
    mi_clearselected();
    mi_addblocklabel(x_0,y_0);
    mi_selectlabel(x_0,y_0);
    mi_setblockprop('Air', 0, 1, 'None', 0, 0, 0);
    
    %Make the  rotor

    deg_hexagon=360/pole_number;
    h=Ror/cos(deg_hexagon/2*2*pi/360); %Side of the hexagon
    x=Ror*tan(deg_hexagon/2*2*pi/360);
    % mi_copyrotate2(bx, by, angle, copies, editaction )
    % – bx, by – base point for rotation
    % – angle – angle by which the selected objects are incrementally shifted to make each copy(deg)
    % – copies – number of copies to be produced from the selected objects.
    % – editaction 0 –nodes, 1 – lines (segments), 2 –block labels, 3 – arc segments, 4- group


    mi_clearselected();
    mi_addblocklabel(3/4*Ror,y_0);
    mi_selectlabel(3/4*Ror,y_0);
    mi_setblockprop('M-19 Steel', 1, 0, 'None', 0, 1, 0);
    
    % Magnets (They will be located between 1/3 and 2/3 of the side of the
    % hexagon)

    mi_addnode(x/2,Ror);
    mi_addnode(-x/2,Ror);
    mi_addsegment(x/2,Ror,-x/2,Ror);
    mi_addnode(x/2,Ror-m_thickness);
    mi_addnode(-x/2,Ror-m_thickness);
    mi_addsegment(x/2,Ror-m_thickness,-x/2,Ror-m_thickness);
    mi_addsegment(-x/2,Ror,-x/2,Ror-1);
    mi_addsegment(x/2,Ror,x/2,Ror-1);

    mi_selectrectangle(x/2,Ror,-x/2,Ror-1,4);
    mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,4);
    
    for z=1:2:pole_number
        mi_clearselected();
        mi_addblocklabel((Ror-0.5*m_thickness)*cos((30+(z-1)*360/pole_number)*2*pi/360),(Ror-0.5*m_thickness)*sin((30+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel((Ror-0.5*m_thickness)*cos((30+(z-1)*360/pole_number)*2*pi/360),(Ror-0.5*m_thickness)*sin((30+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('NdFeB',1,0,'None',30+(z-1)*360/pole_number,2,1);
    end


    for z=2:2:pole_number
        mi_clearselected();
        mi_addblocklabel((Ror-0.5*m_thickness)*cos((30+(z-1)*360/pole_number)*2*pi/360),(Ror-0.5*m_thickness)*sin((30+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel((Ror-0.5*m_thickness)*cos((30+(z-1)*360/pole_number)*2*pi/360),(Ror-0.5*m_thickness)*sin((30+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('NdFeB',1,0,'None',(30+(z-1)*360/pole_number-180),2,1);
    end
    
%     mi_addnode(3/4*x,Ror);
%     mi_addnode(-3/4*x,Ror);
%     mi_addarc(3/4*x,Ror,-3/4*x,Ror,deg_shape,5);
%     mi_selectarcsegment(3/4*x,Ror);
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);

    % Make an input saliency

    mi_addnode(3/4*x,Ror+0.5);
    mi_addnode(-3/4*x,Ror+0.5);
    mi_addarc(-3/4*x,Ror+0.5,3/4*x,Ror+0.5,deg_shape,5);
    mi_selectarcsegment(3/4*x,Ror+1);
    mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);

% 
%     mi_addnode(3/4*x,Ror+0.5);
%     mi_addnode(-3/4*x,Ror+0.5);
%     mi_addarc(3/4*x,Ror+0.5,-3/4*x,Ror+0.5,deg_shape,5);
%     mi_selectarcsegment(3/4*x,Ror+1);
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);


    %Make a circle
    
    % dist_mag=1.2;
    % mi_addnode(x_0+Ror+dist_mag,y_0);
    % mi_addnode(x_0-Ror-dist_mag,y_0);
    % mi_addarc(x_0+Ror+dist_mag,y_0,x_0-Ror-dist_mag,y_0,180,5); %Semicircle from 0 deg. to 180 deg.
    % mi_addarc(x_0-Ror-dist_mag,y_0,x_0+Ror+dist_mag,y_0,180,5); %Semicircle from 0 deg. to 180 deg.

    % mi_addarc(x_0-Ror-5,y_0,x_0-Ror-5,y_0,-180,5); %Semicircle from 180 deg. to 360 deg.

    
    %Flux barrier
    
    
    %Segments of the flux barrier
    mi_addnode(Ror*1.05*cos((deg_hexagon+0.5)*2*pi/360),Ror*1.05*sin((deg_hexagon+0.5)*2*pi/360));
    mi_addnode((Ror*1.05-m_thickness)*cos((deg_hexagon+0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((deg_hexagon+0.5)*2*pi/360));

    mi_addsegment(Ror*1.05*cos((deg_hexagon+0.5)*2*pi/360),Ror*1.05*sin((deg_hexagon+0.5)*2*pi/360),(Ror*1.05-m_thickness)*cos((deg_hexagon+0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((deg_hexagon+0.5)*2*pi/360));
    mi_selectsegment(Ror*cos((deg_hexagon+0.5)*2*pi/360),Ror*sin((deg_hexagon+0.5)*2*pi/360));
    mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,1);

    mi_addnode(Ror*1.05*cos((2*deg_hexagon-0.5)*2*pi/360),Ror*1.05*sin((2*deg_hexagon-0.5)*2*pi/360));
    mi_addnode((Ror*1.05-m_thickness)*cos((2*deg_hexagon-0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((2*deg_hexagon-0.5)*2*pi/360));

    mi_addsegment(Ror*1.05*cos((2*deg_hexagon-0.5)*2*pi/360),Ror*1.05*sin((2*deg_hexagon-0.5)*2*pi/360),(Ror*1.05-m_thickness)*cos((2*deg_hexagon-0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((2*deg_hexagon-0.5)*2*pi/360));
    mi_selectsegment(Ror*cos((2*deg_hexagon-0.5)*2*pi/360),Ror*sin((2*deg_hexagon-0.5)*2*pi/360));
    mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,1);
    
    
%     % % Flux barrier with input arc shape
%     mi_addarc(x/2,Ror,Ror*1.05*cos((deg_hexagon+0.5)*2*pi/360),Ror*1.05*sin((deg_hexagon+0.5)*2*pi/360),deg_barrier,5);
%     mi_addarc(x/2,Ror-mag_th,(Ror*1.05-m_thickness)*cos((deg_hexagon+0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((deg_hexagon+0.5)*2*pi/360),deg_barrier,5);
%     mi_selectarcsegment(Ror*1.05*cos((deg_hexagon+0.5)*2*pi/360),Ror*1.05*sin((deg_hexagon+0.5)*2*pi/360));
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);
%     mi_selectarcsegment((Ror*1.05-m_thickness)*cos((deg_hexagon+0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((deg_hexagon+0.5)*2*pi/360));
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);
%     
%     mi_addarc(Ror*1.05*cos((2*deg_hexagon-0.5)*2*pi/360),Ror*1.05*sin((2*deg_hexagon-0.5)*2*pi/360),-x/2,Ror,deg_barrier,5);
%     mi_addarc((Ror*1.05-m_thickness)*cos((2*deg_hexagon-0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((2*deg_hexagon-0.5)*2*pi/360),-x/2,Ror-mag_th,deg_barrier,5);
%     mi_selectarcsegment(Ror*1.05*cos((2*deg_hexagon-0.5)*2*pi/360),Ror*1.05*sin((2*deg_hexagon-0.5)*2*pi/360));
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);
%     mi_selectarcsegment((Ror*1.05-m_thickness)*cos((2*deg_hexagon-0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((2*deg_hexagon-0.5)*2*pi/360));
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);

    % % Flux barrier with output arc shape
    mi_addarc(Ror*1.05*cos((deg_hexagon+0.5)*2*pi/360),Ror*1.05*sin((deg_hexagon+0.5)*2*pi/360),x/2,Ror,deg_barrier,5);
    mi_addarc((Ror*1.05-m_thickness)*cos((deg_hexagon+0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((deg_hexagon+0.5)*2*pi/360),x/2,Ror-m_thickness,deg_barrier,5);
    mi_selectarcsegment(Ror*1.05*cos((deg_hexagon+0.5)*2*pi/360),Ror*1.05*sin((deg_hexagon+0.5)*2*pi/360));
    mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);
    mi_selectarcsegment((Ror*1.05-m_thickness)*cos((deg_hexagon+0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((deg_hexagon+0.5)*2*pi/360));
    mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);
    
    mi_addarc(-x/2,Ror,Ror*1.05*cos((2*deg_hexagon-3)*2*pi/360),Ror*1.05*sin((2*deg_hexagon-3)*2*pi/360),deg_barrier,5);
    mi_addarc(-x/2,Ror-mag_th,(Ror*1.05-m_thickness)*cos((2*deg_hexagon-3)*2*pi/360),(Ror*1.05-m_thickness)*sin((2*deg_hexagon-3)*2*pi/360),deg_barrier,5);
    mi_selectarcsegment(Ror*1.05*cos((2*deg_hexagon-3)*2*pi/360),Ror*1.05*sin((2*deg_hexagon-3)*2*pi/360));
    mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);
    mi_selectarcsegment((Ror*1.05-m_thickness)*cos((2*deg_hexagon-3)*2*pi/360),(Ror*1.05-m_thickness)*sin((2*deg_hexagon-3)*2*pi/360));
    mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);

%     % % Flux barrier with trapezoidal shape
%     mi_addsegment(Ror*1.05*cos((deg_hexagon+0.5)*2*pi/360),Ror*1.05*sin((deg_hexagon+0.5)*2*pi/360),x/2,Ror);
%     mi_addsegment((Ror*1.05-m_thickness)*cos((deg_hexagon+0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((deg_hexagon+0.5)*2*pi/360),x/2,(Ror-mag_th));
%     mi_selectsegment(Ror*1.05*cos((deg_hexagon+2)*2*pi/360),Ror*1.05*sin((deg_hexagon+2)*2*pi/360));
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,1);
%     mi_selectsegment((Ror*1.05-m_thickness)*cos((deg_hexagon+2)*2*pi/360),(Ror*1.05-m_thickness)*sin((deg_hexagon+2)*2*pi/360));
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,1);
% 
%     mi_addsegment(Ror*1.05*cos((2*deg_hexagon-0.5)*2*pi/360),Ror*1.05*sin((2*deg_hexagon-0.5)*2*pi/360),-x/2,Ror);
%     mi_addsegment((Ror*1.05-m_thickness)*cos((2*deg_hexagon-0.5)*2*pi/360),(Ror*1.05-m_thickness)*sin((2*deg_hexagon-0.5)*2*pi/360),-x/2,Ror-mag_th);
%     mi_selectsegment(Ror*1.05*cos((2*deg_hexagon-2)*2*pi/360),Ror*1.05*sin((2*deg_hexagon-2)*2*pi/360));
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,1);
%     mi_selectsegment((Ror*1.05-m_thickness)*cos((2*deg_hexagon-2)*2*pi/360),(Ror*1.05-m_thickness)*sin((2*deg_hexagon-2)*2*pi/360));
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,1);

    for z=1:pole_number
        mi_clearselected();
        mi_addblocklabel((Ror-0.1*m_thickness)*cos((47.5+(z-1)*360/pole_number)*2*pi/360),(Ror-0.1*m_thickness)*sin((47.5+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel((Ror-0.1*m_thickness)*cos((47.5+(z-1)*360/pole_number)*2*pi/360),(Ror-0.1*m_thickness)*sin((47.5+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('Air', 1, 0, 'None', 0, 3, 0);
    end


    for z=1:pole_number
        mi_clearselected();
        mi_addblocklabel((Ror-0.1*m_thickness)*cos((12.5+(z-1)*360/pole_number)*2*pi/360),(Ror-0.1*m_thickness)*sin((12.5+(z-1)*360/pole_number)*2*pi/360));
        mi_selectlabel((Ror-0.1*m_thickness)*cos((12.5+(z-1)*360/pole_number)*2*pi/360),(Ror-0.1*m_thickness)*sin((12.5+(z-1)*360/pole_number)*2*pi/360));
        mi_setblockprop('Air', 1, 0, 'None', 0, 3, 0);
    end

    % Make the rotor with a round shape

    %Interior corner
%     mi_addarc(3/4*x,Ror,Ror*cos(52.5*2*pi/360),Ror*sin(52.5*2*pi/360),deg_round,5);
%     mi_selectarcsegment(Ror*1.3*cos(60*2*pi/360),Ror*1.3*sin(60*2*pi/360));

    mi_addarc(3/4*x,Ror+0.5,(Ror+1)*cos(52.5*2*pi/360),(Ror+1)*sin(52.5*2*pi/360),deg_round,5);
    mi_selectarcsegment((Ror+1)*1.3*cos(60*2*pi/360),(Ror+1)*1.3*sin(60*2*pi/360));
    mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);

    %External corner
%     mi_addarc(Ror*cos(52.5*2*pi/360),Ror*sin(52.5*2*pi/360),3/4*x,Ror,deg_round,5);
%     mi_selectarcsegment(Ror*1.3*cos(60*2*pi/360),Ror*1.3*sin(60*2*pi/360));

%     mi_addarc((Ror+0.5)*cos(52.5*2*pi/360),(Ror+0.5)*sin(52.5*2*pi/360),3/4*x,Ror+0.5,deg_round,5);
%     mi_selectarcsegment((Ror+0.5)*1.3*cos(60*2*pi/360),(Ror+0.5)*1.3*sin(60*2*pi/360));
%     mi_copyrotate2(x_0,y_0,360/pole_number,pole_number,3);

end

if mode~=6
    x1=0;y1=0;
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

    %Add label
    mi_clearselected();
    mi_addblocklabel(0,D_stator_outer*0.5-1);
    mi_selectlabel(0,D_stator_outer*0.5-1);

    mi_setblockprop('M-19 Steel', 0, 1, 'None', 0, 1, 0);

    mi_clearselected();
    mi_addblocklabel(0,D_ro1*0.5-0.1);
    mi_selectlabel(0,D_ro1*0.5-0.1);
    mi_setblockprop('M-19 Steel', 1, 0, '<None>', 0, 2, 0);

    mi_clearselected();
    mi_addblocklabel(0,D_rotor_outer*0.5+airgap*0.5);
    mi_selectlabel(0,D_rotor_outer*0.5+airgap*0.5);
    mi_setblockprop('Air', 1, 0, '<None>', 0, 0, 0);

    mi_clearselected();
    mi_addblocklabel(0,0);
    mi_selectlabel(0,0);

    mi_setblockprop('Air', 0, 1, 'None', 0, 10, 0);
end
%
mi_clearselected();
mi_refreshview();
%
if mode~=6
    mi_selectcircle(0,0,(D_stator_outer*0.5+airgap*0.5),4);
    mi_moverotate(0,0,-180);
    mi_zoomnatural();
else
    mi_selectgroup(20);
    mi_moverotate(0,0,-180);
    mi_zoomnatural();   
end
% mi_createmesh();

% %% Create a boundary
% 
% 
% length=21.4; %Input corner
% 
% 
% mi_addnode(length,length);
% mi_addnode(length,-length);
% mi_addnode(-length,length);
% mi_addnode(-length,-length);
% 
% mi_addsegment(length,length,length,-length);
% mi_addsegment(length,-length,-length,-length);
% mi_addsegment(-length,-length,-length,length);
% mi_addsegment(length,length,-length,length);
% mi_clearselected();
% mi_addblocklabel(length/2, length/2);
% mi_selectlabel(length/2, length/2);
% mi_setblockprop('Air', 1, 0, '<None>', 0, 4, 0);
% 
% 
% mi_clearselected();
% mi_refreshview();
% 
% 
% mi_selectgroup(20);
% 
% mi_moverotate(0,0,-180);
% mi_zoomnatural();

%% %%%%%%%%%%% Post analysis
k=1;
for rad_n=0:2*pi/36:2*pi

xpoint=real((Ror+Position_Hall)*exp(j*(pi/2-rad_n/(pole_number/2))));
ypoint=imag((Ror+Position_Hall)*exp(j*(pi/2-rad_n/(pole_number/2))));
pv = mo_getpointvalues(xpoint,ypoint);
% B_cos(k)=imag((pv(2)+j*pv(3))*exp(j*rad_n/(pole_number/2))) %In order to change the coordinates system. 
B_cos(k)=imag((pv(2)+j*pv(3))) %In order to change the coordinates system. 

k=k+1;
end
figure(556)
plot(B_cos)
%%

B_sin(k)=pv(2)+j*pv(3)

xpoint=real((Ror+Position_Hall)*exp(j*(pi/2-pi/pole_number)));
ypoint=imag((Ror+Position_Hall)*exp(j*(pi/2-pi/pole_number)));
pv = mo_getpointvalues(xpoint,ypoint);
B_cos(k)=((pv(2)+j*pv(3))*exp(j*(pi/pole_number))) %In order to change the coordinates system. 

      


%%
rotor_angle=0;
num_iter=36;
flux_cos_rot=[];flux_sin_rot=[];flux_tot_rot=[];

for k=1:(num_iter+1)
    
    %     J=source.J;
    J=2
    mi_modifymaterial('I_1+',4,J)
    mi_modifymaterial('I_1-',4,-J)
    mi_modifymaterial('I_2+',4,-J)
    mi_modifymaterial('I_2-',4,J)
    mi_modifymaterial('I_3+',4,J)
    mi_modifymaterial('I_3-',4,-J)
    mi_modifymaterial('I_4+',4,-J)
    mi_modifymaterial('I_4-',4,J)
    mi_modifymaterial('I_5+',4,J)
    mi_modifymaterial('I_5-',4,-J)
    mi_modifymaterial('I_6+',4,-J)
    mi_modifymaterial('I_6-',4,J)
    mi_modifymaterial('I_7+',4,J)
    mi_modifymaterial('I_7-',4,-J)
    mi_modifymaterial('I_8+',4,-J)
    mi_modifymaterial('I_8-',4,J)
    mi_modifymaterial('I_9+',4,J)
    mi_modifymaterial('I_9-',4,-J)
    mi_modifymaterial('I_10+',4,-J)
    mi_modifymaterial('I_10-',4,J)
    
    tic
    mi_analyze(1)
    mi_loadsolution()
    time.FEA_run(k)=round(toc)
    
    flux_sin=0;flux_cos=0;flux_tot=0;
    for v=1:10
        x1=(D_stator_inner+D_stator_outer)*0.25*cos((w_teeth/2)/((D_stator_inner+D_stator_outer)*0.25)*1.1+pi/2+(2*pi/slot_number)*(v-1));
        y1=(D_stator_inner+D_stator_outer)*0.25*sin((w_teeth/2)/((D_stator_inner+D_stator_outer)*0.25)*1.1+pi/2+(2*pi/slot_number)*(v-1));
        mo_addcontour(x1,y1)
        x2=(D_stator_inner+D_stator_outer)*0.25*cos(-(w_teeth/2)/((D_stator_inner+D_stator_outer)*0.25)*1.1+pi/2+(2*pi/slot_number)*(v-1));
        y2=(D_stator_inner+D_stator_outer)*0.25*sin(-(w_teeth/2)/((D_stator_inner+D_stator_outer)*0.25)*1.1+pi/2+(2*pi/slot_number)*(v-1));
        mo_addcontour(x2,y2)
        flux_temp=mo_lineintegral(0);
        
        if v==1
            flux_sin=flux_sin+flux_temp(1);
            flux_cos=flux_cos+flux_temp(1);
            flux_tot=flux_tot+flux_temp(1);
        elseif v==2
            flux_sin=flux_sin+flux_temp(1);
            flux_cos=flux_cos-flux_temp(1);
            flux_tot=flux_tot-flux_temp(1);
        elseif v==3
            flux_sin=flux_sin+flux_temp(1);
            flux_cos=flux_cos-flux_temp(1);
            flux_tot=flux_tot+flux_temp(1);
        elseif v==4
            flux_sin=flux_sin-flux_temp(1);
            flux_cos=flux_cos-flux_temp(1);
            flux_tot=flux_tot-flux_temp(1);
        elseif v==5
            flux_sin=flux_sin-flux_temp(1);
            flux_cos=flux_cos-flux_temp(1);
            flux_tot=flux_tot+flux_temp(1);
        elseif v==6
            flux_sin=flux_sin+flux_temp(1);
            flux_cos=flux_cos+flux_temp(1);
            flux_tot=flux_tot-flux_temp(1);
        elseif v==7
            flux_sin=flux_sin-flux_temp(1);
            flux_cos=flux_cos+flux_temp(1);
            flux_tot=flux_tot+flux_temp(1);
        elseif v==8
            flux_sin=flux_sin-flux_temp(1);
            flux_cos=flux_cos+flux_temp(1);
            flux_tot=flux_tot-flux_temp(1);
        elseif v==9
            flux_sin=flux_sin+flux_temp(1);
            flux_cos=flux_cos+flux_temp(1);
            flux_tot=flux_tot+flux_temp(1);
        elseif v==10
            flux_sin=flux_sin+flux_temp(1);
            flux_cos=flux_cos+flux_temp(1);
            flux_tot=flux_tot-flux_temp(1);
        end
  
        mo_clearcontour()
    end
    
    flux_cos_rot(k)=flux_cos*Num_turns;
    flux_sin_rot(k)=flux_sin*Num_turns;
    flux_tot_rot(k)=flux_tot*Num_turns;
    
    if mode==6
        xpoint=0;    ypoint=(Ror+Position_Hall);
        pv = mo_getpointvalues(xpoint,ypoint);
        B_sin(k)=pv(2)+j*pv(3)

        xpoint=real((Ror+Position_Hall)*exp(j*(pi/2-pi/pole_number)));
        ypoint=imag((Ror+Position_Hall)*exp(j*(pi/2-pi/pole_number)));
        pv = mo_getpointvalues(xpoint,ypoint);
        B_cos(k)=((pv(2)+j*pv(3))*exp(j*(pi/pole_number))) %In order to change the coordinates system. 

        
    else
        xpoint=0;    ypoint=(D_ro1+airgap)*0.5;
        pv = mo_getpointvalues(xpoint,ypoint)
        B_sin(k)=pv(2)+j*pv(3);
        xpoint=real((D_ro1+airgap)*0.5*exp(j*(pi/2-pi/pole_number)));
        ypoint=imag((D_ro1+airgap)*0.5*exp(j*(pi/2-pi/pole_number)));
        pv = mo_getpointvalues(xpoint,ypoint)
        B_cos(k)=((pv(2)+j*pv(3))*exp(j*(pi/pole_number)))
    end
        
    if mode==1
        mo_clearblock()
        mo_groupselectblock(6)
        coil_volume=mo_blockintegral(10)
        mo_clearblock()
        mo_groupselectblock(1)
        stator_volume=mo_blockintegral(10)
        mo_clearblock()
        mo_groupselectblock(2)
        rotor_volume=mo_blockintegral(10)
        mo_clearblock()
        mag_volume=0;
    elseif mode==6
        
        stator_volume=0;
        mo_clearblock()
    
        mo_groupselectblock(1)
        rotor_volume=mo_blockintegral(10)
        mo_clearblock()

        mo_groupselectblock(2)
        mag_volume=mo_blockintegral(10)
        mo_clearblock()

        coil_volume=0;

    else
        %         mo_clearblock()
        %         mo_groupselectblock(6)
        %         coil_volume=mo_blockintegral(10)
        mo_clearblock()
        mo_groupselectblock(1)
        stator_volume=mo_blockintegral(10)
        mo_clearblock()
        mo_groupselectblock(2)
        rotor_volume=mo_blockintegral(10)
        mo_clearblock()
        mo_groupselectblock(9)
        mag_volume=mo_blockintegral(10);
        mo_clearblock()
        coil_volume=0;
    end
   
    if mode==6
        mo_close()
        mi_selectcircle(0,0,(Ror+Position_Hall+4),4)
        mi_seteditmode('group')
        mi_moverotate(0,0,360/(pole_pair)/num_iter)
    else
        
        mo_close()
        mi_selectcircle(0,0,(D_rotor_outer*0.5+airgap*0.5),4)
        mi_seteditmode('group')
        mi_moverotate(0,0,360/(pole_pair)/num_iter)
    %     rotor_angle=rotor_angle-2*pi/num_iter;
    end
end
% HandleToFEMM=eval(join(['handle',num2str(nfeval)]))
closefemm;
Eval_value.time=time;
close all

B_cos_rot=imag(B_cos);
B_sin_rot=imag(B_sin);
elec_deg=0:10:360;
if mode==1
    [CosTHD,SinTHD,CosradfreqDomain,SinradfreqDomain,frequencyRange]=THD(flux_cos_rot,flux_sin_rot)
    figure(1)
    plot(elec_deg,flux_sin_rot)
    hold on
    plot(elec_deg,flux_cos_rot)
    plot(elec_deg,flux_tot_rot)
    grid on
    legend('Sin','Cos','Total')
    xlabel('[deg]')
    ylabel('\lambda [Vs]')
    figure(2)
    plot(elec_deg,atan2(flux_cos_rot,flux_sin_rot).*180/pi)
    xlabel('[deg]')
    ylabel('\theta_{est} [deg]')
    %     hold on
    %     plot(atan2(flux_sin_rot,flux_cos_rot).*180/pi)
    %         legend('Sin','Cos','Total')
    %     xlabel('[rad]')
    %     ylable('\labmda [Vs]')
else
    [CosTHD,SinTHD,CosradfreqDomain,SinradfreqDomain,frequencyRange]=THD((B_cos_rot),(B_sin_rot))
end
figure(3)
plot(elec_deg,(B_sin_rot))
hold on
plot(elec_deg,(B_cos_rot))
legend('Sin','Cos')
xlabel('[rad]')
ylabel('B [T]')

figure(4)
plot(elec_deg,atan2(B_cos_rot,B_sin_rot).*180/pi)
xlabel('[deg]')
ylabel('\theta_{est} [deg]')


Total_volume=rotor_volume+coil_volume+stator_volume+mag_volume;
Total_THD=CosTHD+SinTHD
figure(5)
stem(frequencyRange,abs(SinradfreqDomain))
hold on
stem(frequencyRange,abs(CosradfreqDomain))
xlabel('Harmonics')
ylabel('Magnitude')