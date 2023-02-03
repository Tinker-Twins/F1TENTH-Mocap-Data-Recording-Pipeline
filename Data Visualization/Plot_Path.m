%% Plot Vehicle Path from Recorded Data

%% Clear Workspace
close all;
clear;
clc;

%% Import Data
[mat_files,path] = uigetfile('*.mat','multiselect','off');
load(fullfile(path,mat_files));

%% Plot Vehicle Path
figure('Name','Vehicle Path','NumberTitle','off');
plot(states(:,1),states(:,2),'Color','black')
hold on
plot(states(1,1),states(1,2),'o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor',[1 0.6 0.6])
plot(states(end,1),states(end,2),'o','MarkerSize',5,'MarkerEdgeColor','blue','MarkerFaceColor',[0.6 0.6 1])
hold off
xlim([-3.5,2])
ylim([-3,2.5])
pbaspect([1 1 1])
title('Vehicle Path')
legend('Path','Start','Finish','Location','NE')
xlabel('Global X-Coordinate (m)')
ylabel('Global Y-Coordinate (m)')