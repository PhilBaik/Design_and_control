function [DesignsParams]= Geo_boundary_condition(mode)


if mode==1
    DesignsParams(1).variables(1).name = 'D_stator_outer';
    DesignsParams(1).variables(1).value = 36;
    DesignsParams(1).variables(1).max_value = 40;
    DesignsParams(1).variables(1).min_value = 34;
    
    DesignsParams(1).variables(2).name = 'w_teeth';
    DesignsParams(1).variables(2).value = 3;
    DesignsParams(1).variables(2).max_value = 5;
    DesignsParams(1).variables(2).min_value = 1;
    
    DesignsParams(1).variables(3).name = 'sue_1';
    DesignsParams(1).variables(3).value = 0.2;
    DesignsParams(1).variables(3).max_value = 1;
    DesignsParams(1).variables(3).min_value = 0.1;
    
    DesignsParams(1).variables(4).name = 'sue_2';
    DesignsParams(1).variables(4).value = 0.3;
    DesignsParams(1).variables(4).max_value = 1;
    DesignsParams(1).variables(4).min_value = 0.1;
    
    DesignsParams(1).variables(5).name = 'airgap';
    DesignsParams(1).variables(5).value = 0.5;
    DesignsParams(1).variables(5).max_value = 1.5;
    DesignsParams(1).variables(5).min_value = 0.3;
    
    DesignsParams(1).variables(6).name = 'th_core';
    DesignsParams(1).variables(6).value = 3;
    DesignsParams(1).variables(6).max_value = 5;
    DesignsParams(1).variables(6).min_value = 2;
    
    DesignsParams(1).variables(7).name = 'slot_ratio';
    DesignsParams(1).variables(7).value = 0.7;
    DesignsParams(1).variables(7).max_value = 0.95;
    DesignsParams(1).variables(7).min_value = 0.5;
    
    DesignsParams(1).variables(8).name = 'D_ro1';
    DesignsParams(1).variables(8).value = 15;
    DesignsParams(1).variables(8).max_value = 17;
    DesignsParams(1).variables(8).min_value = 13;
    
    DesignsParams(1).variables(9).name = 'D_ro2';
    DesignsParams(1).variables(9).value = 13;
    DesignsParams(1).variables(9).max_value = 17;
    DesignsParams(1).variables(9).min_value = 12;
    
    DesignsParams(1).variables(10).name = 'D_ri1';
    DesignsParams(1).variables(10).value = 8;
    DesignsParams(1).variables(10).max_value = 12;
    DesignsParams(1).variables(10).min_value = 5;
    
    DesignsParams(1).variables(11).name = 'D_ri2';
    DesignsParams(1).variables(11).value = 10;
    DesignsParams(1).variables(11).max_value = 12;
    DesignsParams(1).variables(11).min_value = 5;
    
    DesignsParams(1).variables(12).name = 'a_ri';
    DesignsParams(1).variables(12).value = 0.3;
    DesignsParams(1).variables(12).max_value = 0.8;
    DesignsParams(1).variables(12).min_value = 0.1;
    
    DesignsParams(1).variables(13).name = 'a_arc';
    DesignsParams(1).variables(13).value = 70;
    DesignsParams(1).variables(13).max_value = 180;
    DesignsParams(1).variables(13).min_value = 30;
    
elseif mode==2
    
    DesignsParams(1).variables(1).name = 'D_ro1';
    DesignsParams(1).variables(1).value = 15;
    DesignsParams(1).variables(1).max_value = 17;
    DesignsParams(1).variables(1).min_value = 13;
    
    DesignsParams(1).variables(2).name = 'airgap';
    DesignsParams(1).variables(2).value = 1.5;
    DesignsParams(1).variables(2).max_value = 3;
    DesignsParams(1).variables(2).min_value = 1;
    
    DesignsParams(1).variables(3).name = 'm_thickness';
    DesignsParams(1).variables(3).value = 1;
    DesignsParams(1).variables(3).max_value = 2;
    DesignsParams(1).variables(3).min_value = 0.5;
    
    DesignsParams(1).variables(4).name = 'pole_arc_ratio';
    DesignsParams(1).variables(4).value = 0.7;
    DesignsParams(1).variables(4).max_value = 0.95;
    DesignsParams(1).variables(4).min_value = 0.3;
    
    DesignsParams(1).variables(5).name = 'D_ri1';
    DesignsParams(1).variables(5).value = 10;
    DesignsParams(1).variables(5).max_value = 12;
    DesignsParams(1).variables(5).min_value = 5;
    
    DesignsParams(1).variables(6).name = 'D_ri2';
    DesignsParams(1).variables(6).value = 10;
    DesignsParams(1).variables(6).max_value = 10;
    DesignsParams(1).variables(6).min_value = 5;
    
    DesignsParams(1).variables(7).name = 'a_ri';
    DesignsParams(1).variables(7).value = 0.3;
    DesignsParams(1).variables(7).max_value = 0.8;
    DesignsParams(1).variables(7).min_value = 0.1;
    
    DesignsParams(1).variables(8).name = 'D_stator_outer';
    DesignsParams(1).variables(8).value = 25;
    DesignsParams(1).variables(8).max_value = 30;
    DesignsParams(1).variables(8).min_value = 20;
    
