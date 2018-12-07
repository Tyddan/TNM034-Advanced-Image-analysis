function strout = tnm034(testImage)

% Get stafflines
[peaks, staffLocations, imageRotated] = GetStaffLines(testImage);
%%
% Look at things
    %figure();
    %imshow(imageRotated)for i = 1:size(stafflocations,1)
    % for i = 1:size(stafflocations,1)
    %    plot([1;size(imrotated,2)], [stafflocations(i,1);stafflocations(i,1)] , 'r');
    % end

%Whitespace
[whiteSpaceMedian, segmentLocs] = whitespaceLength(staffLocations,imageRotated);

% Look at things
    % figure();
    % imshow(imrotated);
    % hold on;
    % for i=1:size(segmentLocs,2)
    %     plot([1;size(imrotated,2)],[segmentLocs(1,i);segmentLocs(1,i)],'m');
    % end
    % hold off;
    % 
    % 
    % for j = 1:size(stafflocations)
    %     locsIncreased(j,:) = [stafflocations(j,1)-1 stafflocations(j,1) stafflocations(j,1)+1];  
    % end
    
%Create a mask
[dividedImage,peaks] = createMask(imageRotated,whiteSpaceMedian);

%Centroids
centroids = findCentroids(dividedImage,peaks);

% Pitchlines
pitchLines = findPitchLines(staffLocations, whiteSpaceMedian, peaks);

% Find note
strout = findNote(centroids, pitchLines);



end
