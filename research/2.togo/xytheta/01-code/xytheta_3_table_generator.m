clc;
clear;
close all;

table_epoch_name = [];
table_mag_in = [];
table_MSE = [];
table_sensor_space = [];
table_kg = [];
table_magnet_thickness = [];
%%
table_epoch_name = [table_epoch_name; convertCharsToStrings(epoch_name)]
table_mag_in = [table_mag_in; D_magnet_inner]
table_sensor_space = [table_sensor_space; sensor_space]
table_magnet_thickness = [table_magnet_thickness; m_thickness]
table_MSE = [table_MSE; tot_error_x]
table_kg = [table_kg; kg]

table_total = table(table_epoch_name,table_mag_in,table_sensor_space,table_magnet_thickness,table_MSE, table_kg)
%%
table_total = sortrows(table_total,[4, 2])

table_filename1 = sprintf('post_data_%s/%s.xls',date,epoch_name)
writetable(table_total,table_filename1)
table_filename2 = sprintf('post_data_%s/%s.mat',date,epoch_name)
save(table_filename2,"table_total")