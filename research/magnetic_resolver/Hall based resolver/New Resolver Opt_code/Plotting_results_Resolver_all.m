%% plot cost eficiency
clear all; close all; clc;
width = 2;     % Width in inches
height = 2;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 11;      % Fontsize
lw = 1;      % LineWidth
msz = 10;       % MarkerSize
% The properties we've been using in the figures
set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);

% load all_solve_data_1
% load all_solve_data_2
% load all_solve_data_3
% load all_solve_data_4
% load all_solve_data_5
% load all_solve_data_6
% load all_solve_data_7
% load all_solve_data_13 % bonded NdFeB
% load all_solve_data_14 % sittered NdFeB
% load all_solve_data_15 % Ferrite
load all_solve_data_16.mat % bonded NdFeB


num_pop=18;
num_iter=50;

scale_THD=1
scale_mag_volume=1


for n=1:num_iter
    for m=1:num_pop
        (n-1)*num_pop+m
        temp_cost(m)=abs(all_solve_data((n-1)*num_pop+m).Cost((n-1)*num_pop+m).Cost);
    end
    [best_cost,m]=min(temp_cost)
    cost(n)=(best_cost);
    %output
    Total_THD(n)=all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).Total_THD;
    Total_mag_volume(n)=all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).Total_volume;
    Amp_fundamental(n)=all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).Amp_fundamental;
    
    %input
    D_arc_2(n)=all_solve_data((n-1)*num_pop+m).EM_input((n-1)*num_pop+m).D_arc_2;
    deg_arc_1(n)=all_solve_data((n-1)*num_pop+m).EM_input((n-1)*num_pop+m).deg_arc_1;
    deg_arc_2(n)=all_solve_data((n-1)*num_pop+m).EM_input((n-1)*num_pop+m).deg_arc_2;
    m_in_1(n)=all_solve_data((n-1)*num_pop+m).EM_input((n-1)*num_pop+m).m_in_1;
    slit_width(n)=all_solve_data((n-1)*num_pop+m).EM_input((n-1)*num_pop+m).slit_width;
    m_thickness(n)=all_solve_data((n-1)*num_pop+m).EM_input((n-1)*num_pop+m).m_thickness;
    m_gap(n)=all_solve_data((n-1)*num_pop+m).EM_input((n-1)*num_pop+m).m_gap;
    b_th_2(n)=all_solve_data((n-1)*num_pop+m).EM_input((n-1)*num_pop+m).b_th_2;
    m_in_2(n)=m_in_1(n);
%         m_in_2(n)=all_solve_data((n-1)*num_pop+m).EM_input((n-1)*num_pop+m).m_in_2;
    
    
    % objective function
    O_1(n)= all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).O_1;
    O_2(n)= all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).O_2;
    O_3(n)= all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).O_3;
    
    %     if isfield(all_solve_data(1).EM_eval(1),'Loss')
    %         Loss(n).Loss=abs(all_solve_data((n-1)*num_pop+m).EM_eval((n-1)*num_pop+m).Loss);
    %         effi(n).effi=abs(all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).effi);
    %     end
end
% figure(1)
% plot(cost)
% title('cost')
% figure(2)
% plot(Total_THD)
% title('Total THD')
% figure(3)
% plot(Total_mag_volume)
% title('Magnet volume')
% figure(13)
% plot(Amp_fundamental)
% title('Amp fundamental')
% figure(4)
% plot(O_1)
% hold on
% plot(O_2)
% plot(O_3)
% legend('THD','PM','Fund')
% title('Objective')
% figure(700)
% plot(D_arc_2)
% title('D arc 2')
% figure(701)
% plot(deg_arc_1)
% title('deg arc 1')
% figure(702)
% plot(deg_arc_2)
% title('deg arc 2')
% figure(703)
% plot(m_in_1)
% title('m in 1')
% figure(704)
% plot(slit_width)
% title('slit width')
% figure(705)
% plot(m_thickness)
% title('m thickness')
% figure(706)
% plot(m_gap)
% title('m gap')
% figure(707)
% plot(b_th_2)
% title('b th 2')
% figure(708)
% plot(m_in_2)
% title('m in 2')

