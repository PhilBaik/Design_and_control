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

load Temp_d_effect
num_pop=18;
num_iter=50;

scale_THD=1
scale_mag_volume=1


for n=1:num_iter
%     for m=1:num_pop
%         (n-1)*num_pop+m
%         temp_cost(m)=abs(all_solve_data((n-1)*num_pop+m).Cost((n-1)*num_pop+m).Cost);
%     end
%     [best_cost,m]=min(temp_cost)
%     cost(n)=(best_cost);
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

    O_1(n)= all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).O_1;
    O_2(n)= all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).O_2;
    O_3(n)= all_solve_data((n-1)*num_pop+m).EM_output((n-1)*num_pop+m).O_3;
    
end


for n=1:num_iter*num_pop
    temp_cost(n)=all_solve_data(n).Cost(n).Cost;
end
[best_cost,best_design]=min(temp_cost)
Best_Total_THD=all_solve_data(best_design).EM_output(best_design).Total_THD
Best_Total_volume=all_solve_data(best_design).EM_output(best_design).Total_volume

Cost=all_solve_data(best_design).Cost(best_design).Cost
O_1= all_solve_data(best_design).EM_output(best_design).O_1
O_2= all_solve_data(best_design).EM_output(best_design).O_2
O_3= all_solve_data(best_design).EM_output(best_design).O_3

%extract dxf file
filename=best_design
input_para=all_solve_data(best_design).EM_input(best_design)
%%
ii=1
for d=5:(12.85*2-1-5)/10:(12.85*2-1)
        input_para.D_rotor_inner=d
        input_para.H_c=900000
        Eval_d(ii)=Extract_DXF_14_mod(input_para,filename)
        ii=ii+1
end


%%
n=1
for m=1:11

        THD_d(n,m)=Eval_d((n-1)*10+m).Total_THD;
        Fund_d(n,m)=Eval_d((n-1)*10+m).Amp_fundamental;
  
end
figure(123)
plot(THD_d)
figure(234)
plot(Fund_d)



%%
i=1
for d=5:(12.85*2-1-5)/10:(12.85*2-1)
    for h=(1-.198):0.198/10:1
        input_para.D_rotor_inner=d
        input_para.H_c=900000*h
        Eval(i)=Extract_DXF_14_mod(input_para,filename)
        i=i+1
    end
end
save('Temp_d_effect')
%%
load Temp_d_effect1

for n=1:11
    for m=1:11
%         (n-1)*10+m
        THD(n,m)=Eval((n-1)*11+m).Total_THD;
        Fund(n,m)=Eval((n-1)*11+m).Amp_fundamental;
        temp_fund((n-1)*11+m)=Eval((n-1)*11+m).Amp_fundamental;
    end
end
m_=12.85
% 5:(12.85*2-1-5)/10:(12.85*2-1)
[X,Y] = meshgrid(12.85-5:-(12.85-5-0.5)/10:(0.5) ,200:-(200-20)/10:20);
% [X,Y] = meshgrid(5:(12.85*2-1-5)/10:(12.85*2-1) ,20:(200-20)/10:200);

figure(3)
surf(X,Y,THD'*100)
xlabel('margin [mm]')
ylabel('Temp [C]')
zlabel('THD [%]')


figure(4)
surf(X,Y,Fund')
xlabel('margin [mm]')
ylabel('Temp [C]')
zlabel('Fund. com. Amp. [T]')


%%
%centrifugal analysis

velocity=10:10:100
max_stress=[11.89 47.58 107.06 190.32 297.39 428.24 582.89 761.36 963.6 1189.61]
yield_stress=400
figure(100)
plot(velocity,max_stress)
xlabel('Vel [kRPM]')
ylabel('Max. stress [MPa]')

figure(101)
plot(velocity,400./max_stress)
xlabel('Vel [kRPM]')
ylabel('Safety factor')



