function FingerVariation( xlsfile )

setplots = 2;

switch setplots
    case 1
        if ~exist('xlsfile', 'var')
            xlsfile = 'D:\Ultrasound_Images\EXCEL\0619-Analysis different radius selection-noselection sepTraining.xls';
        end
        plotaxis = [1 10 0.15 0.55];
    case 2
        if ~exist('xlsfile', 'var')
            xlsfile = 'D:\Ultrasound_Images\EXCEL\0620-Analysis different radius selection-noselection sepTraining zeros.xls';
        end
        plotaxis = [1 10 0.10 0.65];
end
mat = cell(1,6);
radius = [10,20,30,40,50];

% Load data from xls file
mat{1}.unifMean = xlsread(xlsfile,4,'D9:H18');
mat{1}.unifStd = xlsread(xlsfile,4,'L9:P18');
mat{1}.selMean = xlsread(xlsfile,4,'D19:H28');
mat{1}.selStd = xlsread(xlsfile,4,'L19:P28');

mat{2}.unifMean = xlsread(xlsfile,4,'V9:Z18');
mat{2}.unifStd = xlsread(xlsfile,4,'AD9:AH18');
mat{2}.selMean = xlsread(xlsfile,4,'V19:Z28');
mat{2}.selStd = xlsread(xlsfile,4,'AD19:AH28');

mat{3}.unifMean = xlsread(xlsfile,4,'D37:H46');
mat{3}.unifStd = xlsread(xlsfile,4,'L37:P46');
mat{3}.selMean = xlsread(xlsfile,4,'D47:H56');
mat{3}.selStd = xlsread(xlsfile,4,'L47:P56');

mat{4}.unifMean = xlsread(xlsfile,4,'V37:Z46');
mat{4}.unifStd = xlsread(xlsfile,4,'AD37:AH46');
mat{4}.selMean = xlsread(xlsfile,4,'V47:Z56');
mat{4}.selStd = xlsread(xlsfile,4,'AD47:AH56');

mat{5}.unifMean = xlsread(xlsfile,4,'D66:H75');
mat{5}.unifStd = xlsread(xlsfile,4,'L66:P75');
mat{5}.selMean = xlsread(xlsfile,4,'D76:H85');
mat{5}.selStd = xlsread(xlsfile,4,'L76:P85');

mat{6}.unifMean = xlsread(xlsfile,4,'V66:Z75');
mat{6}.unifStd = xlsread(xlsfile,4,'AD66:AH75');
mat{6}.selMean = xlsread(xlsfile,4,'V76:Z85');
mat{6}.selStd = xlsread(xlsfile,4,'AD76:AH85');



% All figures
figure;
for i = 1:5  % 5 fingers
    for j = 1:size(radius,2)
        subplot(5,size(radius,2),(i-1)*5+j); hold on
        errorbar(mat{i}.unifMean(:,j),mat{i}.unifStd(:,j),'b');
        errorbar(mat{i}.selMean(:,j),mat{i}.selStd(:,j),'r');
        axis(plotaxis);
        set(gca,'XTick',[1:10]);
        set(gca,'XTickLabel',{ '543', '75', '48', '39', '27', '15', '12', '9', '6', '3' });
        set(gca,'LineWidth',2);
    end
end
l = legend('Uniform features', 'Selected features'); set(l,'position',[0.7963    0.0585    0.1710    0.1990]);
subplot(5,5,1); title('Radius 10');
subplot(5,5,2); title('Radius 20');
subplot(5,5,3); title('Radius 30');
subplot(5,5,4); title('Radius 40');
subplot(5,5,5); title('Radius 50');
subplot(5,5,1); ylabel('Thumb');
subplot(5,5,6); ylabel('Index');
subplot(5,5,11); ylabel('Middle');
subplot(5,5,16); ylabel('Ring');
subplot(5,5,21); ylabel('Little');



% Mean figures separated by radius
figure;
for j = 1:size(radius,2)
    subplot(3,2,j); hold on
    errorbar(mat{6}.unifMean(:,j),mat{6}.unifStd(:,j),'b');
    errorbar(mat{6}.selMean(:,j),mat{6}.selStd(:,j),'r');
    axis(plotaxis);
    set(gca,'XTick',[1:10]);
    set(gca,'XTickLabel',{ '543', '75', '48', '39', '27', '15', '12', '9', '6', '3' });
    set(gca,'LineWidth',2);
    grid on
end
l = legend('Uniform features', 'Selected features'); set(l,'position',[0.7963    0.0585    0.1710    0.1910]);
subplot(3,2,1); title('Radius 10');
subplot(3,2,2); title('Radius 20');
subplot(3,2,3); title('Radius 30');
subplot(3,2,4); title('Radius 40');
subplot(3,2,5); title('Radius 50');



% Mean figures separated by selected/uniform
figure;
set(gca,'FontSize',20);
set(gca,'FontName','times'); 
subplot(1,2,1) % Uniform
c = colormap(hsv(size(radius,2)));
for j = 1:size(radius,2)
    hold on
    errorbar(mat{6}.unifMean(:,j),mat{6}.unifStd(:,j),'Color',c(j,:));
    axis(plotaxis);
end
set(gca,'XTick',[1:10]);
set(gca,'XTickLabel',{ '543', '75', '48', '39', '27', '15', '12', '9', '6', '3' });
set(gca,'LineWidth',2);
title('Uniform features');
grid on
subplot(1,2,2) % Selected
for j = 1:size(radius,2)
    hold on
    errorbar(mat{6}.selMean(:,j),mat{6}.selStd(:,j),'Color',c(j,:));
end
axis(plotaxis);
set(gca,'XTick',[1:10]);
set(gca,'XTickLabel',{ '543', '75', '48', '39', '27', '15', '12', '9', '6', '3' });
set(gca,'LineWidth',2);
title('Selected features');
legend('Radius 10', 'Radius 20', 'Radius 30', 'Radius 40', 'Radius 50');
grid on
end

