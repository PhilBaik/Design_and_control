%% plot cost eficiency
clear all; close all; clc;

addpath('addaxis6') %% for three plot

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
set(0,'DefaultFigureColor', [1 1 1])

load_file = 'all_solve_data_15_better.mat'; %%%choose the file
% load all_solve_data_1
% load all_solve_data_2
% load all_solve_data_3
% load all_solve_data_4
% load all_solve_data_5
% load all_solve_data_6
% load all_solve_data_7
% load all_solve_data_13 % bonded NdFeB
% load all_solve_data_14 % sittered NdFeB with yoke
% load all_solve_data_15 % Ferrite
% load all_solve_data_16.mat % bonded NdFeB
load(load_file)
load_num = sscanf(load_file,'all_solve_data_%[^.]')


date = datestr(now,'yyyymmdd');
save_enable = 1;
save_resolution = 2000;
save_format = '.tiff';
%%
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
%% 1 THD_PM
THD_PM_figure = figure(1);


% EM_output.O_1=100*EM_output.Total_THD;
% EM_output.O_2=10^9*EM_output.Total_volume;
% EM_output.O_3=(EM_output.Amp_fundamental-0.08).^2;
% 
% 
% Cost=EM_output.O_1*EM_input.w_THD...
%     +EM_output.O_2*EM_input.w_volume...
%     +EM_output.O_3*EM_input.w_amp...
%     +sum(penalty);
THD_PM_figure.Position(3:4) = [600 400];
ax = gca;
xticks([1 10 20 30 40 50])
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FontSize = 13;

xlim([1 50])
% ax.XAxis.fontsize = 15
yyaxis left
plot(Total_THD,'b')
ylatex = 'THD $[\%]$';
ylabel(ylatex,'FontName','Times','FontSize',13,'Interpreter','latex')

yyaxis right
plot(Total_mag_volume*10^9,'r')
ylatex = 'PM volume [$mm^2$]';
ylabel(ylatex,'FontName','Times','FontSize',13,'Interpreter','latex')

% plot(Amp_fundamental)

ax.YAxis(1).FontSize = 13;
ax.YAxis(2).FontSize = 13;

xlatex = 'Iteration';
xlabel(xlatex,'fontname','Times','FontSize',13,'Interpreter','latex')

leg_MO = legend('THD','PM volume','Location','best','Numcolumns',1);
set(leg_MO, 'Interpreter', 'latex');
set(leg_MO, 'FontSize', 12);


%% 2_cost figure
cost_figure = figure(2);
cost_figure.Position(3:4) = [500 200];
plot(cost,'black')
ax = gca;
xticks([1 10 20 30 40 50])
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FontSize = 12;
ax.YAxis.FontSize = 12;
xlatex = 'Iteration';
xlabel(xlatex,'fontname','Times','FontSize',12,'Interpreter','latex')
ylatex = 'Cost';
ylabel(ylatex,'FontName','Times','FontSize',12,'Interpreter','latex')
filename = sprintf('cost%s',load_num);
save(filename,"cost")


%% 3_Fundamental Flux density Amplitude (target 0.08)
amp_figure = figure(3);
amp_figure.Position(3:4) = [600 400];
plot(Amp_fundamental*1000,'black')
ax = gca;
xticks([1 10 20 30 40 50])
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FontSize = 13;
xlatex = 'Iteration';
xlabel(xlatex,'fontname','Times','FontSize',13,'Interpreter','latex')
ylatex = 'Fundamental Flux Density $[mT]$';
ylabel(ylatex,'FontName','Times','FontSize',13,'Interpreter','latex')

Best_Total_volume;
Best_Total_THD;
Best_Total_Amplitude=all_solve_data(best_design).EM_output(best_design).Amp_fundamental


%% 4_O1 O2 O3 plot
full_figure = figure(4);
full_figure.Position(3:4) = [500 200];
hold on;
plot(O_1*20)
plot(O_2*10)
plot(O_3*20000)

leg_o1o2o3 = legend('THD','PM volume','amplitude','Location','best','Numcolumns',1);
set(leg_o1o2o3, 'Interpreter', 'latex');
set(leg_o1o2o3, 'FontSize', 12);

% weights.w_THD=20;
% weights.w_volume=10;
% weights.w_amp=20000;

%% 5_three y axis plot( !!! Import addaxis6 folder)
three_fig = figure(5)
x1 = 1:1:50;
three_fig.Position(3:4) = [500 200];
plot(x1,Total_THD*100,'Color','k','linewidth',1);
grid on;

xlim([0,50])
ax = gca;
xticks([ 10 20 30 40 50])
ax.TickLabelInterpreter = 'latex';
ax.XAxis.FontSize = 12;
ax.YAxis.FontSize = 12;
xlatex = 'Iteration';
xlabel(xlatex,'fontname','Times','FontSize',12,'Interpreter','latex')

