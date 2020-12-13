function LungScanFinal = LungScan(I)

% Team Name: CONP Apps
% Group Members:Chelsea,Omar,Nico,Peyton
% Course: BME3053C Computer Applications for BME
% Term: Fall 2020
% J. Crayton Pruitt Family Department of Biomedical Engineering
% University of Florida

%Functions results in a B&W Picture where inside of lungs are white and outside(or
%infront of heart) is black

%this is used to find where the lungs are in any chest xray

sz = floor(length(I)/30);
% Set GS and Adjust Contrast
I = im2gray(I);
testAdj = imadjust(I);
% Invert color
testinv = 255 - testAdj;
% Clear Border
testinvclr = imclearborder(testinv);
% Invert
testclr = 255 - testinvclr;
% Threshold
testclr(testclr>210) = 0;
% Binarize
BWtest = imbinarize(testclr,'adaptive');
% Structural Element
SE = strel('disk',sz);
SE2 = strel('diamond',sz);
% Close Image
LungScan1 = imclose(BWtest,SE);
LungScan2 = imclose(LungScan1,SE2);
% Fill gaps
LungArea = imfill(LungScan2,'holes');

%%
%Cleanup of extra bits

% Split pic in half
R = LungArea(:,(end/2):end);
L = LungArea(:,1:(end/2));
% Pull Largest Blob on Right
LungRScan = bwlabeln(R);
Rstats = regionprops(LungRScan,'Area',"Centroid");
RA = [Rstats.Area];
RA = find(RA == max(RA));
LungRScan(LungRScan~=RA) = 0;
% Pull Largest Blob on Left
LungLScan = bwlabeln(L);
Lstats = regionprops(LungLScan,'Area','Centroid');
LA = [Lstats.Area];
LA = find(LA == max(LA));
LungLScan(LungLScan~=LA) = 0;
% Concatenate both sides
LungScanFinal = [LungLScan LungRScan];
end
