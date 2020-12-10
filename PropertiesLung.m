clc; clear; close all;
%Extracting lung properties from chest x-rays

%Create datastores
dsTrain = imageDatastore("Training Data", 'IncludeSubfolders', true);
dsTest = imageDatastore("Testing Data", 'IncludeSubfolders', true);

%create tables to store data
TrainData = table('Size', [numel(dsTrain.Files) 3], 'VariableTypes', {'double', 'double', 'string'}, 'VariableNames', {'s2l', 'Int', 'State'});
TestData = table('Size', [numel(dsTest.Files) 3], 'VariableTypes', {'double', 'double', 'string'}, 'VariableNames', {'s2l', 'Int', 'State'});

%Extract the properties of each chest x-ray in the datastores 
for k = 1:numel(dsTrain.Files)
    I = readimage(dsTrain,k);
    TrainData{k,1} = Sml2Lrg(I);
    TrainData{k,2} = ChestInt(I);
    if k<=20
        TrainData{k,3} = 'N';
    else
        TrainData{k,3} = 'P';
    end
end

save('TrainData.mat', 'TrainData');

for j = 1:numel(dsTest.Files)
    I = readimage(dsTest,j);
    TestData{j,1} = Sml2Lrg(I);
    TestData{j,2} = ChestInt(I);
    if j<=20
        TestData{j,3} = 'N';
    else
        TestData{j,3} = 'P';
    end
end

save('TestData.mat', 'TestData');