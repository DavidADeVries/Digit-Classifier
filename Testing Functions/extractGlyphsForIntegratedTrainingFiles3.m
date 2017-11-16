function [] = extractGlyphsForIntegratedTrainingFiles3()
%[] = extractGlyphsForIntegratedTrainingFiles()

path = 'C:\Users\David\OneDrive\Master''s Year 1\CSIC 859\Classifer Project\My Digits\Multiple Fonts';
outputPath = 'C:\Users\David\OneDrive\Master''s Year 1\CSIC 859\Classifer Project\My Digits\Multiple Fonts Glyphs';

filenames = {...
    '0-BI.png',...
    '1-BI.png',...
    '2-BI.png',...
    '3-BI.png',...
    '4-BI.png',...
    '5-BI.png',...
    '6-BI.png',...
    '7-BI.png',...
    '8-BI.png',...
    '9-BI.png'
    };

matchingTrueClasses = {...
    Classes.zero,...
    Classes.one,...
    Classes.two,...
    Classes.three,...
    Classes.four,...
    Classes.five,...
    Classes.six,...
    Classes.seven,...
    Classes.eight,...
    Classes.nine,...
};

select = true & [1 1 1 1 1 1 1 1 1 1];

filenames = filenames(select);
matchingTrueClasses = matchingTrueClasses(select);

numFiles = length(filenames);

allGlyphs = {};

data = load('C:\Code Space\Digit-Classifier Data\Multiple Fonts BI File Split Points.mat');

splitRows = data.rows;
splitCols = data.cols;

colFileNames = {'Train', 'Test', 'Final'};
rowFileNames = {...
    '_BI'};

numRows = 1;
numCols = 3;

for i=3:numFiles
    disp(['File: ', num2str(i), '/', num2str(numFiles)]);
    % *********************************************************************
    % read in file
    % *********************************************************************
    rawImage = imread(makePath(path, filenames{i}));
    
    rawImage = double(rawImage);
    rawImage = rgb2gray(rawImage);
    
    dims = size(rawImage);
    
    splitRows(end) = dims(1);
    splitCols(end) = dims(2);
    % *********************************************************************
    % auto-threshold convert to binary map
    % *********************************************************************
    binaryImage = convertGrayscaleToBinary(rawImage); %darker is true, lighter is false
    
    for r=1:numRows
        for c=1:numCols
            rStart = splitRows(r);
            rEnd = splitRows(r+1);
            
            cStart = splitCols(c);
            cEnd = splitCols(c+1);
            
            image = binaryImage(rStart:rEnd,cStart:cEnd);
    
            % *********************************************************************
            % extract individual regions, remove specks
            % *********************************************************************
            
            [glyphs, averageGlyphSize] = extractGlyphsWithAreaFilling(image);
            
            for j=1:length(glyphs)
                glyphs{j} = glyphs{j}.setTrueClass(matchingTrueClasses{i});
            end
            
            %glyphs = removeSpecks(glyphs, averageGlyphSize);
            
            filename = [num2str(i-1), ' - ', colFileNames{c}, ' [', rowFileNames{r}, '].mat'];
            
            save(makePath(outputPath, filename), 'glyphs');
        end
    end
    % *********************************************************************
    % extract features
    % *********************************************************************
    
%     for j=1:length(glyphs)
%         glyphs{j} = glyphs{j}.extractAndSetFeatures();
%         glyphs{j} = glyphs{j}.setTrueClass(matchingTrueClasses{i});
%     end
%     
%     allGlyphs = [allGlyphs; glyphs];
end

% plotFeatures3D(allGlyphs, 20, 'leftSideContourSwitches', 'leftSideContourMagnitude', 'rightSideContourMagnitude');
% 
% table = getTableForGlyphs(allGlyphs);
% 
% save('C:\Code Space\Digit-Classifier Data\Table.mat','table');

end

