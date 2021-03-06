function [nMSE, nMSE2] = gino

load claudio

% Filter forces
% figure,plot(force_1),axis([0 14000 0 25])
% figure,plot(force_2),axis([0 14000 0 25])
fc = 1; % Cut-off frequency (Hz)
fs = 30; % Sampling rate (Hz)
order = 1; % Filter order
[num,den] = butter(order,2*fc/fs);
maximumsCell = cell(5,9);
maximumsCell2 = cell(5,9);
features1 = cell(1,5);
features1 = cell(1,5);

features1{1} = load('E:\data\claudio\1\features\Grid543Circle10.txt');
features1{2} = load('E:\data\claudio\1\features\Grid543Circle20.txt');
features1{3} = load('E:\data\claudio\1\features\Grid543Circle30.txt');
features1{4} = load('E:\data\claudio\1\features\Grid543Circle40.txt');
features1{5} = load('E:\data\claudio\1\features\Grid543Circle50.txt');

features2{1} = load('E:\data\claudio\2\features\Grid543Circle10.txt');
features2{2} = load('E:\data\claudio\2\features\Grid543Circle20.txt');
features2{3} = load('E:\data\claudio\2\features\Grid543Circle30.txt');
features2{4} = load('E:\data\claudio\2\features\Grid543Circle40.txt');
features2{5} = load('E:\data\claudio\2\features\Grid543Circle50.txt');

%%
load 1\maximumsf\10\maximums3.mat;
maximumsCell{1,9} = maximums;
load 1\maximumsf\10\maximums6.mat;
maximumsCell{1,8} = maximums;
load 1\maximumsf\10\maximums9.mat;
maximumsCell{1,7} = maximums;
load 1\maximumsf\10\maximums12.mat;
maximumsCell{1,6} = maximums;
load 1\maximumsf\10\maximums15.mat;
maximumsCell{1,5} = maximums;
load 1\maximumsf\10\maximums27.mat;
maximumsCell{1,4} = maximums;
load 1\maximumsf\10\maximums39.mat;
maximumsCell{1,3} = maximums;
load 1\maximumsf\10\maximums48.mat;
maximumsCell{1,2} = maximums;
load 1\maximumsf\10\maximums75.mat;
maximumsCell{1,1} = maximums;

load 1\maximumsf\20\maximums3.mat;
maximumsCell{2,9} = maximums;
load 1\maximumsf\20\maximums6.mat;
maximumsCell{2,8} = maximums;
load 1\maximumsf\20\maximums9.mat;
maximumsCell{2,7} = maximums;
load 1\maximumsf\20\maximums12.mat;
maximumsCell{2,6} = maximums;
load 1\maximumsf\20\maximums15.mat;
maximumsCell{2,5} = maximums;
load 1\maximumsf\20\maximums27.mat;
maximumsCell{2,4} = maximums;
load 1\maximumsf\20\maximums39.mat;
maximumsCell{2,3} = maximums;
load 1\maximumsf\20\maximums48.mat;
maximumsCell{2,2} = maximums;
load 1\maximumsf\20\maximums75.mat;
maximumsCell{2,1} = maximums;

load 1\maximumsf\30\maximums3.mat;
maximumsCell{3,9} = maximums;
load 1\maximumsf\30\maximums6.mat;
maximumsCell{3,8} = maximums;
load 1\maximumsf\30\maximums9.mat;
maximumsCell{3,7} = maximums;
load 1\maximumsf\30\maximums12.mat;
maximumsCell{3,6} = maximums;
load 1\maximumsf\30\maximums15.mat;
maximumsCell{3,5} = maximums;
load 1\maximumsf\30\maximums27.mat;
maximumsCell{3,4} = maximums;
load 1\maximumsf\30\maximums39.mat;
maximumsCell{3,3} = maximums;
load 1\maximumsf\30\maximums48.mat;
maximumsCell{3,2} = maximums;
load 1\maximumsf\30\maximums75.mat;
maximumsCell{3,1} = maximums;

load 1\maximumsf\40\maximums3.mat;
maximumsCell{4,9} = maximums;
load 1\maximumsf\40\maximums6.mat;
maximumsCell{4,8} = maximums;
load 1\maximumsf\40\maximums9.mat;
maximumsCell{4,7} = maximums;
load 1\maximumsf\40\maximums12.mat;
maximumsCell{4,6} = maximums;
load 1\maximumsf\40\maximums15.mat;
maximumsCell{4,5} = maximums;
load 1\maximumsf\40\maximums27.mat;
maximumsCell{4,4} = maximums;
load 1\maximumsf\40\maximums39.mat;
maximumsCell{4,3} = maximums;
load 1\maximumsf\40\maximums48.mat;
maximumsCell{4,2} = maximums;
load 1\maximumsf\40\maximums75.mat;
maximumsCell{4,1} = maximums;

