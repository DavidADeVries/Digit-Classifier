function [glyphs, averageGlyphSize] = extractGlyphsWithAreaFilling_4con(binaryImage)
%[glyphs, averageGlyphSize] = extractGlyphsWithAreaFilling_4con(binaryImage)


dims = size(binaryImage);

numGlyphs = 0;

glyphMap = zeros(dims);

for px=1:numel(binaryImage)
    if binaryImage(px) && glyphMap(px)==0 %is inked and is not part of a glpyh already
        numGlyphs = numGlyphs + 1;
        
        glyphMask = performRegionFill(binaryImage, px, dims);
        
        glyphMap(glyphMask) = numGlyphs;        
    end
end

glyphs = cell(numGlyphs,1);
glyphSizes = zeros(numGlyphs,1);

indicesMap = 1:numel(binaryImage);
indicesMap = reshape(indicesMap, dims);

for glyphNum=1:numGlyphs
    glyphMask = (glyphMap == glyphNum);
    
    glyphSizes(glyphNum) = sum(sum(glyphMask));
    
    indices = indicesMap(glyphMask);
    
    [yCoords, xCoords] = ind2sub(dims, indices);
    
    minX = min(xCoords);
    maxX = max(xCoords);
    
    minY = min(yCoords);
    maxY = max(yCoords);
    
    x = minX;
    y = minY;
    w = maxX - minX;
    h = maxY - minY;
    
    tempBinaryImage = false & zeros(dims);
    tempBinaryImage(glyphMask) = true;
    
    glyphs{glyphNum} = Glyph(...
        tempBinaryImage(minY:maxY, minX:maxX),...
        [x, y, w, h]...
        );
end

averageGlyphSize = mean(glyphSizes);

end

% HELPER FUNCTIONS
function glyphMask = performRegionFill(binaryImage, px, dims)
    numPxs = numel(binaryImage);

    activeSearchPixels = false & zeros(numPxs,1);
    activeSearchPixels(px) = true;
    
    glyphMask = false & zeros(dims);
    
    numAddedPixels = Inf;
    
    pixelIndices = 1:numPxs;
    
    while numAddedPixels > 0
        
        activePixels = pixelIndices(activeSearchPixels);
        
        addMask = zeros(dims);
        
        for i=1:length(activePixels)
            [pxX,pxY] = ind2sub(dims, activePixels(i));
            
            addCoords = [...
                pxX-1, pxY;...
                pxX, pxY-1;...
                pxX+1, pxY;...
                pxX, pxY+1];
            
            badXVals = addCoords(:,1) < 1 | addCoords(:,1) > dims(1);
            badYVals = addCoords(:,2) < 1 | addCoords(:,2) > dims(2);
            
            numPoints = 4;
            deleteRows = (1:numPoints)';
            deleteRows = deleteRows(badXVals | badYVals);
            
            addCoords(deleteRows,:) = [];
            
            addIndices = sub2ind(dims, addCoords(:,1), addCoords(:,2));
                        
            addMask(addIndices) = true;
        end
        
        addToGlyph = addMask & binaryImage & ~glyphMask; % must be part of add radius, inked, and not part of glyph already
        
        glyphMask(addToGlyph) = true;
        
        numAddedPixels = sum(sum(addToGlyph));
        
        activeSearchPixels(activePixels) = false;
        activeSearchPixels(addToGlyph) = true;
    end
end