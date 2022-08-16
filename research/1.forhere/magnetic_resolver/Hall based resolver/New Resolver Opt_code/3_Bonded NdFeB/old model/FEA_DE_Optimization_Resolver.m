clear; close all; clc; clearvars -global;
% addpath('rules')
addpath('OptAlgLib')
addpath('FEALib')
% global BPMSM_OPT
global DesignsParams
global AlgorithmParams
addpath('c:\\femm42\\mfiles');
savepath;
%% setup initial population

% mode=1 %conventional mode
% mode=2 %hall sensor - surface PM
% mode=3 %hall sensor - consecutive surface PM
% mode=4 %hall sensor - interior PM
% mode=5 %hall sensor - consecutive interior PM
mode =6; %hall sensor-resolver

DesignsParams=Geo_boundary_condition(mode)

for n=1:size(DesignsParams.variables,2)
    AlgorithmParams.XVmin(n)=DesignsParams.variables(n).min_value;
    AlgorithmParams.XVmax(n)=DesignsParams.variables(n).max_value;
end
%% Settings for objective function

%weights
weights.w_THD=1;
weights.w_volume=1;

%rotor type
settings.mode = mode;  
%store settings
settings.weights = weights;
% settings.loss_eval = loss_eval;
% settings.source = source;
settings.min =AlgorithmParams.XVmin;
settings.max =AlgorithmParams.XVmax;

%%
AlgorithmParams.VTR = 1.e-6;
AlgorithmParams.y = settings;
AlgorithmParams.NP = 12;
AlgorithmParams.itermax = 50;
AlgorithmParams.F = 0.3;
AlgorithmParams.CR = 0.3;
AlgorithmParams.strategy = 3;
AlgorithmParams.refresh = 5;
AlgorithmParams.D = size(DesignsParams.variables,2);

%% run it
[x,f,nf] = DEoptimize_ECCE('Eval_resolver_ECCE','report_fea_results', AlgorithmParams)

%% Add B_g A_L V_R
% clear
% load all_solve_data_rot1_forcetorque_weighting10_0619
% settings.rotor_type=1
% for nfeval=1:length(all_solve_data)
%     params=[all_solve_data(nfeval).EM_input(nfeval).D_rotor_outer,...
%         all_solve_data(nfeval).EM_input(nfeval).m_thickness,...
%         all_solve_data(nfeval).EM_input(nfeval).w_teeth,...
%         all_solve_data(nfeval).EM_input(nfeval).sue_1,...
%         all_solve_data(nfeval).EM_input(nfeval).sue_2,...
%         all_solve_data(nfeval).EM_input(nfeval).airgap,...
%         all_solve_data(nfeval).EM_input(nfeval).th_core,...
%         all_solve_data(nfeval).EM_input(nfeval).slot_ratio,...
%         all_solve_data(nfeval).EM_input(nfeval).pole_arc_ratio];
%     source=all_solve_data(nfeval).EM_source(nfeval);
%     
%     [ A_L, V_R, B_g, B_g_h ] = FEA_airgap(params,settings.rotor_type,source,nfeval)
%     
%     all_solve_data(nfeval).EM_output(nfeval).A_L=A_L;
%     all_solve_data(nfeval).EM_output(nfeval).V_R=V_R;
%     all_solve_data(nfeval).EM_output(nfeval).B_g=B_g;
%     all_solve_data(nfeval).EM_output(nfeval).B_g_h=B_g_h;
% end
% save temp5
%%