load 1\maximumsf\50\maximums3.mat;
maximumsCell{5,9} = maximums;
load 1\maximumsf\50\maximums6.mat;
maximumsCell{5,8} = maximums;
load 1\maximumsf\50\maximums9.mat;
maximumsCell{5,7} = maximums;
load 1\maximumsf\50\maximums12.mat;
maximumsCell{5,6} = maximums;
load 1\maximumsf\50\maximums15.mat;
maximumsCell{5,5} = maximums;
load 1\maximumsf\50\maximums27.mat;
maximumsCell{5,4} = maximums;
load 1\maximumsf\50\maximums39.mat;
maximumsCell{5,3} = maximums;
load 1\maximumsf\50\maximums48.mat;
maximumsCell{5,2} = maximums;
load 1\maximumsf\50\maximums75.mat;
maximumsCell{5,1} = maximums;


load 2\maximumsf\10\maximums3.mat;
maximumsCell2{1,9} = maximums;
load 2\maximumsf\10\maximums6.mat;
maximumsCell2{1,8} = maximums;
load 2\maximumsf\10\maximums9.mat;
maximumsCell2{1,7} = maximums;
load 2\maximumsf\10\maximums12.mat;
maximumsCell2{1,6} = maximums;
load 2\maximumsf\10\maximums15.mat;
maximumsCell2{1,5} = maximums;
load 2\maximumsf\10\maximums27.mat;
maximumsCell2{1,4} = maximums;
load 2\maximumsf\10\maximums39.mat;
maximumsCell2{1,3} = maximums;
load 2\maximumsf\10\maximums48.mat;
maximumsCell2{1,2} = maximums;
load 2\maximumsf\10\maximums75.mat;
maximumsCell2{1,1} = maximums;

load 2\maximumsf\20\maximums3.mat;
maximumsCell2{2,9} = maximums;
load 2\maximumsf\20\maximums6.mat;
maximumsCell2{2,8} = maximums;
load 2\maximumsf\20\maximums9.mat;
maximumsCell2{2,7} = maximums;
load 2\maximumsf\20\maximums12.mat;
maximumsCell2{2,6} = maximums;
load 2\maximumsf\20\maximums15.mat;
maximumsCell2{2,5} = maximums;
load 2\maximumsf\20\maximums27.mat;
maximumsCell2{2,4} = maximums;
load 2\maximumsf\20\maximums39.mat;
maximumsCell2{2,3} = maximums;
load 2\maximumsf\20\maximums48.mat;
maximumsCell2{2,2} = maximums;
load 2\maximumsf\20\maximums75.mat;
maximumsCell2{2,1} = maximums;

load 2\maximumsf\30\maximums3.mat;
maximumsCell2{3,9} = maximums;
load 2\maximumsf\30\maximums6.mat;
maximumsCell2{3,8} = maximums;
load 2\maximumsf\30\maximums9.mat;
maximumsCell2{3,7} = maximums;
load 2\maximumsf\30\maximums12.mat;
maximumsCell2{3,6} = maximums;
load 2\maximumsf\30\maximums15.mat;
maximumsCell2{3,5} = maximums;
load 2\maximumsf\30\maximums27.mat;
maximumsCell2{3,4} = maximums;
load 2\maximumsf\30\maximums39.mat;
maximumsCell2{3,3} = maximums;
load 2\maximumsf\30\maximums48.mat;
maximumsCell2{3,2} = maximums;
load 2\maximumsf\30\maximums75.mat;
maximumsCell2{3,1} = maximums;

load 2\maximumsf\40\maximums3.mat;
maximumsCell2{4,9} = maximums;
load 2\maximumsf\40\maximums6.mat;
maximumsCell2{4,8} = maximums;
load 2\maximumsf\40\maximums9.mat;
maximumsCell2{4,7} = maximums;
load 2\maximumsf\40\maximums12.mat;
maximumsCell2{4,6} = maximums;
load 2\maximumsf\40\maximums15.mat;
maximumsCell2{4,5} = maximums;
load 2\maximumsf\40\maximums27.mat;
maximumsCell2{4,4} = maximums;
load 2\maximumsf\40\maximums39.mat;
maximumsCell2{4,3} = maximums;
load 2\maximumsf\40\maximums48.mat;
maximumsCell2{4,2} = maximums;
load 2\maximumsf\40\maximums75.mat;
maximumsCell2{4,1} = maximums;

