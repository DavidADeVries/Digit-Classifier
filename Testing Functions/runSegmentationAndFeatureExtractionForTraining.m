function [] = runSegmentationAndFeatureExtractionForTraining()
%[] = runSegmentationAndFeatureExtractionForTrainging()

path = 'C:\Users\David\OneDrive\Master''s Year 1\CSIC 859\Classifer Project\My Digits';

filenames = {...
    '[150dpi, Reg, Reg, Reg] 0.png',...
    '[150dpi, Reg, Reg, Reg] 1.png',...
    '[150dpi, Reg, Reg, Reg] 2.png',...
    '[150dpi, Reg, Reg, Reg] 3.png',...
    '[150dpi, Reg, Reg, Reg] 4.png',...
    '[150dpi, Reg, Reg, Reg] 5.png',...
    '[150dpi, Reg, Reg, Reg] 6.png',...
    '[150dpi, Reg, Reg, Reg] 7.png',...
    '[150dpi, Reg, Reg, Reg] 8.png',...
    '[150dpi, Reg, Reg, Reg] 9.png'
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

plotFeatures3D(allGlyphs, 20, 'leftSideContourSwitches', 'leftSideContourMagnitude', 'rightSideContourMagnitude');

table = getTableForGlyphs(allGlyphs);

save('C:\Code Space\Digit-Classifier Data\Table.mat','table');

end

