function [maximums] = obtainMaximum(dataset,n,exp)

load(dataset)
maximums = zeros(5,n);

defaultSingleRow = [30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 55, 55, 55, 55, 55, 55, 55, 55, 55, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 105, 105, 105, 105, 105, 105, 105, 105, 105, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 155, 155, 155, 155, 155, 155, 155, 155, 155, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 205, 205, 205, 205, 205, 205, 205, 205, 205, 230, 230, 230, 230, 230, 230, 230, 230, 230, 230, 255, 255, 255, 255, 255, 255, 255, 255, 255, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 305, 305, 305, 305, 305, 305, 305, 305, 305, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 355, 355, 355, 355, 355, 355, 355, 355, 355, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 405, 405, 405, 405, 405, 405, 405, 405, 405, 430, 430, 430, 430, 430, 430, 430, 430, 430, 430, 455, 455, 455, 455, 455, 455, 455, 455, 455, 480, 480, 480, 480, 480, 480, 480, 480, 480, 480];
defaultSingleColumn = [25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475];

defaultRow = reshape(repmat(defaultSingleRow,3,1),1,numel(defaultSingleRow)*3);
defaultColumn = reshape(repmat(defaultSingleColumn,3,1),1,numel(defaultSingleColumn)*3);

if exp == 1
    features = features_1;
    stim = stim_1;
else
    features = features_2;
    stim = stim_2;
end
    
features = load([fileparts(dataset) filesep num2str(exp) filesep 'features' filesep 'Grid543Circle50.txt']);

%%
for k = 1:5
matrixcoef = [stim(:,k) features];
matrixcorrcoef = corrcoef(matrixcoef);
vectorOrder = (1:(size(matrixcorrcoef,2)-1))';
vectorCC = abs(matrixcorrcoef(2:end,1));
matrixccfirstvector = [vectorOrder vectorCC];

%sort by value of vector (in column 2)
[matrixY,matrixI] = sort(matrixccfirstvector(:,2));  
 
%reorder according to the indexes of the sorted vector
vectorOrder=vectorOrder(matrixI,:);    
max_n = vectorOrder((end-n+1:end),1); %the largest n
maximums(k,:) = max_n';

% maximum(1,k) = find (abs(matrixcorrcoef(2:end,1)) == max(abs(matrixcorrcoef(2:end,1)))) - 1;

end
maximums = sort(maximums,2);
%name = strcat('maximums', num2str(n));
path = [dataset(1:end-11) num2str(exp) '\maximums\50\maximums' num2str(n) '.mat'];
save(path, 'maximums');
end