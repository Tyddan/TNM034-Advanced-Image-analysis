function strout = tnm034(testImage)


% Get stafflines
[peaks, staffLocations, imageRotated] = GetStaffLines(testImage);
%%
% Look at things
%     figure();
%     imshow(imageRotated)
    %for i = 1:size(stafflocations,1)
    % for i = 1:size(stafflocations,1)
    %    plot([1;size(imrotated,2)], [stafflocations(i,1);stafflocations(i,1)] , 'r');
    % end

%Whitespace
whiteSpaceMedian = whitespaceLength(staffLocations,imageRotated);
%%
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
image = removeGcleff(imageRotated);

%%
    
%imshow(image)
%Create a mask
dividedImage = createMask(image,whiteSpaceMedian, staffLocations, peaks);

%% Remove siteenth notes


image = removeSixteenNotes(whiteSpaceMedian,dividedImage,peaks);

%Centroids
centroids = findCentroids(image,peaks,whiteSpaceMedian);
%%
% Pitchlines
pitchLines = findPitchLines(staffLocations, whiteSpaceMedian, peaks);
%%
% Find note
strout = findNote(centroids, pitchLines);


end

