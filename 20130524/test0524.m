function gino
pathroot = 'C:\datasets\rashida\';
load([pathroot 'claudio.mat']);
debg = true;
%This is faster than loading everything again!
if debg
    path = [pathroot '1\lastfeat'];
    files = dir(path);
end
    %load new_features\v0517\Grid60Circle36.txt
%     features = Grid60Circle36;
%     features_1 = features;

for i = 3:numel(files)
    features = load(strcat(path,'\',files(i).name));
    %features = files{i}.name;
    features_1 = features;
    if (files(i).name(6) == '2') || (files(i).name(6) == '7')
        grid_debug = str2double(files(i).name(5:8));
        if (files(i).name(16) == '2') || (files(i).name(16) == '7')
            radius_debug = str2double(files(i).name(15:18));
        else
            radius_debug = str2double(files(i).name(15:16));
        end    
    else
        grid_debug = str2double(files(i).name(5:6));
        if (files(i).name(14) == '2') || (files(i).name(14) == '7')
            radius_debug = str2double(files(i).name(13:16));
        else
            radius_debug = str2double(files(i).name(13:14));
        end    
    end
    
    
% Filter forces
% figure,plot(force_1),axis([0 14000 0 25])
% figure,plot(force_2),axis([0 14000 0 25])
fc = 1; % Cut-off frequency (Hz)
fs = 30; % Sampling rate (Hz)
order = 1; % Filter order
[num,den] = butter(order,2*fc/fs);
force_1=filtfilt(num,den,force_1);
force_2=filtfilt(num,den,force_2);
features_1 = filtfilt(num,den,features_1);
features_2 = filtfilt(num,den,features_2);

% find patterns and sessions
finger_1 = stim_1(:,6);
repetition_1 = stim_1(:,7);
finger_2 = stim_2(:,6);
repetition_2 = stim_2(:,7);

%% whole data sets #1
X_1 = features_1;
X_1 = [X_1 ones(size(X_1,1),1) ];
ys_1 = stim_1(:,[1:5]);
% "blow" force signal (which was single) to five columns, one per finger.
% assume force is 0 when a finger was not pressing.
yf_1 = zeros(size(force_1,1),5);
yf_1(find(finger_1==1),1) = force_1(find(finger_1==1));
yf_1(find(finger_1==2),2) = force_1(find(finger_1==2));
yf_1(find(finger_1==3),3) = force_1(find(finger_1==3));
yf_1(find(finger_1==4),4) = force_1(find(finger_1==4));
yf_1(find(finger_1==5),5) = force_1(find(finger_1==5));
%% whole data sets #2
X_2 = features_2;
X_2 = [X_2 ones(size(X_2,1),1) ];
ys_2 = stim_2(:,[1:5]);
yf_2 = zeros(size(force_2,1),5);
yf_2(find(finger_2==1),1) = force_2(find(finger_2==1));
yf_2(find(finger_2==2),2) = force_2(find(finger_2==2));
yf_2(find(finger_2==3),3) = force_2(find(finger_2==3));
yf_2(find(finger_2==4),4) = force_2(find(finger_2==4));
yf_2(find(finger_2==5),5) = force_2(find(finger_2==5));

%%

L = find(finger_1==5 & stim_on_1==1); L11 = L(L<limit_1); 
R = find(finger_1==4 & stim_on_1==1); R11 = R(R<limit_1); 
M = find(finger_1==3 & stim_on_1==1); M11 = M(M<limit_1); 
I = find(finger_1==2 & stim_on_1==1); I11 = I(I<limit_1); 
T = find(finger_1==1 & stim_on_1==1); T11 = T(T<limit_1); 

L = find(finger_1==5); L12 = L(L>limit_1);
R = find(finger_1==4); R12 = R(R>limit_1);
M = find(finger_1==3); M12 = M(M>limit_1);
I = find(finger_1==2); I12 = I(I>limit_1);
T = find(finger_1==1); T12 = T(T>limit_1);

L = find(finger_2==5 & stim_on_2==1); L21 = L(L<limit_2); 
R = find(finger_2==4 & stim_on_2==1); R21 = R(R<limit_2); 
M = find(finger_2==3 & stim_on_2==1); M21 = M(M<limit_2); 
I = find(finger_2==2 & stim_on_2==1); I21 = I(I<limit_2); 
T = find(finger_2==1 & stim_on_2==1); T21 = T(T<limit_2); 

L = find(finger_2==5); L22 = L(L>limit_2);
R = find(finger_2==4); R22 = R(R>limit_2);
M = find(finger_2==3); M22 = M(M>limit_2);
I = find(finger_2==2); I22 = I(I>limit_2);
T = find(finger_2==1); T22 = T(T>limit_2);

OO1 = [L11;R11;M11;I11;T11];
GR1 = [L12;R12;M12;I12;T12];
OO2 = [L21;R21;M21;I21;T21];
GR2 = [L22;R22;M22;I22;T22];

%% 1->2
% Training with the on-off stimulus #1, testing on the graded stimulus #1
% and #2
trainus(X_1,ys_1,X_1,ys_1,OO1,GR1,debg,grid_debug,radius_debug);
%trainus(X_1,ys_1,X_2,ys_2,OO1,GR2)
% Training with the on-off force #1, testing on the graded force #1
% and #2
%trainus(X_1,yf_1,X_1,yf_1,OO1,GR1,debg,grid_debug,radius_debug);
%trainus(X_1,yf_1,X_2,yf_2,OO1,GR2)

%% 2->1
% Training with the on-off stimulus #2, testing on the graded stimulus #2
% and #1
%trainus(X_2,ys_2,X_2,ys_2,OO2,GR2)
%trainus(X_2,ys_2,X_1,ys_1,OO2,GR1)
% Training with the on-off force #2, testing on the graded force #2
% and #1
%trainus(X_2,yf_2,X_2,yf_2,OO2,GR2)
%trainus(X_2,yf_2,X_1,yf_1,OO2,GR1)
disp(strcat(num2str(i*100/numel(files)),'%'))


end

function trainus(Xt,yt,Xp,yp,tset,pset,debg, grid_debug,radius_debug)
% X_trainp: training features, y_trainp: training targets
% X_testp: testing features, y_testp: testing targets
% trainset: cell with 5 elements, each containing the rows of the
% features/targets for training in each of the 5DoF
% testset: cell with 5 elements, each containing the rows of the
% features/targets for testing in each of the 5DoF
grid_length = [35:2.5:75];
radius_circle = [15:2.5:45];
nMSE = [];
d = size(Xt,2);
lambda = 1;
lab={'Little','Ring','Middle','Index','Thumb'};

%figure
for k=1:5 % finger to be analyzed      
        %train
        X = Xt(tset,:); y = yt(tset,k);
        w = inv( X'*X + lambda*eye(d) ) * X' * y;
        
        %test on target
        X_test = Xp(pset,:); y_test = yp(pset,k);
        y_hat = w'*X_test';
        
        nMSE(end+1) = sqrt(mean( (y_test-y_hat').^2 ));
        if debg
            load nmseanalysis0527rashida.mat
                data{k}.stimulus(find(grid_debug==grid_length),find(radius_debug==radius_circle))=nMSE(end);
            save('nmseanalysis0527rashida.mat','data');
        end
        
        %subplot(2,3,k),hold on, plot(y_test,'r'),plot(y_hat),hold off;
        %title(strcat(lab{k},'  ',num2str(nMSE(end))))
        pi;
end