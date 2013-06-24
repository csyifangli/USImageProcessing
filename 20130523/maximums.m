maximum = zeros(2,5);
vectorRow = zeros(size(maximum));
vectorColumn = zeros(size(maximum));

defaultRow = [30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 55, 55, 55, 55, 55, 55, 55, 55, 55, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 105, 105, 105, 105, 105, 105, 105, 105, 105, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 155, 155, 155, 155, 155, 155, 155, 155, 155, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 205, 205, 205, 205, 205, 205, 205, 205, 205, 230, 230, 230, 230, 230, 230, 230, 230, 230, 230, 255, 255, 255, 255, 255, 255, 255, 255, 255, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 305, 305, 305, 305, 305, 305, 305, 305, 305, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 355, 355, 355, 355, 355, 355, 355, 355, 355, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 405, 405, 405, 405, 405, 405, 405, 405, 405, 430, 430, 430, 430, 430, 430, 430, 430, 430, 430, 455, 455, 455, 455, 455, 455, 455, 455, 455, 480, 480, 480, 480, 480, 480, 480, 480, 480, 480];
defaultColumn = [25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475];

for k = 1:5

features_1_mean = zeros(size(features_1,1),size(features_1,2)/3);

for i = 1:size(features_1_mean,1)
    for j = 1:size(features_1_mean,2)
        features_1_mean(i,j) = mean(features_1(i,3*j-2:3*j));
    end
end

matrixcoef = [stim_1(:,k) features_1_mean];
matrixcorrcoef = corrcoef(matrixcoef);
vectorCC = abs(matrixcorrcoef(2:end,1));
matrixccfirstvector = [(1:(size(matrixcorrcoef,2)-1))' vectorCC];

%sort by value of vector (in column 2)
[Y,I] = sort(matrixccfirstvector(:,2));  
 
%reorder according to the indexes of the sorted vector
CC=CC(I,:);    
n = 40;
max_n = vectorCC(1,(end-n+1:end)); %the largest n


maximum(1,k) = find (abs(matrixcorrcoef(2:end,1)) == max(abs(matrixcorrcoef(2:end,1)))) - 1;
vectorRow(1,k) = defaultRow(maximum(1,k));
vectorColumn(1,k) = defaultColumn(maximum(1,k));
end

for k = 1:5

features_2_norm = zeros(size(features_2,1),size(features_2,2)/3);

for i = 1:size(features_2_norm,1)
    for j = 1:size(features_2_norm,2)
        features_2_norm(i,j) = norm(features_2(i,3*j-2:3*j));
    end
end

matrixcoef2 = [stim_2(:,k) features_2_norm];
matrixcorrcoef2 = corrcoef(matrixcoef2);
maximum(2,k) = find (abs(matrixcorrcoef2(2:end,1)) == max(abs(matrixcorrcoef2(2:end,1)))) - 1;
vectorRow(2,k) = defaultRow(maximum(2,k));
vectorColumn(2,k) = defaultColumn(maximum(2,k));
end

vectorRowComputed = round(mean(vectorRow,1));
vectorColumnComputed = round(mean(vectorColumn,1));

grid_length = 25;
num_points = 7;

[finalRow,finalColumn] = newgrid(vectorRowComputed,vectorColumnComputed,grid_length,num_points);