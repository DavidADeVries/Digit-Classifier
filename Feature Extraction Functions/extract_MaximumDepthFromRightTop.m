function maxDepth = extract_MaximumDepthFromRightTop(glyph)
%maxDepth = extract_MaximumDepthFromRightTop(glyph)

map = glyph.binaryPixelMap;

dims = size(map);
numRows = dims(1);
numCols = dims(2);

start = floor((1/10) * numRows);
middle = ceil(numRows/2);

maxDepth = 0;

indices = 1:numCols;
indices = fliplr(indices);

for row=start:middle
    maxDepth = max([maxDepth, min(indices(map(row,:)))]);
end

maxDepth = maxDepth / numCols;

end

