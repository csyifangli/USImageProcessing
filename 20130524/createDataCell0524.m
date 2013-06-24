clear all;close all; clc
grid_length = [35:2.5:75];
radius_circle = [15:2.5:45];
grid_length_int = [35:0.2:75];
radius_circle_int = [15:0.2:45];
load nmseanalysis0527max2.mat
%%
% data = cell(1,5);
% 
% for k = 1:5
%    data{k}.stimulus = zeros(numel(grid_length),numel(radius_circle));
% end

%%

% for i = 1:5
%     figure(1);
%     title('Stimulus');
%     subplot(2,3,i);
%     surf(radius_circle,grid_length,data{i}.stimulus);
%     ylabel('grid length')
%     xlabel('radius circle')
% end

%%

for j = 1:numel(grid_length)
    for k = 1:numel(radius_circle)
        nmsestimulus(j,k) = mean([data{1}.stimulus(j,k) data{2}.stimulus(j,k) data{3}.stimulus(j,k) data{4}.stimulus(j,k) data{5}.stimulus(j,k)]);
    end
end

% figure(3)
% surf(radius_circle,grid_length,nmsestimulus);
% title('stimulus')
% ylabel('grid length')
% xlabel('radius circle')

%%

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

% 
% figure(7)
% mesh(radius_circle,grid_length,nmsestimulus);
% title('stimulus')
% ylabel('grid length')
% xlabel('radius circle')



grid_length_m = repmat(grid_length,numel(radius_circle),1)';
grid_length_int_m = repmat(grid_length_int,numel(radius_circle_int),1)';
radius_circle_m = repmat(radius_circle,numel(grid_length),1);
radius_circle_int_m = repmat(radius_circle_int,numel(grid_length_int),1);

% nmsestimulusInt = interp2(grid_length_m,radius_circle_m,nmsestimulus,grid_length_int_m,radius_circle_int_m);
% nmseforceInt = interp2(grid_length_m,radius_circle_m,nmseforce,grid_length_int_m,radius_circle_int_m);

nmsestimulusInt = interp2(radius_circle_m,grid_length_m,nmsestimulus,radius_circle_int_m,grid_length_int_m);

figure(9)
surf(radius_circle_int,grid_length_int,nmsestimulusInt);
set(gca,'fontSize',14,'fontWeight','bold')
title('stimulus')
ylabel('grid length')
xlabel('radius circle')
