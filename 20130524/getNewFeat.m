function newFeat = getNewFeat(dataset,maximum,exp)

load(dataset);

if exp == 1
    features = features_1;
else
    features = features_2;
end

if max(maximum) > size(features,2)/3
    disp('something is wrong with the indexes');
end

newFeat = zeros(size(features,1),3*numel(maximum));
vectorIndexOld = zeros(1,size(maximum)*3);


for i = 1:numel(maximum)
    vectorIndexOld(3*i-2:3*i) = (3*maximum(i)-2):(3*maximum(i));
end

for i = 1:size(newFeat,1)
    for j = 1:size(newFeat,2)
        newFeat(i,j) = features(i,vectorIndexOld(j));
    end
end


end