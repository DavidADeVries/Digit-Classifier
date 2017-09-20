function [] = runSegmentationAndFeatureExtraction()
%[] = runSegmentationAndFeatureExtraction()

path = 'C:\Users\David\OneDrive\Master''s Year 1\CSIC 859\Classifer Project\Digit Files';

filenames = {...
    'digits.gif'...
    };

numFiles = length(filenames);

for i=1:numFiles
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
    
%     [glyphs, averageGlyphSize] = extractGlyphsWithAreaFilling(binaryImage);
    
    data = load('C:\Code Space\Digit-Classifier Data\Ray Glyphs.mat');
    
    glyphs = data.glyphs;
    averageGlyphSize = data.averageGlyphSize;
    
    glyphs = removeSpecks(glyphs, averageGlyphSize);
    
    % *********************************************************************
    % extract features
    % *********************************************************************
    
    for j=1:length(glyphs)
        glyphs{j} = glyphs{j}.extractAndSetFeatures();
    end
end


end

