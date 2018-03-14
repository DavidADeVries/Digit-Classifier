function maxDepth = extract_MaximumDepthFromLeftBottom(glyph)
%maxDepth = extract_MaximumDepthFromLeftBottom(glyph)

map = glyph.binaryPixelMap;

dims = size(map);
numRows = dims(1);
numCols = dims(2);

stop = ceil((9/10) * numRows);
middle = floor(numRows/2);

maxDepth = 0;

indices = 1:numCols;

for row=middle:stop
    maxDepth = max([maxDepth, min(indices(map(row,:)))]);
end

maxDepth = maxDepth / numCols;

end