elseif mode==3
    DesignsParams(1).variables(1).name = 'D_ro1';
    DesignsParams(1).variables(1).value = 15;
    DesignsParams(1).variables(1).max_value = 17;
    DesignsParams(1).variables(1).min_value = 13;
    
    DesignsParams(1).variables(2).name = 'airgap';
    DesignsParams(1).variables(2).value = 1.5;
    DesignsParams(1).variables(2).max_value = 3;
    DesignsParams(1).variables(2).min_value = 1;
    
    DesignsParams(1).variables(3).name = 'm_thickness';
    DesignsParams(1).variables(3).value = 1;
    DesignsParams(1).variables(3).max_value = 2;
    DesignsParams(1).variables(3).min_value = 0.5;
    
    DesignsParams(1).variables(4).name = 'pole_arc_ratio';
    DesignsParams(1).variables(4).value = 0.7;
    DesignsParams(1).variables(4).max_value = 0.95;
    DesignsParams(1).variables(4).min_value = 0.3;
    
    DesignsParams(1).variables(5).name = 'D_ri1';
    DesignsParams(1).variables(5).value = 8;
    DesignsParams(1).variables(5).max_value = 9;
    DesignsParams(1).variables(5).min_value = 5;
    
    DesignsParams(1).variables(6).name = 'D_ri2';
    DesignsParams(1).variables(6).value = 10;
    DesignsParams(1).variables(6).max_value = 10;
    DesignsParams(1).variables(6).min_value = 5;
    
    DesignsParams(1).variables(7).name = 'a_ri';
    DesignsParams(1).variables(7).value = 0.3;
    DesignsParams(1).variables(7).max_value = 0.8;
    DesignsParams(1).variables(7).min_value = 0.1;
    
    DesignsParams(1).variables(8).name = 'D_stator_outer';
    DesignsParams(1).variables(8).value = 25;
    DesignsParams(1).variables(8).max_value = 30;
    DesignsParams(1).variables(8).min_value = 20;
elseif mode==4
    DesignsParams(1).variables(1).name = 'airgap';
    DesignsParams(1).variables(1).value = 1.5;
    DesignsParams(1).variables(1).max_value = 3;
    DesignsParams(1).variables(1).min_value = 1;
    
    DesignsParams(1).variables(2).name = 'D_ro1';
    DesignsParams(1).variables(2).value = 15;
    DesignsParams(1).variables(2).max_value = 17;
    DesignsParams(1).variables(2).min_value = 13;
    
    DesignsParams(1).variables(3).name = 'D_ro2';
    DesignsParams(1).variables(3).value = 13;
    DesignsParams(1).variables(3).max_value = 17;
    DesignsParams(1).variables(3).min_value = 12;
    
    DesignsParams(1).variables(4).name = 'm_thickness';
    DesignsParams(1).variables(4).value = 1;
    DesignsParams(1).variables(4).max_value = 1.5;
    DesignsParams(1).variables(4).min_value = 0.5;
    
    DesignsParams(1).variables(5).name = 'D_ri1';
    DesignsParams(1).variables(5).value = 10;
    DesignsParams(1).variables(5).max_value = 12;
    DesignsParams(1).variables(5).min_value = 5;
    
    DesignsParams(1).variables(6).name = 'D_ri2';
    DesignsParams(1).variables(6).value = 10;
    DesignsParams(1).variables(6).max_value = 10;
    DesignsParams(1).variables(6).min_value = 5;
    
    DesignsParams(1).variables(7).name = 'a_ri';
    DesignsParams(1).variables(7).value = 0.5;
    DesignsParams(1).variables(7).max_value = 0.8;
    DesignsParams(1).variables(7).min_value = 0.3;
    
    DesignsParams(1).variables(8).name = 'a_arc';
    DesignsParams(1).variables(8).value = 70;
    DesignsParams(1).variables(8).max_value = 180;
    DesignsParams(1).variables(8).min_value = 30;
    
    DesignsParams(1).variables(9).name = 'mag_width';
    DesignsParams(1).variables(9).value = 1.5;
    DesignsParams(1).variables(9).max_value = 2.5;
    DesignsParams(1).variables(9).min_value = 1;
    
    DesignsParams(1).variables(10).name = 'mag_dis';
    DesignsParams(1).variables(10).value = 1;
    DesignsParams(1).variables(10).max_value = 2;
    DesignsParams(1).variables(10).min_value = 1;
    
    DesignsParams(1).variables(11).name = 'D_stator_outer';
    DesignsParams(1).variables(11).value = 25;
    DesignsParams(1).variables(11).max_value = 35;
    DesignsParams(1).variables(11).min_value = 25;
