%% Plot Vehicle Trajectory from Recorded Data

%% Clear Workspace
close all;
clear;
clc;

%% Import Data
[mat_files,Trajectory] = uigetfile('*.mat','multiselect','off');
load(fullfile(Trajectory,mat_files));

%% Plot Vehicle Trajectory
figure('Name','Vehicle Trajectory','NumberTitle','off');
scatter(states(:,1),states(:,2),1,states_ts.Time-states_ts.Time(1));
xlim([-3.5,2])
ylim([-3,2.5])
pbaspect([1 1 1])
c = colorbar; % Colorbar instance
c.Label.String = 'Time (s)'; % Colorbar label
c.Label.FontSize = 11; % Font size for colorbar label
colormap(parula) % Colorbar colormap
title('Vehicle Trajectory')
xlabel('Global X-Coordinate (m)')
ylabel('Global Y-Coordinate (m)')