load 2\maximumsf\50\maximums3.mat;
maximumsCell2{5,9} = maximums;
load 2\maximumsf\50\maximums6.mat;
maximumsCell2{5,8} = maximums;
load 2\maximumsf\50\maximums9.mat;
maximumsCell2{5,7} = maximums;
load 2\maximumsf\50\maximums12.mat;
maximumsCell2{5,6} = maximums;
load 2\maximumsf\50\maximums15.mat;
maximumsCell2{5,5} = maximums;
load 2\maximumsf\50\maximums27.mat;
maximumsCell2{5,4} = maximums;
load 2\maximumsf\50\maximums39.mat;
maximumsCell2{5,3} = maximums;
load 2\maximumsf\50\maximums48.mat;
maximumsCell2{5,2} = maximums;
load 2\maximumsf\50\maximums75.mat;
maximumsCell2{5,1} = maximums;


nMSE = zeros(numel(maximumsCell),5);
nMSE2 = zeros(numel(maximumsCell),5);
index = 0;


%%
for i = 1:size(maximumsCell,1)
features_1 = features1{i};
features_2 = features2{i};

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
OO1 = cell(1,5);
GR1 = cell(1,5);
OO2 = cell(1,5);
GR2 = cell(1,5);
OO1{5} = L11;
OO1{4} = R11;
OO1{3} = M11;
OO1{2} = I11;
OO1{1} = T11;
GR1{5} = L12;
GR1{4} = R12;
GR1{3} = M12;
GR1{2} = I12;
GR1{1} = T12;
OO2{5} = L21;
OO2{4} = R21;
OO2{3} = M21;
OO2{2} = I21;
OO2{1} = T21;
GR2{5} = L22;
GR2{4} = R22;
GR2{3} = M22;
GR2{2} = I22;
GR2{1} = T22;
% OO1 = [L11;R11;M11;I11;T11];
% GR1 = [L12;R12;M12;I12;T12];
% OO2 = [L21;R21;M21;I21;T21];
% GR2 = [L22;R22;M22;I22;T22];


%% 1->2
for j = 1:size(maximumsCell,2)
% Training with the on-off stimulus #1, testing on the graded stimulus #1
% and #2
    index = index+1;


    nMSE(index,:) = trainus(X_1,yf_1,X_1,yf_1,OO1,GR1,maximumsCell{i,j});
    nMSE2(index,:) = trainus(X_2,yf_2,X_2,yf_2,OO2,GR2,maximumsCell2{i,j});
    disp(num2str(100*index/numel(maximumsCell)));
 %trainus(X_1,ys_1,X_2,ys_2,OO1,GR2)
% Training with the on-off force #1, testing on the graded force #1
% and #2
%  trainus(X_1,yf_1,X_1,yf_1,OO1,GR1);
 %trainus(X_1,yf_1,X_2,yf_2,OO1,GR2)
end
 
end
%% 2->1
% Training with the on-off stimulus #2, testing on the graded stimulus #2
% and #1
%  nMSE2 = trainus(X_2,ys_2,X_2,ys_2,OO2,GR2,maximums_2);
%  trainus(X_2,ys_2,X_1,ys_1,OO2,GR1)
% Training with the on-off force #2, testing on the graded force #2
% and #1
 %trainus(X_2,yf_2,X_2,yf_2,OO2,GR2)
%trainus(X_2,yf_2,X_1,yf_1,OO2,GR1)

function nMSE = trainus(Xt,yt,Xp,yp,tsetP,psetP,maximums)
% X_trainp: training features, y_trainp: training targets
% X_testp: testing features, y_testp: testing targets
% trainset: cell with 5 elements, each containing the rows of the
% features/targets for training in each of the 5DoF
% testset: cell with 5 elements, each containing the rows of the
% features/targets for testing in each of the 5DoF
nMSE = [];

lambda = 1;
lab={'Little','Ring','Middle','Index','Thumb'};

% figure
for k=1:5 % finger to be analyzed      
        tset=[];
        pset=[];

        for l = 1:5
            if (l~=k)
                pset=[pset; psetP{l}];
            end
            tset = [tset; tsetP{l}];
        end
    
        Xf = zeros(size(Xt,1),size(maximums,2));
        
        Xf = Xt(:,maximums(k,:));
        Xpf = Xp(:,maximums(k,:));
        %train
        X = Xf(tset,:); y = yt(tset,k);

        
        d = size(Xf,2);
        w = inv( X'*X + lambda*eye(d) ) * X' * y;
        
        %test on target
        X_test = Xpf(pset,:); y_test = yp(pset,k);
        y_hat = w'*X_test';
        
        nMSE(end+1) = sqrt(mean( (y_test-y_hat').^2 ))/(max(yt(:,k))-min(yt(:,k)));
        
%         subplot(2,3,k),hold on, plot(y_test,'r'),plot(y_hat),hold off;
%         title(strcat(lab{k},'  ',num2str(nMSE(end))))
        
end