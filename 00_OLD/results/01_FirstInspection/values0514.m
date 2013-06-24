clc; close all; clear all;
load('nmseanalysis0514.mat')
grid_length = [35:2.5:65];
grid_length_int = [35:0.5:65];
radius_circle = [15:2.5:45];
radius_circle_int = [15:0.5:45];

for k = 1:5
    data{k}.stimulusInt = data{k}.stimulusv2;
    data{k}.forceInt = data{k}.forcev2;
    
    for i = 2:size(data{k}.stimulusv2,1)-1
        
        for j = 2:size(data{k}.stimulusv2,2)-1
            if (data{k}.stimulusInt(i,j) == 0)
                data{k}.stimulusInt(i,j) = mean([data{k}.stimulusInt(i-1,j) data{k}.stimulusInt(i+1,j) data{k}.stimulusInt(i,j-1) data{k}.stimulusInt(i,j+1)]);
                data{k}.forceInt(i,j) = mean([data{k}.forceInt(i-1,j) data{k}.forceInt(i+1,j) data{k}.forceInt(i,j-1) data{k}.forceInt(i,j+1)]);
            end
        end
        
        if (data{k}.stimulusInt(i,1) == 0)
            data{k}.stimulusInt(i,1) = mean([data{k}.stimulusInt(i-1,1) data{k}.stimulusInt(i+1,1) data{k}.stimulusInt(i,2)]);
            data{k}.stimulusInt(i,end) = mean([data{k}.stimulusInt(i-1,end) data{k}.stimulusInt(i+1,end) data{k}.stimulusInt(i,end-1)]);
            data{k}.forceInt(i,1) = mean([data{k}.forceInt(i-1,1) data{k}.forceInt(i+1,1) data{k}.forceInt(i,2)]);
            data{k}.forceInt(i,end) = mean([data{k}.forceInt(i-1,end) data{k}.forceInt(i+1,end) data{k}.forceInt(i,end-1)]);
        end
    end
    
    for j = 2:size(data{k}.stimulusv2,2)-1
        if (data{k}.stimulusInt(1,j) == 0)
            data{k}.stimulusInt(1,j) = mean([data{k}.stimulusInt(1,j-1) data{k}.stimulusInt(1,j+1) data{k}.stimulusInt(2,j)]);
            data{k}.stimulusInt(end,j) = mean([data{k}.stimulusInt(end,j-1) data{k}.stimulusInt(end,j+1) data{k}.stimulusInt(end-1,j)]);
            data{k}.forceInt(1,j) = mean([data{k}.forceInt(1,j-1) data{k}.forceInt(1,j+1) data{k}.forceInt(2,j)]);
            data{k}.forceInt(end,j) = mean([data{k}.forceInt(end,j-1) data{k}.forceInt(end,j+1) data{k}.forceInt(end-1,j)]);
        end
    end
    
end

for i = 1:5
    figure(1);
    title('Stimulus');
    subplot(2,3,i);
    surf(radius_circle,grid_length,data{i}.stimulusInt);
    ylabel('grid length')
    xlabel('radius circle')
    
    figure(2);
    title('Force');
    subplot(2,3,i);
    surf(radius_circle,grid_length,data{i}.forceInt);
    ylabel('grid length')
    xlabel('radius circle')
end

for j = 1:numel(grid_length)
    for k = 1:numel(radius_circle)
        nmsestimulus(j,k) = mean([data{1}.stimulusInt(j,k) data{2}.stimulusInt(j,k) data{3}.stimulusInt(j,k) data{4}.stimulusInt(j,k) data{5}.stimulusInt(j,k)]);
        nmseforce(j,k) = mean([data{1}.forceInt(j,k) data{2}.forceInt(j,k) data{3}.forceInt(j,k) data{4}.forceInt(j,k) data{5}.forceInt(j,k)]);
    end
end

figure(3)
surf(radius_circle,grid_length,nmsestimulus);
title('stimulus')
ylabel('grid length')
xlabel('radius circle')

figure(4)
surf(radius_circle,grid_length,nmseforce);
title('force')
ylabel('grid length')
xlabel('radius circle')


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
mesh(radius_circle,grid_length,nmsestimulus);
title('stimulus')
ylabel('grid length')
xlabel('radius circle')

figure(8)
mesh(radius_circle,grid_length,nmseforce);
title('force')
ylabel('grid length')
xlabel('radius circle')

grid_length_m = repmat(grid_length,numel(grid_length),1)';
grid_length_int_m = repmat(grid_length_int,numel(grid_length_int),1)';
radius_circle_m = repmat(radius_circle,numel(radius_circle),1);
radius_circle_int_m = repmat(radius_circle_int,numel(radius_circle_int),1);

% nmsestimulusInt = interp2(grid_length_m,radius_circle_m,nmsestimulus,grid_length_int_m,radius_circle_int_m);
% nmseforceInt = interp2(grid_length_m,radius_circle_m,nmseforce,grid_length_int_m,radius_circle_int_m);

nmsestimulusInt = interp2(radius_circle_m,grid_length_m,nmsestimulus,radius_circle_int_m,grid_length_int_m);
nmseforceInt = interp2(radius_circle_m,grid_length_m,nmseforce,radius_circle_int_m,grid_length_int_m);

figure(9)
surf(radius_circle_int,grid_length_int,nmsestimulusInt);
title('stimulus')
ylabel('grid length')
xlabel('radius circle')

figure(10)
surf(radius_circle_int,grid_length_int,nmseforceInt);
title('force')
ylabel('grid length')
xlabel('radius circle')

save('nmseanalysis0514.mat','data');