for n=1:num_iter*num_pop
    temp_cost(n)=all_solve_data(n).Cost(n).Cost;
end
[best_cost,best_design]=min(temp_cost)
Best_Total_THD=all_solve_data(best_design).EM_output(best_design).Total_THD
Best_Total_volume=all_solve_data(best_design).EM_output(best_design).Total_volume

%%
Cost=all_solve_data(best_design).Cost(best_design).Cost
O_1= all_solve_data(best_design).EM_output(best_design).O_1
O_2= all_solve_data(best_design).EM_output(best_design).O_2
O_3= all_solve_data(best_design).EM_output(best_design).O_3

%extract dxf file
filename=best_design
input_para=all_solve_data(best_design).EM_input(best_design)
% Extract_DXF_1(input_para,filename)
% Extract_DXF_2(input_para,filename)
% Extract_DXF_3(input_para,filename)
% Extract_DXF_4(input_para,filename)
% Extract_DXF_5(input_para,filename)
% Extract_DXF_6(input_para,filename)
% Extract_DXF_7(input_para,filename)
Extract_DXF_11(input_para,filename)



% %
% temp_cost(best_design)=1000
% [second_best_cost,second_best_design]=min(temp_cost)
% input_para=all_solve_data(second_best_design).EM_input(second_best_design)
% Extract_DXF_6(input_para,filename)
% %
% % temp_cost(second_best_design)=1000
% % [third_best_cost,third_best_design]=min(temp_cost)
% % input_para=all_solve_data(third_best_design).EM_input(third_best_design)
% % Extract_DXF_R3(input_para,filename)
%
%
%%
close all
%pareto plot
width = 2;     % Width in inches
height = 2;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 11;      % Fontsize
lw = 1;      % LineWidth
msz = 10;       % MarkerSize
% The properties we've been using in the figures
set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);

for n=1:num_iter*num_pop
    cost(n)=all_solve_data(n).Cost(n).Cost;
    %output
    Total_THD(n)=all_solve_data(n).EM_output(n).Total_THD;
    Total_mag_volume(n)=all_solve_data(n).EM_output(n).Total_volume;
    %input
    D_arc_2(n)=all_solve_data(n).EM_input(n).D_arc_2;
    deg_arc_1(n)=all_solve_data(n).EM_input(n).deg_arc_1;
    deg_arc_2(n)=all_solve_data(n).EM_input(n).deg_arc_2;
    m_in_1(n)=all_solve_data(n).EM_input(n).m_in_1;
    
    slit_width(n)=all_solve_data(n).EM_input(n).slit_width;
    m_thickness(n)=all_solve_data(n).EM_input(n).m_thickness;
    m_gap(n)=all_solve_data(n).EM_input(n).m_gap;
    b_th_2(n)=all_solve_data(n).EM_input(n).b_th_2;
    m_in_2(n)=m_in_1(n);
    
    %         m_in_2(n)=all_solve_data(n).EM_input(n).m_in_2;
    
    % objective function
    O_1(n)= all_solve_data(n).EM_output(n).O_1;
    O_2(n)= all_solve_data(n).EM_output(n).O_2;
    O_3(n)= all_solve_data(n).EM_output(n).O_3;
end


