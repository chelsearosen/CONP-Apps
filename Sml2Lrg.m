function ratio = Sml2Lrg(I)

% Team Name: CONP Apps
% Group Members:Chelsea,Omar,Nico,Peyton
% Course: BME3053C Computer Applications for BME
% Term: Fall 2020
% J. Crayton Pruitt Family Department of Biomedical Engineering
% University of Florida

% Establishes a function that will find the ratio of the small lung in LungScan versus the large lung in LungScan;

    F = LungScan(I);
    % Uses LungScan which shows the area of the lungs that are darker, or don't have pneumonia
    t = 0;
    % initialize t, which is a counter
    for i = 1:size(F,1)
    % goes to the end of the row value of F
        for j = 1:size(F,2)
        % goes to the end of the column value in F
            if F(i,j) == 1
                if sum(F(1:end,j+1)) == 0
                t = t +1;
                tight(t) = j;
                end
            end
            % if the pixel is white and the next row over is completely dark or equal to zero
            % then add the column value of that pixel into vector tight
        end
    end
    tight = min(tight);
    % take the minimum value of the vector tight, which will be used to split the image F between left and right;
    Fl = F(:,1:tight)
    % splits the image F into a left image containing only the left lung
    Fr = F(:,tight:end);
    % splits the image F into a right image containg only the right lung
    if nnz(Fl)<=nnz(Fr)
        ratio = nnz(Fl)/nnz(Fr);
    else
        ratio = nnz(Fr)/nnz(Fl);
    end
    % the ratio is equal to the number of non-zero elements of the smaller lung over the number of
    % non-zero elements of the larger lung
end
