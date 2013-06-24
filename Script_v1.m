%% LOADER and parser
close all, clear all;
clc;

file_path = 'C:\datasets\rashida\2\';
file_path2 = strcat(file_path,'images\0');
names = dir([file_path2 '*']);

fid = fopen([file_path 'names.txt'],'w');
for i = 1:numel(names)
    fprintf(fid,'%s ', names(i).name);
end
% fprintf(fid,'%s', names(numel(names)).name);
% fprintf(fid,aw);
fclose(fid);