function maxHeightLocation = extract_MaximumHeightLocation(glyph)
%maxWidthLocation = extract_MaximumHeightLocation(glyph)

map = glyph.binaryPixelMap;

colSums = sum(map,1);

maxColSum = max(colSums);

dims = size(map);

numCols = dims(2);

cols = 1:numCols;

cols = cols(colSums == maxColSum);

maxWidthCol = mean(cols);

maxHeightLocation = maxWidthCol ./ numCols;


end

