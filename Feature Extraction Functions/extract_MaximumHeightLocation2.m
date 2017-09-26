function maxHeightLocation = extract_MaximumHeightLocation2(glyph)
%maxWidth = extract_MaximumWidthLocation(glyph)

map = glyph.binaryPixelMap;

dims = size(map);

numRows = dims(1);
numCols = dims(2);

heights = zeros(numCols,1);

for c=1:numCols
    rowNums = 1:numRows;
    rowNums = rowNums(map(:,c));
    
    heights(c) = rowNums(end)-rowNums(1);
end

maxHeight = max(heights);

cols = 1:numCols;

cols = cols(heights == maxHeight);

maxHeightRow = mean(cols);

maxHeightLocation = maxHeightRow ./ numCols;


end

