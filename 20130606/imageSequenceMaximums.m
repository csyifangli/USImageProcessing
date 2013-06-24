function imageSequenceMaximums( dataset, exp, finger, freq, nrOfMaximums )

close all; clc;

defaultRow = [30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 55, 55, 55, 55, 55, 55, 55, 55, 55, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 105, 105, 105, 105, 105, 105, 105, 105, 105, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 155, 155, 155, 155, 155, 155, 155, 155, 155, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 205, 205, 205, 205, 205, 205, 205, 205, 205, 230, 230, 230, 230, 230, 230, 230, 230, 230, 230, 255, 255, 255, 255, 255, 255, 255, 255, 255, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 305, 305, 305, 305, 305, 305, 305, 305, 305, 330, 330, 330, 330, 330, 330, 330, 330, 330, 330, 355, 355, 355, 355, 355, 355, 355, 355, 355, 380, 380, 380, 380, 380, 380, 380, 380, 380, 380, 405, 405, 405, 405, 405, 405, 405, 405, 405, 430, 430, 430, 430, 430, 430, 430, 430, 430, 430, 455, 455, 455, 455, 455, 455, 455, 455, 455, 480, 480, 480, 480, 480, 480, 480, 480, 480, 480];
defaultColumn = [25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475, 50, 100, 150, 200, 250, 300, 350, 400, 450, 25, 75, 125, 175, 225, 275, 325, 375, 425, 475];

% Time pause
timePause = 1/freq;

% Paths for parsing Create an array of filenames that make up the image sequence
path = strcat('C:', filesep, 'datasets', filesep, dataset, filesep, num2str(exp), filesep);
maxPath = strcat(path, 'maximums', num2str(nrOfMaximums));
imgPath = strcat(path, 'images', filesep);
dirOutput = dir(fullfile(imgPath,'*.png'));
fileNames = {dirOutput.name}';
clear dirOutput;

% Loading stim for obtaining only the desired images
disp('Loading stimulus....')
load (strcat(path, 'stim.mat'));
picturesDesiredFinger = find(stim(:,6) == finger);
clear stim;
numFrames = numel(picturesDesiredFinger);
disp('Stimulus OK')

% Loading stim for obtaining only the desired images
disp('Loading features....')
load (strcat(path, 'features.mat'));
disp('Features OK')

% Allocation of maximums
load(maxPath);
maximumPoints = maximums(finger,:);
points = zeros(size(maximumPoints));
vectorX = zeros(size(maximumPoints));
vectorY = zeros(size(maximumPoints));
I = imread([imgPath fileNames{1}]);

% Position of maximums
for j = 1:size(maximums,2)
        points(j) = 1+floor((maximumPoints(j)-1)/3);
end
vectorX = defaultColumn(points); vectorY = defaultRow(points);
vectorXLine = [vectorX; zeros(size(vectorX))]; vectorYLine = [vectorY; zeros(size(vectorY))];

vectorPositionsFeatX = 3*points-2; vectorPositionsFeatY = vectorPositionsFeatX+1;

% View results
figure;

for k = 1:numFrames
    clc; disp(fileNames{picturesDesiredFinger(k)});
    imdisp(imread([imgPath fileNames{picturesDesiredFinger(k)}]));
    hold on
    plot(vectorX,vectorY,'xr');
    vectorXLine(2,:) = vectorXLine(1,:) + 25*features(picturesDesiredFinger(k), vectorPositionsFeatX);
    vectorYLine(2,:) = vectorYLine(1,:) + 25*features(picturesDesiredFinger(k), vectorPositionsFeatY);
    line(vectorXLine,vectorYLine,'Color','y');
    hold off
    pause(timePause);
end
close all; clc;
end