%Tradeoff
figure(21)
scatter(Total_THD,Total_mag_volume,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('Total mag volume',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
axis([0 1 0 10*10^-9])
% print('-depsc','-noui','paretodensityeff');


figure(22)
scatter(Total_THD,D_arc_2,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('D arc 2',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
axis([0 0.5 25 40])
% print('-depsc','-noui','paretodensityeff');



figure(23)
scatter(Total_THD,m_in_1,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('m in 1',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
xlim([0 0.5])
% axis([0 0.5 25 40])




figure(24)
scatter(Total_THD,deg_arc_2,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('deg arc 2',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
xlim([0 0.5])
% axis([0 0.5 25 40])





figure(25)
scatter(Total_THD,deg_arc_1,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('deg arc 1',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
xlim([0 0.5])
% axis([0 0.5 25 40])





figure(26)
scatter(Total_THD,slit_width,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('slit width',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
xlim([0 0.5])
% axis([0 0.5 25 40])


figure(27)
scatter(Total_THD,m_thickness,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('m thickness',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
xlim([0 0.5])
% axis([0 0.5 25 40])



figure(28)
scatter(Total_THD,m_gap,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('m gap',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
xlim([0 0.5])
% axis([0 0.5 25 40])



figure(29)
scatter(Total_THD,b_th_2,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('b th 2',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
xlim([0 0.5])
% axis([0 0.5 25 40])


figure(30)
scatter(Total_THD,m_in_2,'.')
set(gca,...
    'Units','normalized',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
ylabel('m in 2',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')

xlabel('Total THD',...
    'FontUnits','points',...
    'FontWeight','normal',...
    'FontSize',10,...
    'FontName','Times')
xlim([0 0.5])
% axis([0 0.5 25 40])



%%
%
% figure(41)
% scatter(O_5,O_6,'.')
%
% set(gca,...
%     'Units','normalized',...
%     'FontUnits','points',...
%     'FontWeight','normal',...
%     'FontSize',10,...
%     'FontName','Times')
%
% xlabel({'O1'},...
%     'FontUnits','points',...
%     'FontWeight','normal',...
%     'FontSize',10,...
%     'FontName','Times')
%
% ylabel('O2',...
%     'FontUnits','points',...
%     'FontWeight','normal',...
%     'FontSize',10,...
%     'FontName','Times')
% print('-depsc','-noui','paretoeffamp');


%%
% 
% %test
% %pareto plot
% width = 3;     % Width in inches
% height = 2;    % Height in inches
% alw = 0.75;    % AxesLineWidth
% fsz = 11;      % Fontsize
% lw = 1;      % LineWidth
% msz = 10;       % MarkerSize
% % The properties we've been using in the figures
% set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
% set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz
% defpos = get(0,'defaultFigurePosition');
% set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
% % scatter(angle_error*180/pi,amp_error./F_avg*100,'.')
% % figure(123)
% % x= airgap;
% % y = m_thickness;
% % z=TRV/1000;
% % z=T_ripple;
% % z=FRW;
% 
% figure(127)
% x=Total_THD;
% y = m_width;
% z=m_in_1;
% maxset=3
% for n=1:600
%     if(z(n)>maxset)
%         z(n)=maxset;
%     else
%         z(n)=z(n);
%     end
% end
% 
% patch([x nan],[y nan],[z nan],[z nan],'LineStyle','none','Marker','o','MarkerSize',3,'EdgeColor','interp','FaceColor','none')
% % colorbar
% h = colorbar;
% set(get(h,'title'),'string','m in','Rotation',270.0,'Position',[30 55],'FontWeight','normal',...
%     'FontSize',10,...
%     'FontName','Times');
% % view([0 0])
% xlabel({'THD'},...
%     'FontUnits','points',...
%     'FontWeight','normal',...
%     'FontSize',10,...
%     'FontName','Times')
% 
% ylabel({'m width'},...
%     'FontUnits','points',...
%     'FontWeight','normal',...
%     'FontSize',10,...
%     'FontName','Times')
% axis([0 1 6 10])
% % zlabel({'B_g'},...
% % 'FontUnits','points',...
% % 'FontWeight','normal',...
% % 'FontSize',10,...
% % 'FontName','Times')
% print('-depsc','-noui','SF_sensi2');