addaxis(x1,Total_mag_volume*10^9*37.16/1.047,[0 200],'Color','#D95319','linewidth',1);
addaxis(x1,Amp_fundamental*1000,[0 150],'Color','#0072BD','linewidth',1)

addaxislabel(1,'THD $[\%]$')
addaxislabel(2,'PM Volume $[mm^3]$')
addaxislabel(3,'Fundamental Amplitude $[mT]$')
box on;
hl = legend('THD','PM Volume','Fundamental Amplitude');
hl.FontName = 'Times'
hl.FontSize = 12;


%% best txt
best_input=all_solve_data(best_design).EM_input(best_design)
Best_table = table
Best_Category = ["name";"Volume";"THD";"Amp";"Cost";"w_THD";"w_volume";"w_amp";"D_arc_2";"deg_arc_1";"deg_arc_2";"m_in_1";"slit_width";"m_thickness";"m_gap";"b_th_2"]
Value = [{load_num};Best_Total_volume;Best_Total_THD;Best_Total_Amplitude;best_cost;best_input.w_THD;best_input.w_volume;best_input.w_amp;
    best_input.D_arc_2;best_input.deg_arc_1;best_input.deg_arc_2;best_input.m_in_1;best_input.slit_width;best_input.m_thickness;best_input.m_gap;best_input.m_in_1];

Best_table = table(Best_Category,Value);

% Best_O_1= all_solve_data(best_design).EM_output(best_design).O_1
% Best_O_2= all_solve_data(best_design).EM_output(best_design).O_2
% Best_O_3= all_solve_data(best_design).EM_output(best_design).O_3

%% 20_cost full figure
load("cost14.mat")
cost_sintered = cost;
load("cost15_better.mat")
cost_ferrite = cost;
load("cost16.mat")
cost_bonded = cost;

cost_full_figure = figure(20);
cost_full_figure.Position(3:4) = [500 200];
hold on;
plot(cost_sintered,'LineWidth',2)
plot(cost_bonded,'LineWidth',2)
plot(cost_ferrite,'LineWidth',2)
box on;
grid on;

xlatex = 'Iteration';
xlabel(xlatex,'fontname','Times','FontSize',12,'Interpreter','latex')
ylatex = 'Cost';
ylabel(ylatex,'FontName','Times','FontSize',12,'Interpreter','latex')
ax = gca;

ax.YAxis.FontSize = 12;
ax.YAxis.FontName = 'Times'
ax.XAxis.FontSize = 12;
ax.XAxis.FontName = 'Times'

leg_cost= legend('Sintered NdFeB','Bonded NdFeB','Ferrite','Location','northeast','Numcolumns',1);
set(leg_cost, 'Interpreter', 'latex');
set(leg_cost, 'FontSize', 12);
set(leg_cost, 'FontName', 'Times');

% weights.w_THD=20;
% weights.w_volume=10;
% weights.w_amp=20000;

%%
filename1=getname(THD_PM_figure);
filename2=getname(cost_figure);
filename3=getname(amp_figure);
filename4=getname(full_figure);
filename5=getname(Best_table);
filename6=getname(three_fig);
filename7=getname(cost_full_figure);
%% save
if(save_enable==1)
filename = sprintf('fig%s_%s_%s%s',load_num,filename1,date,save_format);
exportgraphics(THD_PM_figure,filename,'Resolution',save_resolution);
filename = sprintf('fig%s_%s_%s%s',load_num,filename2,date,save_format);
exportgraphics(cost_figure,filename,'Resolution',save_resolution)
filename = sprintf('fig%s_%s_%s%s',load_num,filename3,date,save_format);
exportgraphics(amp_figure,filename,'Resolution',save_resolution)
filename = sprintf('fig%s_%s_%s%s',load_num,filename4,date,save_format);
exportgraphics(full_figure,filename,'Resolution',save_resolution)
filename = sprintf('fig%s_%s_%s.xlsx',load_num,filename5,date);
writetable(Best_table, filename);
filename = sprintf('fig%s_%s_%s%s',load_num,filename6,date,save_format);
exportgraphics(three_fig,filename,'Resolution',save_resolution)

dirname = sprintf('%s_plot_check_%s',load_num,date);
if ~exist(dirname, 'dir')
   mkdir(dirname)
end
movefile('fig*', dirname);

filename = sprintf('fig_%s_%s%s',filename7,date,save_format);
exportgraphics(cost_full_figure,filename,'Resolution',save_resolution)

close all hidden
end



%%
function s = getname(a)
    s = inputname(1);
end