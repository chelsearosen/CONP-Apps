function AVG = ChestInt(I)

% Group Members:Chelsea,Omar,Nico,Peyton
% Course: BME3053C Computer Applications for BME
% Term: Fall 2020
% J. Cratron Pruitt Family Department of Biomedical Engineering
% University of Florida

sz = floor(length(I)/30);
SE = strel('disk',sz);
I = im2gray(I);
I  = imadjust(I);
Edge1 = edge(I,'Canny','nothinning');%small Struct Element
Dilated = imclose(Edge1,SE);%close image
DilatedH = imfill(Dilated,'holes');%fill holes
Torso = bwlabeln(DilatedH);%label torso scan
TStats = regionprops(Torso,'area');%pull largest area
TA = [TStats.Area];
TA = find(TA == max(TA));
Torso(Torso~=TA) = 0;%clear smaller blobs
TStats = regionprops(Torso,'Centroid');
TS = [TStats.Centroid];
[TS] = maxk(TS,2);
    if height(I) > width(I)
        [TS] = flip(TS);
    end
ChestOnly = imcrop(I,[TS(1)/3,TS(2)/3,TS(1)*1.5,TS(2)*1.5]);%crop around chest
AVG = mean2(ChestOnly);%average of inside chest
end