elseif mode==5
    
    DesignsParams(1).variables(1).name = 'airgap';
    DesignsParams(1).variables(1).value = 1.5;
    DesignsParams(1).variables(1).max_value = 3;
    DesignsParams(1).variables(1).min_value = 1;
    
    DesignsParams(1).variables(2).name = 'D_ro1';
    DesignsParams(1).variables(2).value = 15;
    DesignsParams(1).variables(2).max_value = 17;
    DesignsParams(1).variables(2).min_value = 13;
    
    DesignsParams(1).variables(3).name = 'D_ro2';
    DesignsParams(1).variables(3).value = 13;
    DesignsParams(1).variables(3).max_value = 17;
    DesignsParams(1).variables(3).min_value = 12;
    
    DesignsParams(1).variables(4).name = 'm_thickness';
    DesignsParams(1).variables(4).value = 1;
    DesignsParams(1).variables(4).max_value = 1.5;
    DesignsParams(1).variables(4).min_value = 0.5;
    
    
    DesignsParams(1).variables(5).name = 'D_ri1';
    DesignsParams(1).variables(5).value = 10;
    DesignsParams(1).variables(5).max_value = 12;
    DesignsParams(1).variables(5).min_value = 5;
    
    DesignsParams(1).variables(6).name = 'D_ri2';
    DesignsParams(1).variables(6).value = 10;
    DesignsParams(1).variables(6).max_value = 10;
    DesignsParams(1).variables(6).min_value = 5;
    
    DesignsParams(1).variables(7).name = 'a_ri';
    DesignsParams(1).variables(7).value = 0.5;
    DesignsParams(1).variables(7).max_value = 0.8;
    DesignsParams(1).variables(7).min_value = 0.3;
    
    DesignsParams(1).variables(8).name = 'a_arc';
    DesignsParams(1).variables(8).value = 70;
    DesignsParams(1).variables(8).max_value = 180;
    DesignsParams(1).variables(8).min_value = 30;
    
    DesignsParams(1).variables(9).name = 'mag_width';
    DesignsParams(1).variables(9).value = 1.5;
    DesignsParams(1).variables(9).max_value = 2.5;
    DesignsParams(1).variables(9).min_value = 1;
    
    DesignsParams(1).variables(10).name = 'mag_dis';
    DesignsParams(1).variables(10).value = 1;
    DesignsParams(1).variables(10).max_value = 2;
    DesignsParams(1).variables(10).min_value = 1;
    
    DesignsParams(1).variables(11).name = 'D_stator_outer';
    DesignsParams(1).variables(11).value = 25;
    DesignsParams(1).variables(11).max_value = 35;
    DesignsParams(1).variables(11).min_value = 25;
    
elseif mode==6
%     D_arc_2=D_arc_1*0.8;  % should use greater than 0.8, 0.8~0.99
% m_thickness=1.5; % should use 1~3
% m_width=8; % should use width 5~10
% m_in=3; % should use 1~3
% deg_arc_1=50; % should use 10~120
% deg_arc_2=50; % should use 10~40
    DesignsParams(1).variables(1).name = 'D_arc_2';
    DesignsParams(1).variables(1).value = 36*0.95;
    DesignsParams(1).variables(1).max_value = 36*0.99;
    DesignsParams(1).variables(1).min_value = 36*0.8;
    
    DesignsParams(1).variables(2).name = 'deg_arc_1';
    DesignsParams(1).variables(2).value = 50;
    DesignsParams(1).variables(2).max_value = 100;
    DesignsParams(1).variables(2).min_value = 10;

    DesignsParams(1).variables(3).name = 'deg_arc_2';
    DesignsParams(1).variables(3).value = 20;
    DesignsParams(1).variables(3).max_value = 40;
    DesignsParams(1).variables(3).min_value = 10;
    
    DesignsParams(1).variables(4).name = 'm_in';
    DesignsParams(1).variables(4).value = 2;
    DesignsParams(1).variables(4).max_value = 3;
    DesignsParams(1).variables(4).min_value = 1;
    
    DesignsParams(1).variables(5).name = 'm_width';
    DesignsParams(1).variables(5).value = 8;
    DesignsParams(1).variables(5).max_value = 10;
    DesignsParams(1).variables(5).min_value = 5;
    
    DesignsParams(1).variables(6).name = 'm_thickness';
    DesignsParams(1).variables(6).value = 1.5;
    DesignsParams(1).variables(6).max_value = 3;
    DesignsParams(1).variables(6).min_value = 1;    
    
end