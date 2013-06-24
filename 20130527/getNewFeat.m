function newFeat = getNewFeat(dataset,maximum,exp)

load(dataset);

if exp == 1
    features = features_1;
else
    features = features_2;
end

if max(maximum) > size(features,2)
    disp('something is wrong with the indexes');
end

newFeat = zeros(size(features,1),numel(maximum));

for i = 1:size(newFeat,1)
    for j = 1:size(newFeat,2)
        newFeat(i,j) = features(i,maximum(j));
    end
end


end