function [maximumWDup,vectorRow,vectorColumn,finalRow,finalColumn, parameters] = obtainMaximum(dataset,n,exp)

load(dataset)
maximum = zeros(1,5*n);

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
maximum(k*n-(n-1):k*n) = max_n;

% maximum(1,k) = find (abs(matrixcorrcoef(2:end,1)) == max(abs(matrixcorrcoef(2:end,1)))) - 1;

end

% Remove duplicates
maximumWDup = unique(maximum);
vectorRow = zeros(size(maximumWDup));
vectorColumn = zeros(size(maximumWDup));
stringrow = '';
stringcolumn = '';

% Obtains the values of row&column, and parses a string for HALCON
for i = 1:numel(maximumWDup)
    vectorRow(i) = defaultRow(maximumWDup(i));
    vectorColumn(i) = defaultColumn(maximumWDup(i));
    stringrow = strcat(stringrow,', ',num2str(vectorRow(i)));
    stringcolumn = strcat(stringcolumn,', ',num2str(vectorColumn(i)));
end
finalRow = strcat('[',stringrow(2:end),']');
finalColumn = strcat('[',stringcolumn(2:end),']');

%%
% Alpha, beta and gamma

alpha = 0;
beta = 0;
gamma = 0;

for i = 1:numel(maximumWDup)
    if (mod(maximumWDup(i),3) == 1)
        alpha = alpha + 1;
    elseif (mod(maximumWDup(i),3) == 2)
        beta = beta + 1;
    else
        gamma = gamma + 1;
    end
end

parameters = [alpha, beta, gamma];

% vectorRow(1,k) = defaultRow(maximum(1,k));
% vectorColumn(1,k) = defaultColumn(maximum(1,k));

% vectorRowComputed = round(mean(vectorRow,1));
% vectorColumnComputed = round(mean(vectorColumn,1));
% 
% grid_length = 25;
% num_points = 7;
% 
% [finalRow,finalColumn] = newgrid(vectorRowComputed,vectorColumnComputed,grid_length,num_points);

end