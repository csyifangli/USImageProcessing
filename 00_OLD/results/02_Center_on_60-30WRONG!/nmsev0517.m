clear all;close all; clc
grid_length = [58:1:64];
radius_circle = [31:1:36];
grid_length_int = [58:0.2:64];
radius_circle_int = [31:0.2:36];


%%

load('nmseanalysis0517.mat');

for i = 1:5
    figure(1);
    title('Stimulus');
    subplot(2,3,i);
    surf(radius_circle,grid_length,data{i}.stimulus');
    xlabel('grid length')
    ylabel('radius circle')
    
    figure(2);
    title('Force');
    subplot(2,3,i);
    surf(radius_circle,grid_length,data{i}.force');
    xlabel('grid length')
    ylabel('radius circle')
end

for j = 1:numel(grid_length)
    for k = 1:numel(radius_circle)
        nmsestimulus(j,k) = mean([data{1}.stimulus(j,k) data{2}.stimulus(j,k) data{3}.stimulus(j,k) data{4}.stimulus(j,k) data{5}.stimulus(j,k)]);
        nmseforce(j,k) = mean([data{1}.force(j,k) data{2}.force(j,k) data{3}.force(j,k) data{4}.force(j,k) data{5}.force(j,k)]);
    end
end

figure(3)
surf(radius_circle,grid_length,nmsestimulus');
title('stimulus')
xlabel('grid length')
ylabel('radius circle')

figure(4)
surf(radius_circle,grid_length,nmseforce');
title('force')
xlabel('grid length')
ylabel('radius circle')


% figure(5)
% waterfall(grid_length,radius_circle,nmsestimulus);
% title('stimulus')
% xlabel('grid length')
% ylabel('radius circle')
% 
% figure(6)
% waterfall(grid_length,radius_circle,nmseforce);
% title('force')
% xlabel('grid length')
% ylabel('radius circle')


figure(7)
mesh(radius_circle,grid_length,nmsestimulus');
title('stimulus')
xlabel('grid length')
ylabel('radius circle')

figure(8)
mesh(radius_circle,grid_length,nmseforce');
title('force')
xlabel('grid length')
ylabel('radius circle')

% grid_length_m = repmat(grid_length,numel(radius_circle),1)';
% grid_length_int_m = repmat(grid_length_int,numel(radius_circle_int),1)';
% radius_circle_m = repmat(radius_circle,numel(grid_length),1);
% radius_circle_int_m = repmat(radius_circle_int,numel(grid_length_int),1);
[grid_length_m,radius_circle_m] = meshgrid(grid_length,radius_circle);
[grid_length_int_m,radius_circle_int_m] = meshgrid(grid_length_int,radius_circle_int);

nmsestimulusInt = interp2(grid_length_m,radius_circle_m,nmsestimulus',grid_length_int_m,radius_circle_int_m);
nmseforceInt = interp2(grid_length_m,radius_circle_m,nmseforce',grid_length_int_m,radius_circle_int_m);

figure(9)
mesh(radius_circle_int,grid_length_int,nmsestimulusInt);
title('stimulus')
xlabel('grid length')
ylabel('radius circle')

figure(10)
mesh(radius_circle_int,grid_length_int,nmseforceInt);
title('force')
xlabel('grid length')
ylabel('radius circle')