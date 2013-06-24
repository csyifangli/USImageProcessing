clear all;close all; clc
%%
filename = 'D:\Ultrasound images\nmse.xls';
grid_length = [35:5:65];
radius_circle = [15:5:45];

%%
%Little
data{1}.stimulus = xlsread(filename,1,'B3:H9');
data{1}.force = xlsread(filename,1,'L3:R9');
%Ring
data{2}.stimulus = xlsread(filename,1,'B13:H19');
data{2}.force = xlsread(filename,1,'L13:R19');
%Middle
data{3}.stimulus = xlsread(filename,1,'B23:H29');
data{3}.force = xlsread(filename,1,'L23:R29');
%Index
data{4}.stimulus = xlsread(filename,1,'B33:H39');
data{4}.force = xlsread(filename,1,'L33:R39');
%Thumb
data{5}.stimulus = xlsread(filename,1,'B43:H49');
data{5}.force = xlsread(filename,1,'L43:R49');


for i = 1:5
    figure(1);
    subplot(2,3,i);
    surf(grid_length,radius_circle,data{i}.stimulus);
    xlabel('grid_length')
    ylabel('radius_circle')
    
    figure(2);
    subplot(2,3,i);
    surf(grid_length,radius_circle,data{i}.force);
    xlabel('grid_length')
    ylabel('radius_circle')
end

for j = 1:numel(grid_length)
    for k = 1:numel(radius_circle)
        nmsestimulus(j,k) = mean([data{1}.stimulus(j,k) data{2}.stimulus(j,k) data{3}.stimulus(j,k) data{4}.stimulus(j,k) data{5}.stimulus(j,k)]);
        nmseforce(j,k) = mean([data{1}.force(j,k) data{2}.force(j,k) data{3}.force(j,k) data{4}.force(j,k) data{5}.force(j,k)]);
    end
end

figure(3)
waterfall(grid_length,radius_circle,nmsestimulus);
title('stimulus')
xlabel('grid length')
ylabel('radius circle')

figure(4)
waterfall(grid_length,radius_circle,nmseforce);
title('force')
xlabel('grid length')
ylabel('radius circle')

clear i j k;
%%
% Space for the new values!
for i = 1:numel(grid_length)
    for j = 1:numel(radius_circle)
        for k = 1:5
            data{k}.stimulusv2(i*2-1,j*2-1) = data{k}.stimulus(i,j);
            data{k}.forcev2(i*2-1,j*2-1) = data{k}.force(i,j);
        end
    end
end

save('nmseanalysis.mat','data');
