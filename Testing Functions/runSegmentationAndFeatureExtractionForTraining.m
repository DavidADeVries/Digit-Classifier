function [] = runSegmentationAndFeatureExtractionForTraining()
%[] = runSegmentationAndFeatureExtractionForTrainging()

path = 'C:\Users\David\OneDrive\Master''s Year 1\CSIC 859\Classifer Project\Digit Files';

filenames = {...
    'zeros.gif',...
    'ones.gif',...
    'twos.gif',...
    'threes.gif',...
    'fours.gif',...
    'fives.gif',...
    'sixes.gif',...
    'sevens.gif',...
    'eights.gif',...
    'nines.gif'
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

for i=1:numFiles
    disp(['File: ', num2str(i), '/', num2str(numFiles)]);
    % *********************************************************************
    % read in file
    % *********************************************************************
    rawImage = imread(makePath(path, filenames{i}));
    
    rawImage = double(rawImage);
    % *********************************************************************
    % auto-threshold convert to binary map
    % *********************************************************************
    binaryImage = convertGrayscaleToBinary(-rawImage); %darker is true, lighter is false
    
    % *********************************************************************
    % extract individual regions, remove specks
    % *********************************************************************
    
    [glyphs, averageGlyphSize] = extractGlyphsWithAreaFilling(binaryImage);
        
    glyphs = removeSpecks(glyphs, averageGlyphSize);
    
    % *********************************************************************
    % extract features
    % *********************************************************************
    
    for j=1:length(glyphs)
        glyphs{j} = glyphs{j}.extractAndSetFeatures();
        glyphs{j} = glyphs{j}.setTrueClass(matchingTrueClasses{i});
    end
    
    allGlyphs = [allGlyphs; glyphs];
end

plotFeatures3D(allGlyphs, 20, 'topLeftBottomRightSymmetry', 'aspectRatio', 'topRightBottomLeftSymmetry');

table = getTableForGlyphs(allGlyphs);

end

