function [ Cost, Resolver_OPT ] = Eval_resolver_ECCE(para,nfeval, y)
global DesignsParams
% enalbe loss evaluation
mode = y.mode;
% check if input parameters are in the boundary
% if outside boundary condition, give penalty
for o=1:length(para)
    belowRange = (para(o) < y.min(o));
    aboveRange = (para(o) > y.max(o));
    penalty(o) = or(belowRange,aboveRange)*100*o;
end

% evaluate FEA
time.time_design_eval=clock
if sum(penalty)>0
    EM_eval=0
    EM_output.Total_THD=100;
    EM_output.Total_volume=100;
    EM_output.Amp_fundamental=1/100;
    EM_output.Time=0;
    
else
    [EM_eval] = EM_resolver_ECCE_6(para,nfeval,mode);
    EM_output.Total_THD=EM_eval.Total_THD;
    EM_output.Total_volume=EM_eval.Total_volume;
    EM_output.Amp_fundamental=EM_eval.Amp_fundamental;

    EM_output.Time=time;
    save('temp')
end

%evaluate objective function
EM_input.w_THD=y.weights.w_THD;
EM_input.w_volume=y.weights.w_volume;
EM_input.w_amp=y.weights.w_amp;


EM_output.O_1=100*EM_output.Total_THD;
EM_output.O_2=10^9*EM_output.Total_volume;
EM_output.O_3=1/EM_output.Amp_fundamental;


Cost=EM_output.O_1*EM_input.w_THD...
    +EM_output.O_2*EM_input.w_volume...
    +EM_output.O_3*EM_input.w_amp...
    +sum(penalty);


EM_input.D_arc_2=para(1);
EM_input.deg_arc_1=para(2);
EM_input.deg_arc_2=para(3);
EM_input.m_in_1=para(4);
EM_input.slit_width = para(5);
EM_input.m_thickness = para(6);
EM_input.m_gap=para(7);
EM_input.b_th_2=para(8); % use 1 to 3
EM_input.m_in_2=para(9);

% save input and output
Resolver_OPT.EM_eval(nfeval)=EM_eval;
Resolver_OPT.EM_output(nfeval)=EM_output;
Resolver_OPT.time(nfeval)=time;
Resolver_OPT.EM_input(nfeval)=EM_input;
% Resolver_OPT.EM_source(nfeval)=source;
Resolver_OPT.Cost(nfeval)=struct('Cost',Cost);
Resolver_OPT.Penalty(nfeval)=struct('Penalty',penalty);
end

