clc;clear all;close all;
format long

% ------- only modify here ------- %

fileFolder=fullfile('./data');

z1 = 1:2.5/200:3.5;
z2 = 0.09:0.05/100:0.14;

markerSize = 2;
k = 1.8;

% -------------------------------- %

dirOutput=dir(fullfile(fileFolder,'*'));
fileDirs={dirOutput.name}';
for i = 1:length(fileDirs)
    if strcmp(fileDirs{i},'.') || strcmp(fileDirs{i},'..')
        continue
    end
    filePath = fullfile(fileFolder,fileDirs{i},'*');
    dirOutput = dir(filePath);
    fileNames={dirOutput.name}';
    color = [rand(1) rand(1) rand(1)];
    for j = 1:length(fileNames)
        if strcmp(fileNames{j},'.') || strcmp(fileNames{j},'..')
            continue
        end
        name = fileNames(j);
        S = regexp(name, '_', 'split');
        x = str2double(S{1}{1});
        y = str2double(S{1}{2}(1:end-4));
        plot(x,y,'-s','markersize',markerSize,'MarkerEdgeColor',color,'MarkerFaceColor',color); hold on
    end
end

set(gcf,'color',[1 1 1],'position',[200,200,length(z1)*markerSize*k,length(z2)*markerSize*k]);
set(gca,'color',[0 0 0]);

xStep = (z1(2)-z1(1))/2;
yStep = (z2(2)-z2(1))/2;
xlim([z1(1)-xStep,z1(end)+xStep]);
ylim([z2(1)-yStep,z2(end)+yStep]);

