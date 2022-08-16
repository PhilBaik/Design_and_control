function [DesignsParams]= Geo_boundary_condition(mode)

if mode==4
      DesignsParams(1).variables(1).name = 'D_arc_2';
    DesignsParams(1).variables(1).value = 36*0.95;
    DesignsParams(1).variables(1).max_value = 36*0.95;
    DesignsParams(1).variables(1).min_value = 36*0.85;
    
    DesignsParams(1).variables(2).name = 'deg_arc_1';
    DesignsParams(1).variables(2).value = 50;
    DesignsParams(1).variables(2).max_value = 100;
    DesignsParams(1).variables(2).min_value = -40;
    
    DesignsParams(1).variables(3).name = 'deg_arc_2';
    DesignsParams(1).variables(3).value = 20;
    DesignsParams(1).variables(3).max_value = 40;
    DesignsParams(1).variables(3).min_value = -40;
    
    DesignsParams(1).variables(4).name = 'm_in_1';
    DesignsParams(1).variables(4).value = 2;
    DesignsParams(1).variables(4).max_value = 5;
    DesignsParams(1).variables(4).min_value = 1;
    
    DesignsParams(1).variables(5).name = 'slit_width';
    DesignsParams(1).variables(5).value = 8;
    DesignsParams(1).variables(5).max_value = 11;
    DesignsParams(1).variables(5).min_value = 7;
    
    DesignsParams(1).variables(6).name = 'm_thickness';
    DesignsParams(1).variables(6).value = 1.025;
    DesignsParams(1).variables(6).max_value = 1.05;
    DesignsParams(1).variables(6).min_value = 1;
    
    DesignsParams(1).variables(7).name = 'm_gap';
    DesignsParams(1).variables(7).value = 0.8;
    DesignsParams(1).variables(7).max_value = 3;
    DesignsParams(1).variables(7).min_value = 0.3;
    
    DesignsParams(1).variables(8).name = 'b_th_2';
    DesignsParams(1).variables(8).value = 1.5;
    DesignsParams(1).variables(8).max_value = 2;
    DesignsParams(1).variables(8).min_value = 1;
    
elseif mode==6
    %     D_arc_2=D_arc_1*0.8;  % should use greater than 0.8, 0.8~0.99
    % m_thickness=1.5; % should use 1~3
    % m_width=8; % should use width 5~10
    % m_in=3; % should use 1~3
    % deg_arc_1=50; % should use 10~120
    % deg_arc_2=50; % should use 10~40
    DesignsParams(1).variables(1).name = 'D_arc_2';
    DesignsParams(1).variables(1).value = 36*0.95;
    DesignsParams(1).variables(1).max_value = 36*0.95;
    DesignsParams(1).variables(1).min_value = 36*0.85;
    
    DesignsParams(1).variables(2).name = 'deg_arc_1';
    DesignsParams(1).variables(2).value = 50;
    DesignsParams(1).variables(2).max_value = 100;
    DesignsParams(1).variables(2).min_value = -30;
    
    DesignsParams(1).variables(3).name = 'deg_arc_2';
    DesignsParams(1).variables(3).value = 20;
    DesignsParams(1).variables(3).max_value = 40;
    DesignsParams(1).variables(3).min_value = -30;
    
    DesignsParams(1).variables(4).name = 'm_in_1';
    DesignsParams(1).variables(4).value = 2;
    DesignsParams(1).variables(4).max_value = 4;
    DesignsParams(1).variables(4).min_value = 1;
    
    DesignsParams(1).variables(5).name = 'slit_width';
    DesignsParams(1).variables(5).value = 8;
    DesignsParams(1).variables(5).max_value = 10;
    DesignsParams(1).variables(5).min_value = 7;
    
    DesignsParams(1).variables(6).name = 'm_thickness';
    DesignsParams(1).variables(6).value = 1.5;
    DesignsParams(1).variables(6).max_value = 3;
    DesignsParams(1).variables(6).min_value = 1;
    
    DesignsParams(1).variables(7).name = 'm_gap';
    DesignsParams(1).variables(7).value = 0.8;
    DesignsParams(1).variables(7).max_value = 1;
    DesignsParams(1).variables(7).min_value = 0.3;
    
    DesignsParams(1).variables(8).name = 'b_th_2';
    DesignsParams(1).variables(8).value = 1.5;
    DesignsParams(1).variables(8).max_value = 2;
    DesignsParams(1).variables(8).min_value = 1;
   
    DesignsParams(1).variables(9).name = 'm_in_2';
    DesignsParams(1).variables(9).value = 3;
    DesignsParams(1).variables(9).max_value = 5;
    DesignsParams(1).variables(9).min_value = 1;
    
    %
    %     D_arc_2=para(1);  % should use greater than 0.8, 0.8~0.99
    % deg_arc_1=para(2); % should use 10~120
    % deg_arc_2=para(3); % should use 10~40
    % m_in_1=para(4); % should use 1~3
    % slit_width=para(5); % should use width 0~5
    % m_thickness=para(6); % should use 1~3
    % m_gap=para(7);
    % b_th_2=para(8); % use 1 to 3
    % m_in_2=para(9);
    
    
elseif mode==7

    DesignsParams(1).variables(1).name = 'D_arc_2';
    DesignsParams(1).variables(1).value = 36*0.95;
    DesignsParams(1).variables(1).max_value = 36*0.95;
    DesignsParams(1).variables(1).min_value = 36*0.85;
    
    DesignsParams(1).variables(2).name = 'deg_arc_1';
    DesignsParams(1).variables(2).value = 50;
    DesignsParams(1).variables(2).max_value = 100;
    DesignsParams(1).variables(2).min_value = -40;
    
    DesignsParams(1).variables(3).name = 'deg_arc_2';
    DesignsParams(1).variables(3).value = 20;
    DesignsParams(1).variables(3).max_value = 40;
    DesignsParams(1).variables(3).min_value = -40;
    
    DesignsParams(1).variables(4).name = 'm_in_1';
    DesignsParams(1).variables(4).value = 2;
    DesignsParams(1).variables(4).max_value = 5;
    DesignsParams(1).variables(4).min_value = 1;
    
    DesignsParams(1).variables(5).name = 'slit_width';
    DesignsParams(1).variables(5).value = 8;
    DesignsParams(1).variables(5).max_value = 11;
    DesignsParams(1).variables(5).min_value = 7;
    
    
    DesignsParams(1).variables(6).name = 'b_th_2';
    DesignsParams(1).variables(6).value = 1.5;
    DesignsParams(1).variables(6).max_value = 2;
    DesignsParams(1).variables(6).min_value = 1;
  
end