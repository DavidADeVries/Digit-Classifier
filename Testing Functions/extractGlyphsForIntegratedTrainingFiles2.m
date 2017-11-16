function [] = extractGlyphsForIntegratedTrainingFiles2()
%[] = extractGlyphsForIntegratedTrainingFiles()

path = 'C:\Users\David\OneDrive\Master''s Year 1\CSIC 859\Classifer Project\My Digits\Multiple Fonts';
outputPath = 'C:\Users\David\OneDrive\Master''s Year 1\CSIC 859\Classifer Project\My Digits\Multiple Fonts Glyphs';

filenames = {...
    '0.png',...
    '1.png',...
    '2.png',...
    '3.png',...
    '4.png',...
    '5.png',...
    '6.png',...
    '7.png',...
    '8.png',...
    '9.png'
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

data = load('C:\Code Space\Digit-Classifier Data\Multiple Fonts File Split Points.mat');

splitRows = data.rows;
splitCols = data.cols;

colFileNames = {'Train', 'Test', 'Final'};
rowFileNames = {...
    '___',...
    'S__',...
    '_B_',...
    '__I',...
    'SB_',...
    'S_I',...
    'SBI'};

numRows = 7;
numCols = 3;

for i=7:numFiles
    disp(['File: ', num2str(i), '/', num2str(numFiles)]);
    % *********************************************************************
    % read in file
    % *********************************************************************
    rawImage = imread(makePath(path, filenames{i}));
    
    rawImage = double(rawImage);
    
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

