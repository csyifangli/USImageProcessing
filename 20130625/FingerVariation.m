function FingerVariation( xlsfile )

setplots = 2;

switch setplots
    case 1
        if ~exist('xlsfile', 'var')
            xlsfile = 'D:\Ultrasound_Images\EXCEL\0619-Analysis different radius selection-noselection sepTraining.xls';
            textSup = 'Training in activation On-Off, testing in activation Graded';
            
        end
        plotaxis = [1 10 0.15 0.55];
    case 2
        if ~exist('xlsfile', 'var')
            xlsfile = 'D:\Ultrasound_Images\EXCEL\0620-Analysis different radius selection-noselection sepTraining zeros.xls';
            textSup = 'Training in activation On-Off, testing in non-activation Graded';
        end
        plotaxis = [1 10 0.10 0.65];
end

positionaxis = [0.8563    0.0585    0.1610    0.1910];
mat = cell(1,6);
radius = [10,20,30,40,50];

% Load data from xls file
mat{1}.unifMean = xlsread(xlsfile,4,'D9:H18');
mat{1}.unifStd = xlsread(xlsfile,4,'L9:P18');
mat{1}.selMean = xlsread(xlsfile,4,'D19:H28');
mat{1}.selStd = xlsread(xlsfile,4,'L19:P28');
mat{1}.selSepMean = xlsread(xlsfile,4,'D29:H38');
mat{1}.selSepStd = xlsread(xlsfile,4,'L29:P38');

mat{2}.unifMean = xlsread(xlsfile,4,'V9:Z18');
mat{2}.unifStd = xlsread(xlsfile,4,'AD9:AH18');
mat{2}.selMean = xlsread(xlsfile,4,'V19:Z28');
mat{2}.selStd = xlsread(xlsfile,4,'AD19:AH28');
mat{2}.selSepMean = xlsread(xlsfile,4,'V29:Z38');
mat{2}.selSepStd = xlsread(xlsfile,4,'AD29:AH38');

mat{3}.unifMean = xlsread(xlsfile,4,'D47:H56');
mat{3}.unifStd = xlsread(xlsfile,4,'L47:P56');
mat{3}.selMean = xlsread(xlsfile,4,'D57:H66');
mat{3}.selStd = xlsread(xlsfile,4,'L57:P66');
mat{3}.selSepMean = xlsread(xlsfile,4,'D67:H76');
mat{3}.selSepStd = xlsread(xlsfile,4,'L67:P76');

mat{4}.unifMean = xlsread(xlsfile,4,'V47:Z56');
mat{4}.unifStd = xlsread(xlsfile,4,'AD47:AH56');
mat{4}.selMean = xlsread(xlsfile,4,'V57:Z66');
mat{4}.selStd = xlsread(xlsfile,4,'AD57:AH66');
mat{4}.selSepMean = xlsread(xlsfile,4,'V67:Z76');
mat{4}.selSepStd = xlsread(xlsfile,4,'AD67:AH76');

mat{5}.unifMean = xlsread(xlsfile,4,'D84:H93');
mat{5}.unifStd = xlsread(xlsfile,4,'L84:P93');
mat{5}.selMean = xlsread(xlsfile,4,'D94:H103');
mat{5}.selStd = xlsread(xlsfile,4,'L94:P103');
mat{5}.selSepMean = xlsread(xlsfile,4,'D104:H113');
mat{5}.selSepStd = xlsread(xlsfile,4,'L104:P113');

mat{6}.unifMean = xlsread(xlsfile,4,'V84:Z93');
mat{6}.unifStd = xlsread(xlsfile,4,'AD84:AH93');
mat{6}.selMean = xlsread(xlsfile,4,'V94:Z103');
mat{6}.selStd = xlsread(xlsfile,4,'AD94:AH103');
mat{6}.selSepMean = xlsread(xlsfile,4,'V104:Z113');
mat{6}.selSepStd = xlsread(xlsfile,4,'AD104:AH113');



% All figures
figure;
for i = 1:5  % 5 fingers
    for j = 1:size(radius,2)
        subplot(5,size(radius,2),(i-1)*5+j); hold on
        errorbar(mat{i}.unifMean(:,j),mat{i}.unifStd(:,j),'b');
        errorbar(mat{i}.selMean(:,j),mat{i}.selStd(:,j),'r');
        errorbar(mat{i}.selSepMean(:,j),mat{i}.selSepStd(:,j),'k');
        axis(plotaxis);
        set(gca,'XTick',[1:10]);
        set(gca,'XTickLabel',{ '543', '75', '48', '39', '27', '15', '12', '9', '6', '3' });
        set(gca,'LineWidth',2);
    end
end
l = legend('Uniform features', 'Selected features', 'Selected single features'); set(l,'position',positionaxis);
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
suptitle(textSup);


% Mean figures separated by radius
figure;
for j = 1:size(radius,2)
    subplot(3,2,j); hold on
    errorbar(mat{6}.unifMean(:,j),mat{6}.unifStd(:,j),'b');
    errorbar(mat{6}.selMean(:,j),mat{6}.selStd(:,j),'r');
    errorbar(mat{6}.selSepMean(:,j),mat{6}.selSepStd(:,j),'k');
    axis(plotaxis);
    set(gca,'XTick',[1:10]);
    set(gca,'XTickLabel',{ '543', '75', '48', '39', '27', '15', '12', '9', '6', '3' });
    set(gca,'LineWidth',2);
    grid on
end
l = legend('Uniform features', 'Selected features', 'Selected single features'); set(l,'position',positionaxis);
subplot(3,2,1); title('Radius 10');
subplot(3,2,2); title('Radius 20');
subplot(3,2,3); title('Radius 30');
subplot(3,2,4); title('Radius 40');
subplot(3,2,5); title('Radius 50');
suptitle(textSup);


% Mean figures separated by selected/uniform
figure;
title('dfd');
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
l = legend('Radius 10', 'Radius 20', 'Radius 30', 'Radius 40', 'Radius 50'); set(l,'position',positionaxis);
grid on
suptitle(textSup);
end

