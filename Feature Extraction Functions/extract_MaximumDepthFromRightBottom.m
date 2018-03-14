function maxDepth = extract_MaximumDepthFromRightBottom(glyph)
%maxDepth = extract_MaximumDepthFromRightBottom(glyph)

map = glyph.binaryPixelMap;

dims = size(map);
numRows = dims(1);
numCols = dims(2);

stop = ceil((9/10) * numRows);
middle = floor(numRows/2);

maxDepth = 0;

indices = 1:numCols;
indices = fliplr(indices);

for row=middle:stop
    maxDepth = max([maxDepth, min(indices(map(row,:)))]);
end

maxDepth = maxDepth / numCols;

end

